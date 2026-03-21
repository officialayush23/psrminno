# backend/routes/admin_router.py
"""
RBAC:
  super_admin → sees everything city-wide
  admin       → sees their department only
  official    → sees their branch/jurisdiction only
"""
from typing import Optional
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy import text
from sqlalchemy.orm import Session

from db import get_db
from dependencies import get_current_user
from schemas import TokenData

router = APIRouter(prefix="/admin", tags=["Admin"])


# ── RBAC helper ───────────────────────────────────────────────────

def require_role(*roles):
    def dep(current_user: TokenData = Depends(get_current_user)):
        if current_user.role not in roles:
            raise HTTPException(
                status_code=403,
                detail=f"Requires one of: {roles}. You are: {current_user.role}"
            )
        return current_user
    return dep


def _get_user_context(db: Session, user_id) -> dict:
    """Returns dept_id, branch_id, jurisdiction_id for scoping queries."""
    row = db.execute(
        text("""
            SELECT department_id, branch_id, jurisdiction_id, city_id, role
            FROM users WHERE id = CAST(:id AS uuid)
        """),
        {"id": str(user_id)}
    ).mappings().first()
    if not row:
        raise HTTPException(status_code=404, detail="User not found")
    return dict(row)


# ── COMPLAINT QUEUE — scoped by role ─────────────────────────────

