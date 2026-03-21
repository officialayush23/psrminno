# backend/services/crm_agent_service.py
"""
CRM Agent — conversational AI assistant for officials and admins.
Uses Vertex AI Gemini (gemini-2.0-flash-001) — NOT Groq.
Groq (llama-3.3-70b) is used ONLY for department mapping in mapping_service.py.
"""
import json
import logging
import re
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


def _call_gemini(
    system: str,
    prompt: str,
    max_tokens: int = 600,
    temperature: float = 0.2,
) -> str:
    """Single-turn Gemini call."""
    _ensure_vertex()
    model = GenerativeModel(
        "gemini-2.0-flash-001",
        system_instruction=system,
        generation_config=GenerationConfig(
            temperature=temperature,
            max_output_tokens=max_tokens,
        ),
    )
    response = model.generate_content(prompt)
    return (response.text or "").strip()


# ── Context loader ────────────────────────────────────────────────

def _load_official_context(db: Session, user_id: str, role: str) -> Dict[str, Any]:
    """
    Loads a scoped data snapshot.
    super_admin → city-wide
    admin       → department
    official    → branch/jurisdiction
    """
    user = db.execute(
        text("""
            SELECT full_name, department_id, branch_id,
                   jurisdiction_id, city_id
            FROM users WHERE id = CAST(:uid AS uuid)
        """),
        {"uid": user_id},
    ).mappings().first()

    if not user:
        return {}

    scope_where = "c.is_deleted = FALSE AND c.city_id = CAST(:city_id AS uuid)"
    params: Dict[str, Any] = {"city_id": str(user["city_id"])}

    if role == "admin" and user["department_id"]:
        scope_where += " AND CAST(:dept_id AS uuid) = ANY(c.agent_suggested_dept_ids)"
        params["dept_id"] = str(user["department_id"])
    elif role == "official" and user["jurisdiction_id"]:
        scope_where += " AND c.jurisdiction_id = CAST(:jur_id AS uuid)"
        params["jur_id"] = str(user["jurisdiction_id"])

    kpi = db.execute(
        text(f"""
            SELECT
                COUNT(*) FILTER (WHERE c.status NOT IN ('resolved','closed','rejected'))
                                                        AS open_total,
                COUNT(*) FILTER (WHERE c.priority IN ('critical','emergency'))
                                                        AS critical_open,
                COUNT(*) FILTER (WHERE c.is_repeat_complaint = TRUE
                    AND c.status NOT IN ('resolved','closed','rejected'))
                                                        AS repeat_open,
                COUNT(*) FILTER (WHERE c.status = 'received'
                    AND c.created_at < NOW() - INTERVAL '3 days')
                                                        AS stale_unassigned,
                COUNT(*) FILTER (WHERE c.status NOT IN ('resolved','closed','rejected')
                    AND c.created_at < NOW() - INTERVAL '30 days')
                                                        AS sla_breach_risk
            FROM complaints c
            WHERE {scope_where}
        """),
        params,
    ).mappings().first()

    oldest = db.execute(
        text(f"""
            SELECT c.complaint_number, c.title, c.status, c.priority,
                   c.created_at, c.address_text,
                   it.code AS infra_code,
                   EXTRACT(DAY FROM NOW() - c.created_at)::int AS age_days
            FROM complaints c
            LEFT JOIN infra_nodes n  ON n.id  = c.infra_node_id
            LEFT JOIN infra_types it ON it.id = n.infra_type_id
            WHERE {scope_where}
              AND c.status NOT IN ('resolved','closed','rejected')
            ORDER BY c.created_at ASC LIMIT 5
        """),
        params,
    ).mappings().all()

    stale_tasks = db.execute(
        text("""
            SELECT t.id, t.title, t.status, t.priority, t.created_at,
                   w.full_name AS worker_name,
                   co.company_name AS contractor_company
            FROM tasks t
            LEFT JOIN workers     wk ON wk.id = t.assigned_worker_id
            LEFT JOIN users       w  ON w.id  = wk.user_id
            LEFT JOIN contractors co ON co.id = t.assigned_contractor_id
            WHERE t.city_id  = CAST(:city_id AS uuid)
              AND t.status   = 'assigned'
              AND t.created_at < NOW() - INTERVAL '2 days'
            ORDER BY t.priority DESC, t.created_at ASC LIMIT 5
        """),
        {"city_id": str(user["city_id"])},
    ).mappings().all()

    survey_alerts = db.execute(
        text("""
            SELECT si.id, si.survey_type,
                   AVG(sr.rating) AS avg_rating,
                   COUNT(*)       AS response_count,
                   c.complaint_number, c.title
            FROM survey_instances  si
            JOIN survey_responses  sr ON sr.survey_instance_id = si.id
            JOIN complaints        c  ON c.id = si.complaint_id
            WHERE si.city_id = CAST(:city_id AS uuid)
              AND sr.created_at > NOW() - INTERVAL '7 days'
              AND sr.rating IS NOT NULL
            GROUP BY si.id, c.complaint_number, c.title
            HAVING AVG(sr.rating) < 3.0
            ORDER BY avg_rating ASC LIMIT 5
        """),
        {"city_id": str(user["city_id"])},
    ).mappings().all()

    return {
        "user_name":     user["full_name"],
        "role":          role,
        "kpi":           dict(kpi) if kpi else {},
        "oldest_open":   [dict(r) for r in oldest],
        "stale_tasks":   [dict(r) for r in stale_tasks],
        "survey_alerts": [dict(r) for r in survey_alerts],
    }


