# backend/services/crm_agent_service.py
"""
CRM Agent — Gemini 2.5 Flash.

Chatbot now works reliably:
  1. _load_official_context pulls real scoped KPI data
  2. chat_with_crm_agent passes DB context directly in system prompt
     (not just "QUERY_NEEDED" — that was unreliable)
  3. _run_agent_query covers all common patterns
  4. Performance: context loaded once, reused for briefing + chat
"""
import json
import logging
import re
from typing import Any, Dict, List, Optional

import vertexai
from vertexai.generative_models import GenerativeModel, GenerationConfig
from sqlalchemy import text
from sqlalchemy.orm import Session

from config import settings

logger = logging.getLogger(__name__)
_vertex_initialized = False


def _ensure_vertex():
    global _vertex_initialized
    if _vertex_initialized:
        return
    vertexai.init(project=settings.GCS_PROJECT_ID, location=settings.VERTEX_AI_LOCATION)
    _vertex_initialized = True


def _call_gemini(system: str, prompt: str, max_tokens: int = 600, temperature: float = 0.2) -> str:
    _ensure_vertex()
    model = GenerativeModel(
        "gemini-2.5-flash",
        system_instruction=system,
        generation_config=GenerationConfig(temperature=temperature, max_output_tokens=max_tokens),
    )
    return (model.generate_content(prompt).text or "").strip()


# ── Scope helper — mirrors admin_router._get_user_scope ──────────

def _get_scope_filters(db: Session, user_id: str, role: str) -> Dict[str, Any]:
    u = db.execute(
        text("SELECT city_id, department_id, jurisdiction_id, full_name FROM users WHERE id = CAST(:uid AS uuid)"),
        {"uid": user_id},
    ).mappings().first()
    if not u:
        return {}

    city_id = str(u["city_id"]) if u["city_id"] else None
    dept_id = str(u["department_id"]) if u["department_id"] else None
    jur_id  = str(u["jurisdiction_id"]) if u["jurisdiction_id"] else None

    c_where  = "c.is_deleted = FALSE"
    c_params: Dict[str, Any] = {}
    if city_id:
        c_where += " AND c.city_id = CAST(:city_id AS uuid)"
        c_params["city_id"] = city_id
    if role == "official":
        if dept_id:
            c_where += " AND CAST(:dept_id AS uuid) = ANY(c.agent_suggested_dept_ids)"
            c_params["dept_id"] = dept_id
        if jur_id:
            c_where += " AND c.jurisdiction_id = CAST(:jur_id AS uuid)"
            c_params["jur_id"] = jur_id
    elif role == "admin" and dept_id:
        c_where += " AND CAST(:dept_id AS uuid) = ANY(c.agent_suggested_dept_ids)"
        c_params["dept_id"] = dept_id

    return {
        "city_id": city_id, "dept_id": dept_id, "jur_id": jur_id,
        "full_name": u["full_name"],
        "c_where": c_where, "c_params": c_params,
    }


# ── Context loader ────────────────────────────────────────────────