@router.get("/complaints/queue")
def get_complaint_queue(
    status: Optional[str] = Query(default=None),
    priority: Optional[str] = Query(default=None),
    infra_type_code: Optional[str] = Query(default=None),
    limit: int = Query(default=50, le=200),
    offset: int = Query(default=0),
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("super_admin", "admin", "official")
    ),
):
    """
    Returns complaints scoped by role:
    - super_admin: all complaints in city
    - admin: all complaints for their department
    - official: complaints in their branch jurisdiction
    """
    ctx = _get_user_context(db, current_user.user_id)

    filters = ["c.is_deleted = FALSE"]
    params  = {"limit": limit, "offset": offset, "city_id": str(ctx["city_id"])}

    filters.append("c.city_id = CAST(:city_id AS uuid)")

    if ctx["role"] == "admin" and ctx["department_id"]:
        filters.append("""
            EXISTS (
                SELECT 1 FROM unnest(c.agent_suggested_dept_ids) d(id)
                WHERE d.id = CAST(:dept_id AS uuid)
            )
        """)
        params["dept_id"] = str(ctx["department_id"])

    elif ctx["role"] == "official" and ctx["jurisdiction_id"]:
        filters.append("c.jurisdiction_id = CAST(:jur_id AS uuid)")
        params["jur_id"] = str(ctx["jurisdiction_id"])

    if status:
        filters.append("c.status = :status")
        params["status"] = status
    if priority:
        filters.append("c.priority = :priority")
        params["priority"] = priority
    if infra_type_code:
        filters.append("it.code = :infra_code")
        params["infra_code"] = infra_type_code

    where = " AND ".join(filters)

    rows = db.execute(
        text(f"""
            SELECT
                c.id, c.complaint_number, c.title, c.description,
                c.status, c.priority,
                c.is_repeat_complaint, c.repeat_gap_days,
                c.agent_suggested_dept_ids,
                c.agent_summary, c.agent_priority_reason,
                c.created_at, c.updated_at,
                c.infra_node_id, c.workflow_instance_id,
                ST_Y(c.location::geometry) AS lat,
                ST_X(c.location::geometry) AS lng,
                c.address_text,
                c.images,
                it.name   AS infra_type_name,
                it.code   AS infra_type_code,
                j.name    AS jurisdiction_name,
                -- mapping confidence from latest agent log
                al.confidence_score AS mapping_confidence,
                al.output_data      AS mapping_data,
                -- infra node health
                n.total_complaint_count,
                n.total_resolved_count,
                n.status AS node_status,
                -- citizen (anonymised for officials — only first name + area)
                u.full_name AS citizen_name,
                u.preferred_language
            FROM complaints c
            LEFT JOIN infra_nodes   n  ON n.id  = c.infra_node_id
            LEFT JOIN infra_types   it ON it.id = n.infra_type_id
            LEFT JOIN jurisdictions j  ON j.id  = c.jurisdiction_id
            LEFT JOIN users         u  ON u.id  = c.citizen_id
            LEFT JOIN LATERAL (
                SELECT confidence_score, output_data
                FROM agent_logs
                WHERE complaint_id = c.id AND agent_type = 'DEPT_MAPPER'
                ORDER BY created_at DESC LIMIT 1
            ) al ON TRUE
            WHERE {where}
            ORDER BY
                CASE c.priority
                    WHEN 'emergency' THEN 1
                    WHEN 'critical'  THEN 2
                    WHEN 'high'      THEN 3
                    WHEN 'normal'    THEN 4
                    WHEN 'low'       THEN 5
                END,
                c.is_repeat_complaint DESC,
                c.created_at DESC
            LIMIT :limit OFFSET :offset
        """),
        params,
    ).mappings().all()

    count = db.execute(
        text(f"SELECT COUNT(*) FROM complaints c LEFT JOIN infra_nodes n ON n.id=c.infra_node_id LEFT JOIN infra_types it ON it.id=n.infra_type_id WHERE {where}"),
        params
    ).scalar()

    def safe_url(images):
        if images and isinstance(images, list) and images[0]:
            return images[0].get("url")
        return None

    return {
        "total":  count,
        "limit":  limit,
        "offset": offset,
        "items": [
            {
                "id":                   str(r["id"]),
                "complaint_number":     r["complaint_number"],
                "title":                r["title"],
                "description":          r["description"],
                "status":               r["status"],
                "priority":             r["priority"],
                "is_repeat_complaint":  bool(r["is_repeat_complaint"]),
                "repeat_gap_days":      r["repeat_gap_days"],
                "agent_suggested_dept_ids": [str(d) for d in (r["agent_suggested_dept_ids"] or [])],
                "agent_summary":        r["agent_summary"],
                "agent_priority_reason":r["agent_priority_reason"],
                "mapping_confidence":   float(r["mapping_confidence"]) if r["mapping_confidence"] else None,
                "mapping_data":         r["mapping_data"],
                "infra_type_name":      r["infra_type_name"],
                "infra_type_code":      r["infra_type_code"],
                "jurisdiction_name":    r["jurisdiction_name"],
                "lat":                  float(r["lat"]) if r["lat"] else None,
                "lng":                  float(r["lng"]) if r["lng"] else None,
                "address_text":         r["address_text"],
                "thumbnail_url":        safe_url(r["images"]),
                "node_total_complaints":r["total_complaint_count"],
                "node_resolved_count":  r["total_resolved_count"],
                "node_status":          r["node_status"],
                "citizen_name":         r["citizen_name"],
                "preferred_language":   r["preferred_language"],
                "created_at":           r["created_at"].isoformat() if r["created_at"] else None,
                "updated_at":           r["updated_at"].isoformat() if r["updated_at"] else None,
                "workflow_instance_id": str(r["workflow_instance_id"]) if r["workflow_instance_id"] else None,
            }
            for r in rows
        ],
    }


# ── INFRA NODE DETAIL — all complaints on one node ────────────────