# ── Daily briefing ────────────────────────────────────────────────

def get_daily_briefing(db: Session, user_id: str, role: str) -> Dict[str, Any]:
    """
    Returns structured briefing + an AI-generated greeting.
    Called on frontend dashboard load.
    """
    ctx = _load_official_context(db, user_id, role)
    if not ctx:
        return {"greeting": "Namaskar! Dashboard data is loading.", "sections": []}

    kpi          = ctx.get("kpi", {})
    context_str  = json.dumps(ctx, default=str, indent=2)

    system = (
        "You are PS-CRM, a concise and direct municipal operations assistant for Delhi. "
        "Always be professional, factual, and actionable."
    )
    prompt = (
        f"Write a morning briefing (3-5 sentences, plain text, no bullet points) "
        f"for {ctx['user_name']} ({role}). "
        f"Mention: open complaints count, any critical/emergency issues, "
        f"stale unassigned complaints, survey quality alerts, and 1-2 urgent actions. "
        f"Be direct.\n\nDATA:\n{context_str}"
    )

    greeting = "Namaskar! Here is your morning briefing."
    try:
        greeting = _call_gemini(system, prompt, max_tokens=300, temperature=0.3)
    except Exception as exc:
        logger.error("Briefing Gemini failed: %s", exc)

    sections = []
    if kpi.get("critical_open", 0) > 0:
        sections.append({
            "type":   "alert",
            "title":  f"🔴 {kpi['critical_open']} Critical/Emergency Complaints",
            "action": "Review now",
        })
    if kpi.get("stale_unassigned", 0) > 0:
        sections.append({
            "type":   "warning",
            "title":  f"⚠️ {kpi['stale_unassigned']} complaints unassigned for >3 days",
            "action": "Assign to workers",
        })
    if kpi.get("repeat_open", 0) > 0:
        sections.append({
            "type":   "info",
            "title":  f"↩ {kpi['repeat_open']} repeat complaints still open",
            "action": "Check infra node history",
        })
    if ctx.get("survey_alerts"):
        sections.append({
            "type":   "warning",
            "title":  f"📋 {len(ctx['survey_alerts'])} tasks with poor survey ratings",
            "action": "Investigate quality",
        })
    if kpi.get("sla_breach_risk", 0) > 0:
        sections.append({
            "type":   "warning",
            "title":  f"⏰ {kpi['sla_breach_risk']} complaints at SLA breach risk (>30 days)",
            "action": "Escalate or resolve",
        })

    return {
        "greeting":     greeting,
        "kpi":          kpi,
        "sections":     sections,
        "oldest_open":  ctx.get("oldest_open", []),
        "stale_tasks":  ctx.get("stale_tasks", []),
        "survey_alerts":ctx.get("survey_alerts", []),
    }


# ── Conversational query ──────────────────────────────────────────