def _load_official_context(db: Session, user_id: str, role: str) -> Dict[str, Any]:
    scope = _get_scope_filters(db, user_id, role)
    if not scope:
        return {}

    c_where  = scope["c_where"]
    c_params = dict(scope["c_params"])
    city_id  = scope.get("city_id")

    kpi = db.execute(text(f"""
        SELECT
            COUNT(*) FILTER (WHERE c.status NOT IN ('resolved','closed','rejected'))           AS open_total,
            COUNT(*) FILTER (WHERE c.priority IN ('critical','emergency')
                AND c.status NOT IN ('resolved','closed','rejected'))                           AS critical_open,
            COUNT(*) FILTER (WHERE c.is_repeat_complaint = TRUE
                AND c.status NOT IN ('resolved','closed','rejected'))                           AS repeat_open,
            COUNT(*) FILTER (WHERE c.status = 'received'
                AND c.created_at < NOW() - INTERVAL '3 days')                                  AS stale_unassigned,
            COUNT(*) FILTER (WHERE c.status NOT IN ('resolved','closed','rejected')
                AND c.created_at < NOW() - INTERVAL '30 days')                                 AS sla_breach_risk,
            COUNT(*) FILTER (WHERE c.workflow_instance_id IS NULL
                AND c.status NOT IN ('resolved','rejected','closed'))                           AS needs_workflow
        FROM complaints c WHERE {c_where}
    """), c_params).mappings().first()

    oldest = db.execute(text(f"""
        SELECT c.complaint_number, c.title, c.status, c.priority,
               c.address_text, it.code AS infra_code,
               EXTRACT(DAY FROM NOW() - c.created_at)::int AS age_days
        FROM complaints c
        LEFT JOIN infra_nodes n  ON n.id  = c.infra_node_id
        LEFT JOIN infra_types it ON it.id = n.infra_type_id
        WHERE {c_where} AND c.status NOT IN ('resolved','closed','rejected')
        ORDER BY c.created_at ASC LIMIT 5
    """), c_params).mappings().all()

    # Stale tasks — via department, no city_id on tasks
    stale_params: Dict[str, Any] = {}
    stale_where = "t.status IN ('pending','accepted') AND t.created_at < NOW() - INTERVAL '2 days' AND t.is_deleted=FALSE"
    if city_id:
        stale_where += " AND EXISTS (SELECT 1 FROM departments d WHERE d.id=t.department_id AND d.city_id=CAST(:city_id AS uuid))"
        stale_params["city_id"] = city_id
    if scope.get("dept_id"):
        stale_where += " AND t.department_id = CAST(:dept_id AS uuid)"
        stale_params["dept_id"] = scope["dept_id"]

    stale_tasks = db.execute(text(f"""
        SELECT t.task_number, t.title, t.status, t.priority, t.created_at,
               wu.full_name AS worker_name, co.company_name AS contractor_company
        FROM tasks t
        LEFT JOIN workers     wk ON wk.id = t.assigned_worker_id
        LEFT JOIN users       wu ON wu.id = wk.user_id
        LEFT JOIN contractors co ON co.id = t.assigned_contractor_id
        WHERE {stale_where}
        ORDER BY t.priority DESC, t.created_at ASC LIMIT 5
    """), stale_params).mappings().all()

    # Survey alerts
    survey_alerts = db.execute(text(f"""
        SELECT si.survey_type, AVG(sr.overall_rating) AS avg_rating,
               COUNT(*) AS response_count, c.complaint_number, c.title
        FROM survey_instances  si
        JOIN survey_responses  sr ON sr.survey_instance_id = si.id
        JOIN complaints        c  ON c.id = si.complaint_id
        WHERE {c_where.replace('c.city_id', 'c.city_id')}
          AND sr.submitted_at > NOW() - INTERVAL '7 days'
          AND sr.overall_rating IS NOT NULL
        GROUP BY si.id, c.complaint_number, c.title, si.survey_type
        HAVING AVG(sr.overall_rating) < 3.0
        ORDER BY avg_rating ASC LIMIT 5
    """), c_params).mappings().all()

    return {
        "user_name":     scope["full_name"],
        "role":          role,
        "kpi":           dict(kpi) if kpi else {},
        "oldest_open":   [dict(r) for r in oldest],
        "stale_tasks":   [dict(r) for r in stale_tasks],
        "survey_alerts": [dict(r) for r in survey_alerts],
        "_scope":        scope,
    }


# ── Daily briefing ────────────────────────────────────────────────