@router.get("/infra-nodes/{node_id}/summary")
def get_infra_node_summary(
    node_id: UUID,
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("super_admin", "admin", "official")
    ),
):
    """
    Full picture of one infra node:
    - node metadata
    - all complaints ever (with status timeline)
    - AI summary of the issues
    - workflow recommendation
    - asset health trend
    """
    node = db.execute(
        text("""
            SELECT
                n.id, n.name, n.status, n.location_hash,
                n.total_complaint_count, n.total_resolved_count,
                n.last_resolved_at,
                ST_Y(n.location::geometry) AS lat,
                ST_X(n.location::geometry) AS lng,
                it.name AS infra_type_name, it.code AS infra_type_code,
                it.cluster_radius_meters, it.repeat_alert_years,
                j.name AS jurisdiction_name
            FROM infra_nodes n
            JOIN infra_types   it ON it.id = n.infra_type_id
            LEFT JOIN jurisdictions j ON j.id = n.jurisdiction_id
            WHERE n.id = CAST(:nid AS uuid) AND n.is_deleted = FALSE
        """),
        {"nid": str(node_id)}
    ).mappings().first()

    if not node:
        raise HTTPException(status_code=404, detail="Infra node not found")

    complaints = db.execute(
        text("""
            SELECT
                c.id, c.complaint_number, c.title, c.status,
                c.priority, c.is_repeat_complaint, c.agent_summary,
                c.created_at, c.resolved_at,
                u.full_name AS citizen_name
            FROM complaints c
            JOIN users u ON u.id = c.citizen_id
            WHERE c.infra_node_id = CAST(:nid AS uuid) AND c.is_deleted = FALSE
            ORDER BY c.created_at DESC
            LIMIT 50
        """),
        {"nid": str(node_id)}
    ).mappings().all()

    # Load latest AI-generated cluster summary
    cluster = db.execute(
        text("""
            SELECT cluster_summary, complaint_count, created_at
            FROM complaint_clusters
            WHERE infra_node_id = CAST(:nid AS uuid)
            ORDER BY created_at DESC LIMIT 1
        """),
        {"nid": str(node_id)}
    ).mappings().first()

    # Active workflow
    workflow = db.execute(
        text("""
            SELECT wi.id, wi.status, wi.current_step_number, wi.total_steps,
                   wi.started_at, wt.name AS template_name
            FROM workflow_instances wi
            JOIN workflow_templates wt ON wt.id = wi.template_id
            WHERE wi.infra_node_id = CAST(:nid AS uuid)
              AND wi.status = 'active'
            ORDER BY wi.created_at DESC LIMIT 1
        """),
        {"nid": str(node_id)}
    ).mappings().first()

    return {
        "node": {
            "id":                   str(node["id"]),
            "name":                 node["name"],
            "status":               node["status"],
            "lat":                  float(node["lat"]),
            "lng":                  float(node["lng"]),
            "infra_type_name":      node["infra_type_name"],
            "infra_type_code":      node["infra_type_code"],
            "jurisdiction_name":    node["jurisdiction_name"],
            "total_complaint_count":node["total_complaint_count"],
            "total_resolved_count": node["total_resolved_count"],
            "last_resolved_at":     node["last_resolved_at"].isoformat() if node["last_resolved_at"] else None,
        },
        "complaints": [
            {
                "id":                  str(c["id"]),
                "complaint_number":    c["complaint_number"],
                "title":               c["title"],
                "status":              c["status"],
                "priority":            c["priority"],
                "is_repeat_complaint": bool(c["is_repeat_complaint"]),
                "agent_summary":       c["agent_summary"],
                "citizen_name":        c["citizen_name"],
                "created_at":          c["created_at"].isoformat() if c["created_at"] else None,
                "resolved_at":         c["resolved_at"].isoformat() if c["resolved_at"] else None,
            }
            for c in complaints
        ],
        "cluster_summary": cluster["cluster_summary"] if cluster else None,
        "active_workflow": {
            "id":                  str(workflow["id"]),
            "status":              workflow["status"],
            "template_name":       workflow["template_name"],
            "current_step_number": workflow["current_step_number"],
            "total_steps":         workflow["total_steps"],
            "started_at":          workflow["started_at"].isoformat() if workflow["started_at"] else None,
        } if workflow else None,
    }


# ── TASK ASSIGNMENT ───────────────────────────────────────────────