def chat_with_crm_agent(
    db: Session,
    user_id: str,
    role: str,
    user_message: str,
    conversation_history: List[Dict[str, str]],
) -> Dict[str, Any]:
    """
    Handles natural language queries from officials.

    Example queries the agent handles:
    - "What happened to the contractor working on Dwarka road renovation?"
    - "Show all repeat complaints in Rohini this month"
    - "Which potholes have been stuck over 7 days?"
    - "How many complaints resolved last week?"
    - "Are there multi-department issues pending coordination?"
    - "Status of complaint DEL-2026-001234?"

    Flow:
      1. Build context snapshot
      2. Call Gemini with scoped system prompt + history
      3. If Gemini signals it needs DB data (QUERY_NEEDED:), run safe query
      4. Re-call Gemini with query results to generate final answer
    """
    ctx       = _load_official_context(db, user_id, role)
    user_name = ctx.get("user_name", "Official")
    kpi       = ctx.get("kpi", {})

    system = f"""You are PS-CRM, the AI assistant for Delhi municipal officials.
You have access to real-time data about complaints, workers, contractors, workflows, and surveys.

CURRENT USER: {user_name} ({role})
OPEN COMPLAINTS: {kpi.get('open_total', 'N/A')}
CRITICAL OPEN: {kpi.get('critical_open', 'N/A')}
SLA AT RISK: {kpi.get('sla_breach_risk', 'N/A')}

Rules:
- Be direct and factual — this is a professional tool
- If you need live DB data to answer, output exactly: QUERY_NEEDED: <brief description>
- Reference complaint numbers (DEL-YYYY-XXXXXX) when discussing specific cases
- For multi-department issues, explicitly call out coordination requirements
- If a contractor/worker has performance issues, state it plainly
- Keep responses concise — officials are busy"""

    # Build conversation string (last 3 turns)
    history_str = ""
    for turn in conversation_history[-6:]:
        label = "Official" if turn.get("role") == "user" else "PS-CRM"
        history_str += f"{label}: {turn['content']}\n"

    full_prompt = f"{history_str}Official: {user_message}\nPS-CRM:"

    answer     = ""
    query_data = None

    try:
        answer = _call_gemini(system, full_prompt, max_tokens=600)
    except Exception as exc:
        logger.error("CRM chat Gemini failed: %s", exc)
        return {
            "answer": "I'm having trouble connecting right now. Please try again in a moment.",
            "data":   None,
        }

    # Check if Gemini needs DB data
    if "QUERY_NEEDED:" in answer:
        try:
            query_data = _run_agent_query(db, user_id, role, user_message)
            if query_data:
                followup = (
                    f"{full_prompt}{answer}\n\n"
                    f"DB Results (JSON): {json.dumps(query_data, default=str)}\n\n"
                    f"Now answer the original question concisely using this data:\nPS-CRM:"
                )
                try:
                    answer = _call_gemini(system, followup, max_tokens=600)
                except Exception:
                    pass  # keep the original answer if re-call fails
        except Exception as exc:
            logger.error("Agent query failed: %s", exc)

    return {"answer": answer, "data": query_data}


