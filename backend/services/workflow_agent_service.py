# backend/services/workflow_agent_service.py
"""
Human-in-the-loop workflow agent.
Uses Vertex AI Gemini (gemini-2.0-flash-001) for suggestions.
"""
import json
import logging
import uuid as _uuid
from typing import Any, Dict, List, Optional

import vertexai
from vertexai.generative_models import GenerativeModel, GenerationConfig

from config import settings
from sqlalchemy import text
from sqlalchemy.orm import Session

logger = logging.getLogger(__name__)

_vertex_initialized = False


def _ensure_vertex():
    global _vertex_initialized
    if _vertex_initialized:
        return
    vertexai.init(
        project  = settings.GCS_PROJECT_ID,
        location = settings.VERTEX_AI_LOCATION,
    )
    _vertex_initialized = True


def _call_gemini_json(prompt: str, max_tokens: int = 400) -> str:
    """Call Gemini expecting JSON output."""
    _ensure_vertex()
    model = GenerativeModel(
        "gemini-2.0-flash-001",
        system_instruction="Output only valid JSON. No markdown fences, no explanation, no prose.",
        generation_config=GenerationConfig(
            temperature=0.1,
            max_output_tokens=max_tokens,
        ),
    )
    response = model.generate_content(prompt)
    return (response.text or "").strip()


def _parse_json(raw: str) -> Any:
    if "```" in raw:
        parts = raw.split("```")
        raw   = parts[1] if len(parts) > 1 else parts[0]
        if raw.lstrip().startswith("json"):
            raw = raw.lstrip()[4:]
    return json.loads(raw.strip())


# ── Suggest workflows ─────────────────────────────────────────────

def suggest_workflows(
    db: Session,
    *,
    complaint_id: str,
    city_id: str,
    infra_type_code: str,
    complaint_summary: str,
    priority: str,
    is_repeat: bool,
    authority_code: str,
) -> List[Dict[str, Any]]:
    """
    Returns top-3 workflow template suggestions with Gemini-generated match reasoning.

    Gemini ranks templates by:
    - situation_summary similarity to the complaint
    - situation_keywords overlap with infra_type_code
    - times_used (higher = more trusted)
    - avg_completion_days (lower = faster resolution)
    """
    templates = db.execute(
        text("""
            SELECT
                wt.id, wt.name, wt.description,
                wt.situation_summary, wt.situation_keywords,
                wt.times_used, wt.avg_completion_days,
                COUNT(wts.id) AS step_count,
                wt.metadata
            FROM workflow_templates wt
            LEFT JOIN workflow_template_steps wts ON wts.template_id = wt.id
            WHERE wt.city_id   = CAST(:city_id AS uuid)
              AND wt.is_active = TRUE
            GROUP BY wt.id
            ORDER BY wt.times_used DESC, wt.avg_completion_days ASC
            LIMIT 10
        """),
        {"city_id": city_id},
    ).mappings().all()

    if not templates:
        return []

    template_list = "\n".join(
        f'  id="{t["id"]}" name="{t["name"]}" '
        f'situation="{t["situation_summary"] or "General"}" '
        f'keywords={t["situation_keywords"] or []} '
        f'steps={t["step_count"]} used={t["times_used"]} '
        f'avg_days={t["avg_completion_days"]}'
        for t in templates
    )

    prompt = f"""Select the TOP 3 most suitable workflow templates for this complaint.

NEW COMPLAINT:
  Summary: {complaint_summary}
  Infrastructure: {infra_type_code}
  Priority: {priority}
  Repeat complaint: {is_repeat}
  Authority: {authority_code}

AVAILABLE TEMPLATES:
{template_list}

Return a JSON array (top 3 only):
[
  {{
    "template_id": "<uuid from list>",
    "match_score": 0.95,
    "match_reason": "Used 12 times for pothole repairs on arterial roads, avg 4.2 days",
    "recommended_priority": 1
  }}
]"""

    suggestions = []
    try:
        raw         = _call_gemini_json(prompt, max_tokens=400)
        parsed      = _parse_json(raw)
        suggestions = parsed if isinstance(parsed, list) else []
    except Exception as exc:
        logger.error("Workflow suggestion Gemini failed: %s", exc)
        # Fallback: top 3 by usage count
        suggestions = [
            {
                "template_id":        str(t["id"]),
                "match_score":        0.7,
                "match_reason":       "Most used template",
                "recommended_priority": i + 1,
            }
            for i, t in enumerate(templates[:3])
        ]

    template_map = {str(t["id"]): t for t in templates}
    result       = []

    for s in suggestions[:3]:
        tid  = s.get("template_id")
        tmpl = template_map.get(tid)
        if not tmpl:
            continue

        steps = db.execute(
            text("""
                SELECT step_number, name, description, responsible_role,
                       estimated_duration_days, requires_photo, requires_approval
                FROM workflow_template_steps
                WHERE template_id = CAST(:tid AS uuid)
                ORDER BY step_number
            """),
            {"tid": tid},
        ).mappings().all()

        result.append({
            "template_id":         tid,
            "name":                tmpl["name"],
            "description":         tmpl["description"],
            "situation_summary":   tmpl["situation_summary"],
            "times_used":          tmpl["times_used"],
            "avg_completion_days": float(tmpl["avg_completion_days"] or 0),
            "match_score":         s.get("match_score", 0.7),
            "match_reason":        s.get("match_reason", ""),
            "recommended_priority":s.get("recommended_priority", 1),
            "steps": [
                {
                    "step_number":             step["step_number"],
                    "name":                    step["name"],
                    "description":             step["description"],
                    "responsible_role":        step["responsible_role"],
                    "estimated_duration_days": step["estimated_duration_days"],
                    "requires_photo":          bool(step["requires_photo"]),
                    "requires_approval":       bool(step["requires_approval"]),
                }
                for step in steps
            ],
        })

    return result