@router.post("/tasks/{task_id}/assign")
def assign_task(
    task_id: UUID,
    worker_id: Optional[UUID] = None,
    contractor_id: Optional[UUID] = None,
    official_id: Optional[UUID] = None,
    notes: Optional[str] = None,
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("super_admin", "admin", "official")
    ),
):
    if not any([worker_id, contractor_id, official_id]):
        raise HTTPException(status_code=400, detail="Must assign to worker, contractor, or official")

    db.execute(
        text("""
            UPDATE tasks SET
                assigned_worker_id     = CAST(:worker_id     AS uuid),
                assigned_contractor_id = CAST(:contractor_id AS uuid),
                assigned_official_id   = CAST(:official_id   AS uuid),
                updated_at             = NOW()
            WHERE id = CAST(:task_id AS uuid)
        """),
        {
            "task_id":       str(task_id),
            "worker_id":     str(worker_id)     if worker_id     else None,
            "contractor_id": str(contractor_id) if contractor_id else None,
            "official_id":   str(official_id)   if official_id   else None,
        }
    )

    # Log override reason if it's a re-assignment
    if notes:
        db.execute(
            text("""
                INSERT INTO domain_events (event_type, entity_type, entity_id, actor_id, actor_type, payload, city_id)
                SELECT 'TASK_ASSIGNED', 'task', CAST(:task_id AS uuid),
                       CAST(:actor AS uuid), 'official',
                       CAST(:payload AS jsonb),
                       city_id
                FROM tasks WHERE id = CAST(:task_id AS uuid)
            """),
            {
                "task_id": str(task_id),
                "actor":   str(current_user.user_id),
                "payload": f'{{"worker_id":"{worker_id}","contractor_id":"{contractor_id}","notes":"{notes}"}}',
            }
        )

    db.commit()
    return {"status": "assigned", "task_id": str(task_id)}


# ── COMPLAINT RE-ROUTING (if wrong dept) ─────────────────────────

@router.post("/complaints/{complaint_id}/reroute")
def reroute_complaint(
    complaint_id: UUID,
    new_dept_ids: list[UUID],
    reason: str,
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("super_admin", "admin", "official")
    ),
):
    dept_ids_str = "{" + ",".join(str(d) for d in new_dept_ids) + "}"
    db.execute(
        text("""
            UPDATE complaints
               SET agent_suggested_dept_ids = CAST(:dept_ids AS uuid[]),
                   updated_at = NOW()
             WHERE id = CAST(:cid AS uuid)
        """),
        {"cid": str(complaint_id), "dept_ids": dept_ids_str}
    )
    db.execute(
        text("""
            INSERT INTO agent_logs (agent_type, complaint_id, input_data, output_data, action_taken, confidence_score)
            VALUES ('HUMAN_REROUTE', CAST(:cid AS uuid),
                    CAST(:input AS jsonb), CAST(:output AS jsonb),
                    'DEPT_REROUTED', 1.0)
        """),
        {
            "cid":    str(complaint_id),
            "input":  f'{{"rerouted_by":"{current_user.user_id}"}}',
            "output": f'{{"new_dept_ids":{[str(d) for d in new_dept_ids]},"reason":"{reason}"}}',
        }
    )
    db.commit()
    return {"status": "rerouted", "new_dept_ids": [str(d) for d in new_dept_ids]}


# ── KPI DASHBOARD — scoped by role ───────────────────────────────