def _run_agent_query(
    db: Session,
    user_id: str,
    role: str,
    user_message: str,
) -> Optional[List[Dict]]:
    """
    Maps natural language intent to safe, read-only DB queries.
    Fixed query patterns only — no raw SQL injection possible.
    """
    user = db.execute(
        text("SELECT city_id FROM users WHERE id = CAST(:uid AS uuid)"),
        {"uid": user_id},
    ).mappings().first()
    if not user:
        return None

    city_id = str(user["city_id"])
    msg     = user_message.lower()

    # ── Contractor / worker performance ──────────────────────────
    if any(w in msg for w in ["contractor", "company", "firm", "vendor"]):
        rows = db.execute(
            text("""
                SELECT co.company_name, co.performance_score, co.is_blacklisted,
                       COUNT(DISTINCT t.id)                                   AS total_tasks,
                       COUNT(t.id) FILTER (WHERE t.status = 'completed')      AS completed,
                       COUNT(t.id) FILTER (WHERE t.status IN ('assigned','in_progress'))
                                                                              AS active,
                       co.license_expiry
                FROM contractors co
                LEFT JOIN tasks t ON t.assigned_contractor_id = co.id
                WHERE co.city_id = CAST(:city AS uuid)
                GROUP BY co.id
                ORDER BY co.performance_score DESC
            """),
            {"city": city_id},
        ).mappings().all()
        return [dict(r) for r in rows]

    # ── Repeat complaints ─────────────────────────────────────────
    if "repeat" in msg:
        rows = db.execute(
            text("""
                SELECT c.complaint_number, c.title, c.status, c.created_at,
                       c.address_text, it.code AS infra_type,
                       n.total_complaint_count
                FROM complaints c
                LEFT JOIN infra_nodes n  ON n.id  = c.infra_node_id
                LEFT JOIN infra_types it ON it.id = n.infra_type_id
                WHERE c.city_id            = CAST(:city AS uuid)
                  AND c.is_repeat_complaint = TRUE
                  AND c.status NOT IN ('resolved','closed','rejected')
                  AND c.is_deleted = FALSE
                ORDER BY n.total_complaint_count DESC LIMIT 10
            """),
            {"city": city_id},
        ).mappings().all()
        return [dict(r) for r in rows]

    # ── Multi-department / coordination ───────────────────────────
    if any(w in msg for w in ["multi", "department", "coordination", "coord", "two dept"]):
        rows = db.execute(
            text("""
                SELECT c.complaint_number, c.title, c.status, c.priority,
                       c.address_text,
                       array_length(c.agent_suggested_dept_ids, 1) AS dept_count,
                       c.agent_suggested_dept_ids
                FROM complaints c
                WHERE c.city_id   = CAST(:city AS uuid)
                  AND array_length(c.agent_suggested_dept_ids, 1) > 1
                  AND c.status NOT IN ('resolved','closed','rejected')
                  AND c.is_deleted = FALSE
                ORDER BY dept_count DESC, c.priority DESC LIMIT 10
            """),
            {"city": city_id},
        ).mappings().all()
        return [dict(r) for r in rows]

    # ── Stuck / old / delayed complaints ─────────────────────────
    if any(w in msg for w in ["stuck", "old", "7 day", "week", "delayed", "stale", "pending long"]):
        rows = db.execute(
            text("""
                SELECT c.complaint_number, c.title, c.status, c.priority,
                       c.address_text,
                       EXTRACT(DAY FROM NOW() - c.created_at)::int AS age_days,
                       it.code AS infra_type
                FROM complaints c
                LEFT JOIN infra_nodes n  ON n.id  = c.infra_node_id
                LEFT JOIN infra_types it ON it.id = n.infra_type_id
                WHERE c.city_id = CAST(:city AS uuid)
                  AND c.status NOT IN ('resolved','closed','rejected')
                  AND c.created_at < NOW() - INTERVAL '7 days'
                  AND c.is_deleted = FALSE
                ORDER BY age_days DESC LIMIT 10
            """),
            {"city": city_id},
        ).mappings().all()
        return [dict(r) for r in rows]

    # ── Specific complaint number ─────────────────────────────────
    match = re.search(r"DEL-\d{4}-\d+", user_message.upper())
    if match:
        rows = db.execute(
            text("""
                SELECT c.complaint_number, c.title, c.description,
                       c.status, c.priority, c.created_at, c.resolved_at,
                       c.agent_summary, c.is_repeat_complaint,
                       c.address_text,
                       it.name AS infra_type, j.name AS jurisdiction
                FROM complaints c
                LEFT JOIN infra_nodes n  ON n.id  = c.infra_node_id
                LEFT JOIN infra_types it ON it.id = n.infra_type_id
                LEFT JOIN jurisdictions j ON j.id = c.jurisdiction_id
                WHERE c.complaint_number = :num AND c.is_deleted = FALSE
            """),
            {"num": match.group(0)},
        ).mappings().all()
        return [dict(r) for r in rows]

    # ── SLA breach risk ───────────────────────────────────────────
    if any(w in msg for w in ["sla", "breach", "overdue", "deadline"]):
        rows = db.execute(
            text("""
                SELECT c.complaint_number, c.title, c.status,
                       c.address_text,
                       EXTRACT(DAY FROM NOW() - c.created_at)::int AS age_days
                FROM complaints c
                WHERE c.city_id = CAST(:city AS uuid)
                  AND c.status NOT IN ('resolved','closed','rejected')
                  AND c.created_at < NOW() - INTERVAL '30 days'
                  AND c.is_deleted = FALSE
                ORDER BY age_days DESC LIMIT 10
            """),
            {"city": city_id},
        ).mappings().all()
        return [dict(r) for r in rows]

    return None