def get_daily_briefing(db: Session, user_id: str, role: str) -> Dict[str, Any]:
    ctx = _load_official_context(db, user_id, role)
    if not ctx:
        return {"greeting": "Namaskar! Dashboard data is loading.", "sections": []}

    kpi = ctx.get("kpi", {})
    greeting = "Namaskar! Here is your morning briefing."
    try:
        greeting = _call_gemini(
            "You are PS-CRM, a concise municipal operations assistant for Delhi. Be direct and actionable.",
            f"Write a 3-5 sentence morning briefing (plain text, no bullets) for "
            f"{ctx['user_name']} ({role}).\n\nDATA:\n{json.dumps(ctx, default=str, indent=2)}",
            max_tokens=400, temperature=0.3,
        )
    except Exception as exc:
        logger.error("Briefing Gemini failed: %s", exc)

    sections = []
    if int(kpi.get("critical_open") or 0) > 0:
        sections.append({"type":"alert",   "title":f"🔴 {kpi['critical_open']} Critical/Emergency", "action":"Review now"})
    if int(kpi.get("needs_workflow") or 0) > 0:
        sections.append({"type":"warning", "title":f"🔄 {kpi['needs_workflow']} complaints need workflow", "action":"Assign workflows"})
    if int(kpi.get("stale_unassigned") or 0) > 0:
        sections.append({"type":"warning", "title":f"⚠️ {kpi['stale_unassigned']} unassigned >3 days", "action":"Assign workers"})
    if int(kpi.get("repeat_open") or 0) > 0:
        sections.append({"type":"info",    "title":f"↩ {kpi['repeat_open']} repeat complaints open", "action":"Check infra history"})
    if ctx.get("survey_alerts"):
        sections.append({"type":"warning", "title":f"📋 {len(ctx['survey_alerts'])} poor survey ratings", "action":"Investigate"})
    if int(kpi.get("sla_breach_risk") or 0) > 0:
        sections.append({"type":"warning", "title":f"⏰ {kpi['sla_breach_risk']} SLA breach risk (>30d)", "action":"Escalate"})

    return {
        "greeting":     greeting,
        "kpi":          kpi,
        "sections":     sections,
        "oldest_open":  ctx.get("oldest_open",  []),
        "stale_tasks":  ctx.get("stale_tasks",  []),
        "survey_alerts":ctx.get("survey_alerts",[]),
    }


# ── Chat ──────────────────────────────────────────────────────────

def chat_with_crm_agent(
    db: Session, user_id: str, role: str,
    user_message: str, conversation_history: List[Dict[str, str]],
) -> Dict[str, Any]:
    """
    Two-step approach:
    1. Try to fetch relevant DB data based on message keywords (always)
    2. Call Gemini with DB data already in context — no QUERY_NEEDED unreliability
    """
    ctx       = _load_official_context(db, user_id, role)
    user_name = ctx.get("user_name", "Official")
    kpi       = ctx.get("kpi", {})
    scope     = ctx.get("_scope", {})

    # ── Step 1: Fetch DB data based on message keywords ───────────
    query_data = None
    try:
        query_data = _run_agent_query(db, scope, user_message)
    except Exception as exc:
        logger.warning("Agent query failed: %s", exc)

    # ── Step 2: Build prompt with data already embedded ──────────
    system = f"""You are PS-CRM, the AI assistant for Delhi municipal officials.
CURRENT USER: {user_name} ({role})
KPI SNAPSHOT: Open={kpi.get('open_total','?')} | Critical={kpi.get('critical_open','?')} | SLA_Risk={kpi.get('sla_breach_risk','?')} | Needs_Workflow={kpi.get('needs_workflow','?')}

Rules:
- Be direct, factual, and concise (2-5 sentences unless a table is clearer)
- Reference complaint numbers (CRM-DEL-YYYY-XXXXXX) when discussing specific cases
- If data is provided below, USE IT to give a specific answer
- Do NOT ask for more info — work with what you have"""

    # Build conversation string (last 6 turns = 3 exchanges)
    history_str = "".join(
        f"{'Official' if t.get('role')=='user' else 'PS-CRM'}: {t['content']}\n"
        for t in conversation_history[-6:]
    )

    db_section = ""
    if query_data:
        db_section = f"\nLIVE DB DATA:\n{json.dumps(query_data, default=str, indent=2)}\n"

    full_prompt = f"{history_str}{db_section}Official: {user_message}\nPS-CRM:"

    answer = "I'm having trouble connecting. Please try again."
    try:
        answer = _call_gemini(system, full_prompt, max_tokens=700)
    except Exception as exc:
        logger.error("CRM chat Gemini failed: %s", exc)

    return {"answer": answer, "data": query_data}