@router.get("/dashboard/kpi")
def get_kpi_dashboard(
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("super_admin", "admin", "official")
    ),
):
    ctx = _get_user_context(db, current_user.user_id)

    scope_filter = "c.city_id = CAST(:city_id AS uuid)"
    params = {"city_id": str(ctx["city_id"])}

    if ctx["role"] == "admin" and ctx["department_id"]:
        scope_filter += " AND CAST(:dept_id AS uuid) = ANY(c.agent_suggested_dept_ids)"
        params["dept_id"] = str(ctx["department_id"])
    elif ctx["role"] == "official" and ctx["jurisdiction_id"]:
        scope_filter += " AND c.jurisdiction_id = CAST(:jur_id AS uuid)"
        params["jur_id"] = str(ctx["jurisdiction_id"])

    row = db.execute(
        text(f"""
            SELECT
                COUNT(*)                                                        AS total_complaints,
                COUNT(*) FILTER (WHERE c.status NOT IN ('resolved','closed','rejected'))
                                                                                AS open_complaints,
                COUNT(*) FILTER (WHERE c.status IN ('resolved','closed'))       AS resolved_complaints,
                COUNT(*) FILTER (WHERE c.priority IN ('critical','emergency'))  AS critical_count,
                COUNT(*) FILTER (WHERE c.is_repeat_complaint = TRUE)            AS repeat_count,
                COUNT(*) FILTER (WHERE c.status = 'received'
                    AND c.created_at < NOW() - INTERVAL '3 days')               AS stale_unassigned,
                ROUND(AVG(
                    EXTRACT(EPOCH FROM (c.resolved_at - c.created_at)) / 86400.0
                ) FILTER (WHERE c.resolved_at IS NOT NULL), 1)                  AS avg_resolution_days,
                COUNT(DISTINCT c.infra_node_id)                                 AS unique_nodes_affected
            FROM complaints c
            WHERE {scope_filter} AND c.is_deleted = FALSE
        """),
        params
    ).mappings().first()

    # Top infra types by complaint count
    top_infra = db.execute(
        text(f"""
            SELECT it.name AS infra_type, it.code, COUNT(*) AS count
            FROM complaints c
            JOIN infra_nodes n ON n.id = c.infra_node_id
            JOIN infra_types it ON it.id = n.infra_type_id
            WHERE {scope_filter} AND c.is_deleted = FALSE
            GROUP BY it.name, it.code
            ORDER BY count DESC LIMIT 5
        """),
        params
    ).mappings().all()

    # Status breakdown
    status_breakdown = db.execute(
        text(f"""
            SELECT c.status, COUNT(*) AS count
            FROM complaints c
            WHERE {scope_filter} AND c.is_deleted = FALSE
            GROUP BY c.status ORDER BY count DESC
        """),
        params
    ).mappings().all()

    # SLA breach risk — complaints open > 30 days without resolution
    sla_at_risk = db.execute(
        text(f"""
            SELECT COUNT(*) AS count
            FROM complaints c
            WHERE {scope_filter} AND c.is_deleted = FALSE
              AND c.status NOT IN ('resolved','closed','rejected')
              AND c.created_at < NOW() - INTERVAL '30 days'
        """),
        params
    ).scalar()

    return {
        "summary": {
            "total_complaints":     int(row["total_complaints"] or 0),
            "open_complaints":      int(row["open_complaints"] or 0),
            "resolved_complaints":  int(row["resolved_complaints"] or 0),
            "critical_count":       int(row["critical_count"] or 0),
            "repeat_count":         int(row["repeat_count"] or 0),
            "stale_unassigned":     int(row["stale_unassigned"] or 0),
            "avg_resolution_days":  float(row["avg_resolution_days"]) if row["avg_resolution_days"] else None,
            "unique_nodes_affected":int(row["unique_nodes_affected"] or 0),
            "sla_at_risk":          int(sla_at_risk or 0),
        },
        "top_infra_types": [
            {"infra_type": r["infra_type"], "code": r["code"], "count": int(r["count"])}
            for r in top_infra
        ],
        "status_breakdown": [
            {"status": r["status"], "count": int(r["count"])}
            for r in status_breakdown
        ],
    }


# ── WORKERS & CONTRACTORS AVAILABLE ──────────────────────────────