# ── Official approves (+ optional edit) → create instance ────────

def create_workflow_from_approval(
    db: Session,
    *,
    complaint_id: str,
    template_id: str,
    official_id: str,
    city_id: str,
    edited_steps: Optional[List[Dict]] = None,
    edit_reason: Optional[str] = None,
    situation_context: Optional[Dict] = None,
) -> Dict[str, Any]:
    """
    Creates a workflow_instance from a template.

    If official edited steps:
      - Saves as a NEW template variant (derived_from = original template_id)
      - Stores situation_context so Gemini can recommend it for similar cases
      - Original template usage count unchanged
      - New template gets times_used = 1

    If no edits:
      - Uses template as-is
      - Bumps template times_used
    """
    was_edited         = bool(edited_steps and edit_reason)
    actual_template_id = template_id

    if was_edited:
        new_template_id   = str(_uuid.uuid4())
        situation_summary = (situation_context or {}).get("complaint_summary", "")

        orig = db.execute(
            text("""
                SELECT name, description, metadata
                FROM workflow_templates WHERE id = CAST(:id AS uuid)
            """),
            {"id": template_id},
        ).mappings().first()

        db.execute(
            text("""
                INSERT INTO workflow_templates (
                    id, city_id, name, description,
                    situation_summary, situation_keywords,
                    times_used, source_complaint_ids,
                    is_active, metadata
                ) VALUES (
                    CAST(:id AS uuid), CAST(:city AS uuid),
                    :name, :desc,
                    :sit_summary, ARRAY[]::text[],
                    1, ARRAY[CAST(:cid AS uuid)],
                    TRUE, CAST(:meta AS jsonb)
                )
            """),
            {
                "id":          new_template_id,
                "city":        city_id,
                "name":        f"{orig['name']} (Edited)",
                "desc":        orig["description"],
                "sit_summary": situation_summary,
                "cid":         complaint_id,
                "meta":        json.dumps({
                    **(orig["metadata"] or {}),
                    "derived_from": template_id,
                    "edit_reason":  edit_reason,
                }),
            },
        )

        for step in (edited_steps or []):
            db.execute(
                text("""
                    INSERT INTO workflow_template_steps (
                        template_id, step_number, name, description,
                        responsible_role, estimated_duration_days,
                        requires_photo, requires_approval
                    ) VALUES (
                        CAST(:tid AS uuid), :num, :name, :desc,
                        :role, :days, :photo, :approval
                    )
                """),
                {
                    "tid":      new_template_id,
                    "num":      step["step_number"],
                    "name":     step["name"],
                    "desc":     step.get("description", ""),
                    "role":     step.get("responsible_role", "official"),
                    "days":     step.get("estimated_duration_days", 1),
                    "photo":    step.get("requires_photo", False),
                    "approval": step.get("requires_approval", False),
                },
            )

        actual_template_id = new_template_id

    # ── Create workflow_instance ──────────────────────────────────
    instance_id  = str(_uuid.uuid4())
    steps_source = db.execute(
        text("""
            SELECT * FROM workflow_template_steps
            WHERE template_id = CAST(:tid AS uuid)
            ORDER BY step_number
        """),
        {"tid": actual_template_id},
    ).mappings().all()

    total_steps = len(steps_source)

    db.execute(
        text("""
            INSERT INTO workflow_instances (
                id, template_id, complaint_id, city_id,
                status, current_step_number, total_steps,
                was_edited_by_official, official_edit_reason,
                original_template_id, situation_context,
                started_at
            ) VALUES (
                CAST(:id AS uuid),   CAST(:tid AS uuid),
                CAST(:cid AS uuid),  CAST(:city AS uuid),
                'active', 1, :total,
                :was_edited, :edit_reason,
                CAST(:orig_tid AS uuid),
                CAST(:sit_ctx AS jsonb),
                NOW()
            )
        """),
        {
            "id":          instance_id,
            "tid":         actual_template_id,
            "cid":         complaint_id,
            "city":        city_id,
            "total":       total_steps,
            "was_edited":  was_edited,
            "edit_reason": edit_reason,
            "orig_tid":    template_id,
            "sit_ctx":     json.dumps(situation_context or {}),
        },
    )

    # Create step instances
    for step in steps_source:
        db.execute(
            text("""
                INSERT INTO workflow_step_instances (
                    workflow_instance_id, step_number, name,
                    status, responsible_role, estimated_duration_days
                ) VALUES (
                    CAST(:wid AS uuid), :num, :name,
                    'pending', :role, :days
                )
            """),
            {
                "wid":  instance_id,
                "num":  step["step_number"],
                "name": step["name"],
                "role": step["responsible_role"],
                "days": step["estimated_duration_days"],
            },
        )

    # Update complaint status
    db.execute(
        text("""
            UPDATE complaints
               SET status              = 'workflow_started',
                   workflow_instance_id = CAST(:wid AS uuid),
                   updated_at          = NOW()
             WHERE id = CAST(:cid AS uuid)
        """),
        {"wid": instance_id, "cid": complaint_id},
    )

    # Bump template usage (original template only, not the edited variant)
    db.execute(
        text("""
            UPDATE workflow_templates
               SET times_used          = times_used + 1,
                   last_used_at        = NOW(),
                   source_complaint_ids = array_append(
                       source_complaint_ids, CAST(:cid AS uuid)
                   )
             WHERE id = CAST(:tid AS uuid)
        """),
        {"tid": template_id, "cid": complaint_id},
    )

    db.commit()

    logger.info(
        "Workflow instance %s created complaint=%s template=%s edited=%s",
        instance_id, complaint_id, actual_template_id, was_edited,
    )

    return {
        "instance_id":       instance_id,
        "template_id":       actual_template_id,
        "was_edited":        was_edited,
        "total_steps":       total_steps,
        "original_template": template_id,
    }