def _run_agent_query(db: Session, scope: Dict, user_message: str) -> Optional[List[Dict]]:
    """
    Keyword → safe read-only query.
    Returns structured data that goes directly into Gemini context.
    """
    if not scope:
        return None

    city_id = scope.get("city_id")
    dept_id = scope.get("dept_id")
    msg     = user_message.lower()

    # Build base city filter
    city_filter = "c.city_id = CAST(:city AS uuid)" if city_id else "TRUE"
    dept_filter = "CAST(:dept AS uuid) = ANY(c.agent_suggested_dept_ids)" if dept_id else "TRUE"
    params: Dict[str, Any] = {}
    if city_id: params["city"] = city_id
    if dept_id: params["dept"] = dept_id

    combined = f"{city_filter} AND {dept_filter}"

    # Complaint number lookup
    match = re.search(r"CRM-[A-Z]+-\d{4}-\d+", user_message.upper())
    if match:
        rows = db.execute(text("""
            SELECT c.complaint_number, c.title, c.status, c.priority,
                   c.agent_summary, c.address_text, c.created_at, c.resolved_at,
                   it.name AS infra_type, j.name AS jurisdiction
            FROM complaints c
            LEFT JOIN infra_nodes n  ON n.id = c.infra_node_id
            LEFT JOIN infra_types it ON it.id = n.infra_type_id
            LEFT JOIN jurisdictions j ON j.id = c.jurisdiction_id
            WHERE c.complaint_number = :num AND c.is_deleted=FALSE
        """), {"num": match.group(0)}).mappings().all()
        return [dict(r) for r in rows]

    # Contractor/worker performance
    if any(w in msg for w in ["contractor", "company", "vendor", "performance", "blacklist"]):
        rows = db.execute(text("""
            SELECT co.company_name, co.performance_score, co.is_blacklisted,
                   COUNT(t.id) FILTER (WHERE t.status='completed') AS completed,
                   COUNT(t.id) FILTER (WHERE t.status IN ('accepted','in_progress')) AS active,
                   co.license_expiry
            FROM contractors co
            LEFT JOIN tasks t ON t.assigned_contractor_id = co.id
            WHERE co.city_id = CAST(:city AS uuid)
            GROUP BY co.id ORDER BY co.performance_score ASC LIMIT 10
        """), {"city": city_id} if city_id else {}).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Repeat complaints
    if "repeat" in msg or "recurring" in msg:
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.status, c.address_text,
                   it.code AS infra_type,
                   EXTRACT(DAY FROM NOW()-c.created_at)::int AS age_days,
                   n.total_complaint_count
            FROM complaints c
            LEFT JOIN infra_nodes n  ON n.id=c.infra_node_id
            LEFT JOIN infra_types it ON it.id=n.infra_type_id
            WHERE {combined} AND c.is_repeat_complaint=TRUE
              AND c.status NOT IN ('resolved','closed','rejected') AND c.is_deleted=FALSE
            ORDER BY age_days DESC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Stuck / stale / old
    if any(w in msg for w in ["stuck","stale","old","delayed","7 day","week","unresponded"]):
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.status, c.priority, c.address_text,
                   EXTRACT(DAY FROM NOW()-c.created_at)::int AS age_days, it.code AS infra_type
            FROM complaints c
            LEFT JOIN infra_nodes n  ON n.id=c.infra_node_id
            LEFT JOIN infra_types it ON it.id=n.infra_type_id
            WHERE {combined} AND c.status NOT IN ('resolved','closed','rejected')
              AND c.created_at < NOW()-INTERVAL '7 days' AND c.is_deleted=FALSE
            ORDER BY age_days DESC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # SLA / overdue / breach
    if any(w in msg for w in ["sla","breach","overdue","deadline","30 day"]):
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.status, c.address_text,
                   EXTRACT(DAY FROM NOW()-c.created_at)::int AS age_days
            FROM complaints c
            WHERE {combined} AND c.status NOT IN ('resolved','closed','rejected')
              AND c.created_at < NOW()-INTERVAL '30 days' AND c.is_deleted=FALSE
            ORDER BY age_days DESC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Critical / emergency
    if any(w in msg for w in ["critical","emergency","urgent","priority"]):
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.status, c.priority, c.address_text,
                   EXTRACT(DAY FROM NOW()-c.created_at)::int AS age_days
            FROM complaints c
            WHERE {combined} AND c.priority IN ('critical','emergency')
              AND c.status NOT IN ('resolved','closed','rejected') AND c.is_deleted=FALSE
            ORDER BY c.priority DESC, c.created_at ASC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Multi-department / coordination
    if any(w in msg for w in ["multi","department","coordination","coord","multiple dept"]):
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.status, c.priority, c.address_text,
                   array_length(c.agent_suggested_dept_ids,1) AS dept_count
            FROM complaints c
            WHERE {combined} AND array_length(c.agent_suggested_dept_ids,1) > 1
              AND c.status NOT IN ('resolved','closed','rejected') AND c.is_deleted=FALSE
            ORDER BY dept_count DESC, c.priority DESC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Tasks
    if any(w in msg for w in ["task","worker","assigned","pending task"]):
        t_params: Dict[str, Any] = {}
        t_filter = "t.status IN ('pending','accepted') AND t.is_deleted=FALSE"
        if dept_id:
            t_filter += " AND t.department_id = CAST(:dept AS uuid)"
            t_params["dept"] = dept_id
        elif city_id:
            t_filter += " AND EXISTS (SELECT 1 FROM departments d WHERE d.id=t.department_id AND d.city_id=CAST(:city AS uuid))"
            t_params["city"] = city_id

        rows = db.execute(text(f"""
            SELECT t.task_number, t.title, t.status, t.priority,
                   wu.full_name AS worker_name, co.company_name,
                   d.name AS dept_name,
                   EXTRACT(DAY FROM NOW()-t.created_at)::int AS age_days
            FROM tasks t
            LEFT JOIN departments d  ON d.id=t.department_id
            LEFT JOIN workers wk     ON wk.id=t.assigned_worker_id
            LEFT JOIN users wu       ON wu.id=wk.user_id
            LEFT JOIN contractors co ON co.id=t.assigned_contractor_id
            WHERE {t_filter}
            ORDER BY age_days DESC LIMIT 10
        """), t_params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Survey / feedback / rating
    if any(w in msg for w in ["survey","rating","feedback","citizen","satisfaction"]):
        rows = db.execute(text("""
            SELECT AVG(sr.overall_rating)::numeric(3,1) AS avg_rating,
                   COUNT(*) AS total_responses,
                   COUNT(*) FILTER (WHERE sr.overall_rating < 3) AS poor_count,
                   COUNT(*) FILTER (WHERE sr.overall_rating >= 4) AS good_count
            FROM survey_responses sr
            WHERE sr.submitted_at >= NOW() - INTERVAL '30 days'
        """), {}).mappings().first()
        return [dict(rows)] if rows else None

    # Resolved / completed stats
    if any(w in msg for w in ["resolved","completed","closed","done this week","last week"]):
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.priority, c.resolved_at,
                   EXTRACT(DAY FROM c.resolved_at - c.created_at)::int AS resolution_days
            FROM complaints c
            WHERE {combined} AND c.status IN ('resolved','closed')
              AND c.resolved_at > NOW() - INTERVAL '7 days'
            ORDER BY c.resolved_at DESC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    # Needs workflow
    if any(w in msg for w in ["workflow","needs workflow","no workflow","unassigned workflow"]):
        rows = db.execute(text(f"""
            SELECT c.complaint_number, c.title, c.priority, c.status, c.address_text,
                   EXTRACT(DAY FROM NOW()-c.created_at)::int AS age_days, it.code AS infra_type
            FROM complaints c
            LEFT JOIN infra_nodes n  ON n.id=c.infra_node_id
            LEFT JOIN infra_types it ON it.id=n.infra_type_id
            WHERE {combined} AND c.workflow_instance_id IS NULL
              AND c.status NOT IN ('resolved','rejected','closed') AND c.is_deleted=FALSE
            ORDER BY c.priority DESC, age_days DESC LIMIT 10
        """), params).mappings().all()
        return [dict(r) for r in rows] if rows else None

    return None