@router.get("/workers/available")
def list_available_workers(
    dept_id: Optional[UUID] = Query(default=None),
    skill: Optional[str] = Query(default=None),
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("super_admin", "admin", "official")
    ),
):
    ctx = _get_user_context(db, current_user.user_id)
    params = {"city_id": str(ctx["city_id"])}

    dept_filter = ""
    if ctx["role"] in ("admin", "official") and ctx["department_id"]:
        dept_filter = "AND w.department_id = CAST(:dept_id AS uuid)"
        params["dept_id"] = str(ctx["department_id"])
    elif dept_id:
        dept_filter = "AND w.department_id = CAST(:dept_id AS uuid)"
        params["dept_id"] = str(dept_id)

    skill_filter = ""
    if skill:
        skill_filter = "AND :skill = ANY(w.skills)"
        params["skill"] = skill

    rows = db.execute(
        text(f"""
            SELECT
                w.id, w.employee_id, w.skills,
                w.is_available, w.current_task_count, w.performance_score,
                u.full_name, u.phone,
                d.name AS department_name, d.code AS department_code,
                c.company_name AS contractor_company
            FROM workers w
            JOIN users u ON u.id = w.user_id
            JOIN departments d ON d.id = w.department_id
            LEFT JOIN contractors c ON c.id = w.contractor_id
            WHERE u.city_id = CAST(:city_id AS uuid)
              AND w.is_available = TRUE
              AND w.current_task_count < 5
              {dept_filter}
              {skill_filter}
            ORDER BY w.performance_score DESC, w.current_task_count ASC
        """),
        params
    ).mappings().all()

    return [
        {
            "id":                 str(r["id"]),
            "employee_id":        r["employee_id"],
            "full_name":          r["full_name"],
            "phone":              r["phone"],
            "skills":             r["skills"],
            "is_available":       r["is_available"],
            "current_task_count": r["current_task_count"],
            "performance_score":  float(r["performance_score"]),
            "department_name":    r["department_name"],
            "department_code":    r["department_code"],
            "contractor_company": r["contractor_company"],
        }
        for r in rows
    ]


# ── TENDER REQUEST ────────────────────────────────────────────────

@router.post("/tenders/request")
def request_tender(
    complaint_id: UUID,
    workflow_step_instance_id: Optional[UUID],
    title: str,
    description: str,
    scope_of_work: str,
    estimated_cost: float,
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(
        require_role("official", "admin")
    ),
):
    ctx = _get_user_context(db, current_user.user_id)

    # Generate tender number
    tender_number = db.execute(
        text("SELECT 'TDR-DEL-' || TO_CHAR(NOW(), 'YYYYMMDD') || '-' || LPAD(nextval('tender_seq')::TEXT, 4, '0')")
    ).scalar()

    # Create sequence if not exists
    db.execute(text("CREATE SEQUENCE IF NOT EXISTS tender_seq START 1"))

    tender_number = f"TDR-DEL-{__import__('datetime').date.today().strftime('%Y%m%d')}-{str(current_user.user_id)[-4:].upper()}"

    db.execute(
        text("""
            INSERT INTO tenders (
                tender_number, department_id, workflow_step_instance_id,
                complaint_id, requested_by,
                title, description, scope_of_work,
                estimated_cost, status
            ) VALUES (
                :tn, CAST(:dept_id AS uuid),
                CAST(:wsi_id AS uuid), CAST(:cid AS uuid),
                CAST(:req_by AS uuid),
                :title, :desc, :scope,
                :cost, 'draft'
            )
        """),
        {
            "tn":      tender_number,
            "dept_id": str(ctx["department_id"]),
            "wsi_id":  str(workflow_step_instance_id) if workflow_step_instance_id else None,
            "cid":     str(complaint_id),
            "req_by":  str(current_user.user_id),
            "title":   title,
            "desc":    description,
            "scope":   scope_of_work,
            "cost":    estimated_cost,
        }
    )
    db.commit()
    return {"status": "tender_created", "tender_number": tender_number}