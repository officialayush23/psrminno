# backend/services/mapping_service.py

# backend/services/mapping_service.py

import json
import logging
import time
import uuid as uuid_lib
from typing import Any, Dict, List, Optional

from groq import Groq
from sqlalchemy import text
from sqlalchemy.orm import Session

from config import settings

logger = logging.getLogger(__name__)

_groq_client: Groq | None = None


def _get_groq_client() -> Groq:
    global _groq_client
    if _groq_client is None:
        _groq_client = Groq(api_key=settings.GROQ_API_KEY)
    return _groq_client


# ─────────────────────────────────────────────────────────────────
# INFRA TYPE — find or create
# ─────────────────────────────────────────────────────────────────

def ensure_infra_type(
    db: Session,
    infra_type_id: str,
    *,
    fallback_name: str = "General Infrastructure",
    fallback_code: str = "GENERAL",
) -> Dict[str, str]:
    """
    Returns {id, name, code} for the given infra_type_id.

    Resolution order:
      1. Exact UUID match in infra_types
      2. Existing row with fallback_code
      3. INSERT a minimal row and return it

    Called before fn_route_complaint_authority so we always have
    a valid infra_type_code to pass into the routing function.
    """
    # ── 1. Exact ID ───────────────────────────────────────────────
    row = db.execute(
        text("SELECT id, name, code FROM infra_types WHERE id = CAST(:id AS uuid)"),
        {"id": infra_type_id},
    ).mappings().first()
    if row:
        return {"id": str(row["id"]), "name": row["name"], "code": row["code"]}

    # ── 2. Existing type by code ──────────────────────────────────
    row = db.execute(
        text("SELECT id, name, code FROM infra_types WHERE code = :code LIMIT 1"),
        {"code": fallback_code},
    ).mappings().first()
    if row:
        logger.warning(
            "infra_type_id=%s not found — reusing existing code=%s id=%s",
            infra_type_id, row["code"], row["id"],
        )
        return {"id": str(row["id"]), "name": row["name"], "code": row["code"]}

    # ── 3. Create minimal row ─────────────────────────────────────
    new_id   = str(uuid_lib.uuid4())
    new_code = fallback_code.upper()[:30]
    new_name = fallback_name[:100]

    db.execute(
        text("""
            INSERT INTO infra_types (
                id, name, code,
                default_dept_ids, cluster_radius_meters, repeat_alert_years,
                metadata
            ) VALUES (
                CAST(:id AS uuid), :name, :code,
                '{}'::uuid[], 50, 3,
                '{"auto_created": true}'::jsonb
            )
            ON CONFLICT (code) DO NOTHING
        """),
        {"id": new_id, "name": new_name, "code": new_code},
    )

    # Re-fetch — ON CONFLICT may have returned without inserting
    row = db.execute(
        text("SELECT id, name, code FROM infra_types WHERE code = :code LIMIT 1"),
        {"code": new_code},
    ).mappings().first()

    result = {
        "id":   str(row["id"])   if row else new_id,
        "name": row["name"]      if row else new_name,
        "code": row["code"]      if row else new_code,
    }
    logger.info("Auto-created infra_type: %s", result)
    return result

# ─────────────────────────────────────────────────────────────────
# INFRA TYPE INFERENCE — called when frontend sends no infra_type_id
# Paste this block into mapping_service.py, right after ensure_infra_type
# and before ensure_infra_node
# ─────────────────────────────────────────────────────────────────

def infer_infra_type(
    db: Session,
    *,
    title: str,
    description: str,
    translated_description: str,
) -> Dict[str, str]:
    """
    Infers the best-matching infra_type from complaint text.

    Resolution order:
      1. Groq llama-3.3-70b — picks from existing DB infra types
      2. Keyword fallback — counts hits against typical_keywords in metadata
      3. Hard fallback — first row alphabetically (last resort, should rarely fire)

    Returns {id, code, name} of the winning infra_type.
    Never returns an empty dict — always gives a usable type.
    """
    # Load all existing infra types with their keyword hints
    rows = db.execute(
        text("""
            SELECT id, name, code, metadata
            FROM infra_types
            ORDER BY name
        """)
    ).mappings().all()

    if not rows:
        return {}

    infra_list = "\n".join(
        f'  - id="{r["id"]}" code="{r["code"]}" name="{r["name"]}" '
        f'keywords={r["metadata"].get("typical_keywords", []) if isinstance(r["metadata"], dict) else []}'
        for r in rows
    )

    # Use the translated description if available, else original
    text_for_inference = (translated_description or description or title).strip()
    full_text = f"{title}. {text_for_inference}"

    prompt = f"""You are a Delhi municipal infrastructure classifier.

Given a citizen complaint, identify the SINGLE most relevant infrastructure type from the list below.

COMPLAINT:
  Title: {title}
  Description: {text_for_inference}

AVAILABLE INFRA TYPES:
{infra_list}

RULES:
1. Return ONLY a JSON object — no prose, no markdown fences.
2. Choose the MOST SPECIFIC type:
   - "pothole" → POTHOLE (not ROAD)
   - "streetlight not working" → STLIGHT
   - "tree fell" → TREE
   - "water leakage" → WATER_PIPE
   - "sewer overflow" → SEWER
3. Return exactly:
   {{"infra_type_id": "<uuid from list>", "infra_type_code": "<code>", "confidence": 0.95}}

OUTPUT (JSON only):"""

    try:
        client   = _get_groq_client()
        response = client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[
                {
                    "role":    "system",
                    "content": "Output only valid JSON. No markdown, no explanation.",
                },
                {"role": "user", "content": prompt},
            ],
            temperature=0.05,
            max_tokens=120,
        )
        raw = response.choices[0].message.content.strip()

        # Strip any accidental markdown fences
        if "```" in raw:
            parts = raw.split("```")
            raw   = parts[1] if len(parts) > 1 else parts[0]
            if raw.lstrip().startswith("json"):
                raw = raw.lstrip()[4:]

        parsed = json.loads(raw.strip())

        # Validate returned ID exists in DB
        valid_ids = {str(r["id"]): r for r in rows}
        returned_id = parsed.get("infra_type_id", "")
        if returned_id in valid_ids:
            r = valid_ids[returned_id]
            logger.info(
                "Groq inferred infra_type: %s (%s) conf=%.2f",
                r["code"], r["id"], float(parsed.get("confidence", 0)),
            )
            return {"id": str(r["id"]), "code": r["code"], "name": r["name"]}

        logger.warning(
            "Groq returned unknown infra_type_id=%s — falling back to keyword match",
            returned_id,
        )

    except Exception as exc:
        logger.warning("Groq infra_type inference failed: %s — using keyword fallback", exc)

    # ── Keyword fallback ──────────────────────────────────────────
    text_lower = full_text.lower()
    best_score = 0
    best_row   = None

    for r in rows:
        meta = r["metadata"]
        if isinstance(meta, str):
            try:
                meta = json.loads(meta)
            except Exception:
                meta = {}
        keywords = meta.get("typical_keywords", []) if isinstance(meta, dict) else []
        score = sum(1 for kw in keywords if kw.lower() in text_lower)
        if score > best_score:
            best_score = score
            best_row   = r

    if best_row and best_score > 0:
        logger.info(
            "Keyword fallback matched infra_type: %s (score=%d)",
            best_row["code"], best_score,
        )
        return {
            "id":   str(best_row["id"]),
            "code": best_row["code"],
            "name": best_row["name"],
        }

    # ── Hard fallback — alphabetically first (last resort) ────────
    # This should only fire if the DB has no keywords seeded at all.
    r = rows[0]
    logger.warning(
        "No keyword match — using hard fallback infra_type: %s", r["code"]
    )
    return {"id": str(r["id"]), "code": r["code"], "name": r["name"]}
# ─────────────────────────────────────────────────────────────────
# INFRA NODE — find or create
# ─────────────────────────────────────────────────────────────────

def ensure_infra_node(
    db: Session,
    infra_node_id: Optional[str],
    *,
    infra_type_id: str,
    city_id: str,
    lat: float,
    lng: float,
    jurisdiction_id: Optional[str] = None,
) -> Dict[str, Any]:
    """
    Returns infra_node info dict.

    Resolution order:
      1. If infra_node_id given and exists → return it
      2. Spatial proximity search within cluster_radius_meters
         (mirrors fn_find_infra_node_for_cluster logic in Python so
          we can call it outside the SQL transaction if needed)
      3. Geohash exact match
      4. CREATE a new infra_node row

    NOTE: In the normal ingest flow, fn_ingest_complaint already ran
    and created the node atomically before this service is called.
    This function is the safety net for:
      - Direct calls to map_complaint_to_departments from other services
      - Re-mapping existing complaints whose node was deleted/merged
      - Future batch re-processing jobs
    """
    # ── 1. Direct ID lookup ───────────────────────────────────────
    if infra_node_id:
        row = db.execute(
            text("""
                SELECT
                    n.id, n.status,
                    n.total_complaint_count, n.total_resolved_count,
                    n.location_hash,
                    it.name AS infra_type_name,
                    it.code AS infra_type_code
                FROM infra_nodes n
                JOIN infra_types it ON it.id = n.infra_type_id
                WHERE n.id = CAST(:id AS uuid) AND n.is_deleted = FALSE
            """),
            {"id": infra_node_id},
        ).mappings().first()

        if row:
            return {
                "id":                    str(row["id"]),
                "status":                row["status"],
                "total_complaint_count": row["total_complaint_count"],
                "total_resolved_count":  row["total_resolved_count"],
                "infra_type_name":       row["infra_type_name"],
                "infra_type_code":       row["infra_type_code"],
                "created": False,
            }
        logger.warning(
            "infra_node_id=%s provided but not found — running spatial search",
            infra_node_id,
        )

    # ── 2. Spatial proximity search ───────────────────────────────
    # Mirrors fn_find_infra_node_for_cluster: finds the closest
    # existing node of the same type within cluster_radius_meters.
    proximity_row = db.execute(
        text("""
            SELECT
                n.id,
                n.status,
                n.total_complaint_count,
                n.total_resolved_count,
                it.name AS infra_type_name,
                it.code AS infra_type_code,
                ST_Distance(
                    n.location::geography,
                    ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geography
                ) AS distance_m
            FROM infra_nodes n
            JOIN infra_types it ON it.id = n.infra_type_id
            WHERE n.infra_type_id = CAST(:type_id AS uuid)
              AND n.city_id       = CAST(:city_id AS uuid)
              AND n.is_deleted    = FALSE
              AND n.status        != 'decommissioned'
              AND ST_DWithin(
                    n.location::geography,
                    ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geography,
                    it.cluster_radius_meters
              )
            ORDER BY distance_m ASC
            LIMIT 1
        """),
        {"lat": lat, "lng": lng, "type_id": infra_type_id, "city_id": city_id},
    ).mappings().first()

    if proximity_row:
        logger.info(
            "Found nearby infra_node id=%s distance=%.1fm",
            proximity_row["id"], proximity_row["distance_m"],
        )
        return {
            "id":                    str(proximity_row["id"]),
            "status":                proximity_row["status"],
            "total_complaint_count": proximity_row["total_complaint_count"],
            "total_resolved_count":  proximity_row["total_resolved_count"],
            "infra_type_name":       proximity_row["infra_type_name"],
            "infra_type_code":       proximity_row["infra_type_code"],
            "created": False,
        }

    # ── 3. Geohash exact match (faster than spatial for dense areas) ──
    location_hash = db.execute(
        text("SELECT ST_GeoHash(ST_SetSRID(ST_MakePoint(:lng, :lat), 4326), 8) AS h"),
        {"lat": lat, "lng": lng},
    ).scalar()

    if location_hash:
        hash_row = db.execute(
            text("""
                SELECT n.id, n.status,
                       n.total_complaint_count, n.total_resolved_count,
                       it.name AS infra_type_name, it.code AS infra_type_code
                FROM infra_nodes n
                JOIN infra_types it ON it.id = n.infra_type_id
                WHERE n.infra_type_id  = CAST(:type_id AS uuid)
                  AND n.location_hash  = :hash
                  AND n.is_deleted     = FALSE
                LIMIT 1
            """),
            {"type_id": infra_type_id, "hash": location_hash},
        ).mappings().first()

        if hash_row:
            logger.info("Found infra_node via geohash id=%s", hash_row["id"])
            return {
                "id":                    str(hash_row["id"]),
                "status":                hash_row["status"],
                "total_complaint_count": hash_row["total_complaint_count"],
                "total_resolved_count":  hash_row["total_resolved_count"],
                "infra_type_name":       hash_row["infra_type_name"],
                "infra_type_code":       hash_row["infra_type_code"],
                "created": False,
            }

    # ── 4. Create new infra_node ──────────────────────────────────
    new_node_id = str(uuid_lib.uuid4())
    db.execute(
        text("""
            INSERT INTO infra_nodes (
                id, city_id, jurisdiction_id, infra_type_id,
                location, location_hash, status,
                total_complaint_count, total_resolved_count,
                attributes
            ) VALUES (
                CAST(:id        AS uuid),
                CAST(:city_id   AS uuid),
                CAST(:jur_id    AS uuid),
                CAST(:type_id   AS uuid),
                ST_SetSRID(ST_MakePoint(:lng, :lat), 4326),
                ST_GeoHash(ST_SetSRID(ST_MakePoint(:lng, :lat), 4326), 8),
                'damaged',
                0, 0,
                '{"auto_created_by": "mapping_service"}'::jsonb
            )
            ON CONFLICT (infra_type_id, location_hash) DO UPDATE
                SET updated_at = NOW()
            RETURNING id
        """),
        {
            "id":      new_node_id,
            "city_id": city_id,
            "jur_id":  jurisdiction_id,
            "type_id": infra_type_id,
            "lat":     lat,
            "lng":     lng,
        },
    )

    # Fetch infra_type name for return value
    it_row = db.execute(
        text("SELECT name, code FROM infra_types WHERE id = CAST(:id AS uuid)"),
        {"id": infra_type_id},
    ).mappings().first()

    logger.info("Created new infra_node id=%s at lat=%s lng=%s", new_node_id, lat, lng)
    return {
        "id":                    new_node_id,
        "status":                "damaged",
        "total_complaint_count": 0,
        "total_resolved_count":  0,
        "infra_type_name":       it_row["name"] if it_row else "Unknown",
        "infra_type_code":       it_row["code"] if it_row else "GENERAL",
        "created": True,
    }


# ─────────────────────────────────────────────────────────────────
# STEP 1 — Authority resolution via DB function
# ─────────────────────────────────────────────────────────────────

def _resolve_authority(
    db: Session,
    lat: float,
    lng: float,
    city_id: str,
    infra_type_code: str,
    road_name: Optional[str] = None,
) -> Dict[str, Any]:
    """
    Calls fn_route_complaint_authority (from ps_crm_ndmc_and_rules.sql).

    STEP 1 — PWD road-class override (NH/SH/arterial/flyover/bridge)
    STEP 2 — Spatial: NDMC polygon → MCD ward → Cantonment
    STEP 3 — Infra-type fallback: WATER_PIPE/SEWER → DJB, else → MCD

    Explicit VARCHAR casts required — psycopg2 passes Python None as
    type 'unknown' which confuses PostgreSQL's overload resolver.
    """
    row = db.execute(
        text("""
            SELECT
                r.authority_code,
                r.jurisdiction_id,
                r.routing_reason,
                r.confidence
            FROM fn_route_complaint_authority(
                ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geometry(POINT, 4326),
                CAST(:city_id         AS uuid),
                CAST(:infra_type_code AS VARCHAR(20)),
                CAST(:road_name       AS VARCHAR(200))
            ) r
        """),
        {
            "lat":             lat,
            "lng":             lng,
            "city_id":         city_id,
            "infra_type_code": infra_type_code,
            "road_name":       road_name,
        },
    ).mappings().first()

    if not row:
        return {
            "authority_code":  "MCD",
            "jurisdiction_id": None,
            "routing_reason":  "fn_route_complaint_authority returned nothing — fallback MCD",
            "confidence":      0.40,
        }

    return {
        "authority_code":  row["authority_code"],
        "jurisdiction_id": str(row["jurisdiction_id"]) if row["jurisdiction_id"] else None,
        "routing_reason":  row["routing_reason"],
        "confidence":      float(row["confidence"]),
    }


# ─────────────────────────────────────────────────────────────────
# STEP 2 — Load departments for the resolved authority
# ─────────────────────────────────────────────────────────────────

def _load_departments_for_authority(
    db: Session,
    city_id: str,
    authority_code: str,
) -> List[Dict[str, Any]]:
    """
    Returns departments scoped to the resolved authority.

    MCD (9 depts)  → jurisdiction.code = 'MCD' or child of MCD
    NDMC (4 depts) → jurisdiction.code = 'NDMC'
    PWD  (1 dept)  → jurisdiction.code = 'PWD'
    DJB  (1 dept)  → jurisdiction.code = 'DJB'
    CANTONMENT     → fallback to all city depts (no depts seeded yet)
    """
    rows = db.execute(
        text("""
            SELECT
                d.id, d.name, d.code,
                d.metadata         AS extra_meta,
                j.name             AS jurisdiction_name,
                j.code             AS jurisdiction_code
            FROM departments d
            JOIN jurisdictions j ON j.id = d.jurisdiction_id
            WHERE d.city_id = CAST(:city_id AS uuid)
              AND (
                    j.code = :authority_code
                    OR (
                        :authority_code = 'MCD'
                        AND j.id IN (
                            SELECT id FROM jurisdictions
                            WHERE city_id = CAST(:city_id AS uuid)
                              AND (
                                    code = 'MCD'
                                 OR parent_id = (
                                        SELECT id FROM jurisdictions
                                        WHERE city_id = CAST(:city_id AS uuid)
                                          AND code = 'MCD'
                                        LIMIT 1
                                    )
                              )
                        )
                    )
                  )
            ORDER BY d.name
        """),
        {"city_id": city_id, "authority_code": authority_code},
    ).mappings().all()

    # Fallback for authorities with no seeded departments
    if not rows:
        logger.warning(
            "No depts for authority=%s city=%s — loading all city depts",
            authority_code, city_id,
        )
        rows = db.execute(
            text("""
                SELECT d.id, d.name, d.code,
                       d.metadata AS extra_meta,
                       j.name AS jurisdiction_name,
                       j.code AS jurisdiction_code
                FROM departments d
                LEFT JOIN jurisdictions j ON j.id = d.jurisdiction_id
                WHERE d.city_id = CAST(:city_id AS uuid)
                ORDER BY d.name
            """),
            {"city_id": city_id},
        ).mappings().all()

    depts = []
    for row in rows:
        meta = row["extra_meta"] or {}
        if isinstance(meta, str):
            try:
                meta = json.loads(meta)
            except Exception:
                meta = {}

        depts.append({
            "id":                str(row["id"]),
            "name":              row["name"],
            "code":              row["code"],
            "groq_id":           meta.get("groq_dept_id", row["code"].lower()),
            "jurisdiction_name": row["jurisdiction_name"],
            "description":       meta.get("description", ""),
            "handles":           meta.get("handles", []),
            "sla_days":          meta.get("sla_days", {}),
            "urgency_boost":     meta.get("urgency_boost", False),
        })

    return depts


# ─────────────────────────────────────────────────────────────────
# STEP 3 — Groq prompt
# ─────────────────────────────────────────────────────────────────

def _build_groq_prompt(
    title: str,
    description: str,
    infra_type_name: str,
    infra_type_code: str,
    authority_code: str,
    jurisdiction_name: Optional[str],
    routing_reason: str,
    departments: List[Dict[str, Any]],
    infra_node_info: Dict[str, Any],
) -> str:
    dept_lines = "\n".join(
        f'  - id="{d["id"]}" code="{d["code"]}" '
        f'name="{d["name"]}" '
        f'handles={json.dumps(d["handles"])} '
        f'description="{d["description"]}"'
        + (" [URGENT — fast SLA]" if d.get("urgency_boost") else "")
        for d in departments
    )

    node_context = ""
    if infra_node_info:
        created_tag = " (NEW NODE — first complaint on this asset)" if infra_node_info.get("created") else ""
        node_context = (
            f"\nINFRA NODE CONTEXT{created_tag}:\n"
            f"  Status: {infra_node_info.get('status', 'unknown')}\n"
            f"  Total complaints on this node: {infra_node_info.get('total_complaint_count', 0)}\n"
            f"  Previously resolved: {infra_node_info.get('total_resolved_count', 0)}\n"
        )

    return f"""You are a Delhi municipal complaint routing agent for the {authority_code} authority.

A citizen has filed a civic complaint. Your task:
1. Identify ALL departments that MUST act on this complaint.
2. A single complaint can require MULTIPLE departments — always check.
   Example: "electric pole fell because a tree fell on it"
     → EM (electric pole repair) + HORT (tree removal) — both required.
   Example: "garbage piled near a blocked drain"
     → PH (garbage collection) + ENGG (drain unblocking) — both required.
   Example: "broken streetlight on Ring Road"
     → EM (streetlight) — PWD owns road but EM owns the light — only EM.
3. Only include departments that have ACTUAL WORK to do, not just awareness.

AUTHORITY RESOLVED: {authority_code}
ROUTING REASON: {routing_reason}
JURISDICTION: {jurisdiction_name or "city-wide"}
{node_context}
COMPLAINT:
  Title: {title}
  Description: {description}
  Infrastructure type: {infra_type_name} (code: {infra_type_code})

AVAILABLE DEPARTMENTS FOR {authority_code}:
{dept_lines}

STRICT OUTPUT RULES:
1. Return ONLY a valid JSON array. No prose, no markdown, no code fences.
2. Use only dept_id values from the list above — no invented IDs.
3. Only include departments with confidence >= 0.40.
4. Keep "reason" under 12 words.
5. Single responsible department → array with one item is correct.

OUTPUT FORMAT (JSON array only):
[
  {{"dept_id": "<uuid>", "dept_code": "<code>", "confidence": 0.95, "reason": "<why this dept must act>"}},
  ...
]"""


# ─────────────────────────────────────────────────────────────────
# MAIN ENTRY POINT
# ─────────────────────────────────────────────────────────────────

def map_complaint_to_departments(
    db: Session,
    *,
    complaint_id: str,
    city_id: str,
    title: str,
    description: str,
    infra_type_id: str,
    infra_type_code: str,
    infra_type_name: str,
    infra_node_id: Optional[str],
    jurisdiction_name: Optional[str],
    lat: float,
    lng: float,
    road_name: Optional[str] = None,
) -> Dict[str, Any]:
    """
    Full mapping pipeline:

      1.  ensure_infra_type  — find or create infra_type row
      2.  ensure_infra_node  — find or create infra_node row
            (spatial search → geohash → INSERT new node)
      3.  _resolve_authority — fn_route_complaint_authority (PostGIS)
            NDMC / MCD / PWD / DJB
      4.  _load_departments  — filtered to resolved authority
      5.  Groq              — llama-3.3-70b maps to 1–N departments
      6.  Validate          — reject unknown IDs, conf < 0.40
      7.  Fallback          — infra_type.default_dept_ids if Groq fails
      8.  UPDATE complaints.agent_suggested_dept_ids
      9.  INSERT agent_logs
      10. INSERT domain_events DEPT_MAPPED

    If the infra_type or infra_node was absent (e.g. direct API call,
    re-processing job, test), they are created here before mapping
    proceeds — so the pipeline never 500s on missing infrastructure.
    """
    start_ms = int(time.time() * 1000)

    # ── 1. Ensure infra_type exists ───────────────────────────────
    infra_type = ensure_infra_type(
        db,
        infra_type_id,
        fallback_name=infra_type_name or "General Infrastructure",
        fallback_code=infra_type_code  or "GENERAL",
    )
    # Always use the confirmed/canonical values
    infra_type_id   = infra_type["id"]
    infra_type_code = infra_type["code"]
    infra_type_name = infra_type["name"]

    # ── 2. Ensure infra_node exists ───────────────────────────────
    # Resolve jurisdiction_id for new node creation if needed
    jurisdiction_id: Optional[str] = None
    if jurisdiction_name:
        jur_row = db.execute(
            text("""
                SELECT id FROM jurisdictions
                WHERE city_id = CAST(:city_id AS uuid)
                  AND name = :name
                LIMIT 1
            """),
            {"city_id": city_id, "name": jurisdiction_name},
        ).mappings().first()
        if jur_row:
            jurisdiction_id = str(jur_row["id"])

    infra_node_info = ensure_infra_node(
        db,
        infra_node_id,
        infra_type_id=infra_type_id,
        city_id=city_id,
        lat=lat,
        lng=lng,
        jurisdiction_id=jurisdiction_id,
    )
    # Use the confirmed node ID (may differ from input if we found a nearby one)
    resolved_node_id = infra_node_info["id"]

    if infra_node_info.get("created"):
        logger.info(
            "New infra_node %s created for complaint %s",
            resolved_node_id, complaint_id,
        )
        # Update the complaint's infra_node_id if it was NULL or wrong
        db.execute(
            text("""
                UPDATE complaints
                   SET infra_node_id = CAST(:node_id AS uuid),
                       updated_at    = NOW()
                 WHERE id = CAST(:cid AS uuid)
                   AND (infra_node_id IS NULL
                        OR infra_node_id != CAST(:node_id AS uuid))
            """),
            {"node_id": resolved_node_id, "cid": complaint_id},
        )

    # ── 3. Resolve authority ──────────────────────────────────────
    authority      = _resolve_authority(db, lat, lng, city_id, infra_type_code, road_name)
    authority_code = authority["authority_code"]
    routing_reason = authority["routing_reason"]
    routing_conf   = authority["confidence"]

    logger.info(
        "Complaint %s → authority=%s conf=%.2f reason=%s",
        complaint_id, authority_code, routing_conf, routing_reason,
    )

    # ── 4. Load departments for this authority ────────────────────
    departments = _load_departments_for_authority(db, city_id, authority_code)
    if not departments:
        logger.error(
            "Zero departments for city=%s authority=%s — aborting mapping",
            city_id, authority_code,
        )
        return {
            "dept_ids":       [],
            "mappings":       [],
            "authority":      authority_code,
            "avg_confidence": 0.0,
            "routing_reason": routing_reason,
            "node_id":        resolved_node_id,
        }

    # ── 5. Call Groq ──────────────────────────────────────────────
    prompt = _build_groq_prompt(
        title=title,
        description=description,
        infra_type_name=infra_type_name,
        infra_type_code=infra_type_code,
        authority_code=authority_code,
        jurisdiction_name=jurisdiction_name,
        routing_reason=routing_reason,
        departments=departments,
        infra_node_info=infra_node_info,
    )

    raw_output:  str           = ""
    tokens_used: Optional[int] = None
    mappings:    List[Dict]    = []
    groq_error:  Optional[str] = None

    try:
        client   = _get_groq_client()
        response = client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[
                {
                    "role":    "system",
                    "content": "You output ONLY valid JSON arrays. No markdown fences, no explanation, no prose.",
                },
                {"role": "user", "content": prompt},
            ],
            temperature=0.1,
            max_tokens=512,
        )
        raw_output  = response.choices[0].message.content.strip()
        tokens_used = response.usage.total_tokens if response.usage else None
    except Exception as exc:
        groq_error = str(exc)
        logger.error("Groq call failed for complaint %s: %s", complaint_id, exc)

    latency_ms = int(time.time() * 1000) - start_ms

    # ── 6. Parse Groq response ────────────────────────────────────
    if raw_output and not groq_error:
        try:
            clean = raw_output.strip()
            if "```" in clean:
                parts = clean.split("```")
                clean = parts[1] if len(parts) > 1 else parts[0]
                if clean.lstrip().startswith("json"):
                    clean = clean.lstrip()[4:]
            parsed = json.loads(clean.strip())
            if isinstance(parsed, list):
                mappings = parsed
        except Exception as exc:
            logger.error(
                "Groq JSON parse failed for complaint %s: %s | raw=%s",
                complaint_id, exc, raw_output[:300],
            )

    # ── 7. Validate ───────────────────────────────────────────────
    valid_ids = {d["id"] for d in departments}
    valid_mappings = [
        m for m in mappings
        if isinstance(m, dict)
        and m.get("dept_id") in valid_ids
        and float(m.get("confidence", 0)) >= 0.40
    ]

    # ── 7b. Fallback → infra_type.default_dept_ids ───────────────
    if not valid_mappings:
        logger.warning(
            "No valid Groq mappings for complaint %s (groq_error=%s) "
            "— falling back to infra_type.default_dept_ids",
            complaint_id, groq_error,
        )
        infra_row = db.execute(
            text("SELECT default_dept_ids FROM infra_types WHERE code = :code"),
            {"code": infra_type_code},
        ).mappings().first()

        if infra_row and infra_row["default_dept_ids"]:
            for dept_id in infra_row["default_dept_ids"]:
                dept_id_str = str(dept_id)
                dept = next((d for d in departments if d["id"] == dept_id_str), None)
                if dept:
                    valid_mappings.append({
                        "dept_id":    dept_id_str,
                        "dept_code":  dept["code"],
                        "confidence": 0.60,
                        "reason":     "infra_type default department (Groq fallback)",
                    })

    dept_ids       = [m["dept_id"] for m in valid_mappings]
    avg_confidence = (
        sum(float(m["confidence"]) for m in valid_mappings) / len(valid_mappings)
        if valid_mappings else 0.0
    )
    fallback_used = bool(not mappings and valid_mappings)

    # ── 8. UPDATE complaints.agent_suggested_dept_ids ─────────────
    if dept_ids:
        db.execute(
            text("""
                UPDATE complaints
                   SET agent_suggested_dept_ids = CAST(:dept_ids AS uuid[]),
                       updated_at               = NOW()
                 WHERE id = CAST(:complaint_id AS uuid)
            """),
            {
                "dept_ids":     "{" + ",".join(dept_ids) + "}",
                "complaint_id": complaint_id,
            },
        )

    # ── 9. Write agent_logs ───────────────────────────────────────
    db.execute(
        text("""
            INSERT INTO agent_logs (
                agent_type, complaint_id,
                input_data, output_data,
                action_taken, confidence_score,
                latency_ms, model_used, tokens_used
            ) VALUES (
                'DEPT_MAPPER',
                CAST(:complaint_id  AS uuid),
                CAST(:input_data    AS jsonb),
                CAST(:output_data   AS jsonb),
                :action_taken,
                :confidence_score,
                :latency_ms,
                'llama-3.3-70b-versatile',
                :tokens_used
            )
        """),
        {
            "complaint_id":     complaint_id,
            "input_data":       json.dumps({
                "title":            title,
                "description":      description[:400],
                "infra_type_code":  infra_type_code,
                "infra_type_name":  infra_type_name,
                "infra_node_id":    resolved_node_id,
                "node_created":     infra_node_info.get("created", False),
                "authority":        authority_code,
                "routing_reason":   routing_reason,
                "routing_conf":     routing_conf,
                "dept_count":       len(departments),
                "lat":              lat,
                "lng":              lng,
                "road_name":        road_name,
            }),
            "output_data":      json.dumps({
                "mappings":      valid_mappings,
                "raw_output":    raw_output[:800],
                "groq_error":    groq_error,
                "fallback_used": fallback_used,
                "infra_node":    {
                    k: v for k, v in infra_node_info.items()
                    if k != "created"   # keep log clean
                },
            }),
            "action_taken":     "DEPT_MAPPED" if valid_mappings else "DEPT_MAPPING_FAILED",
            "confidence_score": round(avg_confidence, 4),
            "latency_ms":       latency_ms,
            "tokens_used":      tokens_used,
        },
    )

    # ── 10. Write DEPT_MAPPED domain_event ────────────────────────
    db.execute(
        text("""
            INSERT INTO domain_events (
                event_type, entity_type, entity_id,
                actor_type, payload, complaint_id, city_id
            ) VALUES (
                'DEPT_MAPPED', 'complaint',
                CAST(:complaint_id AS uuid),
                'agent',
                CAST(:payload      AS jsonb),
                CAST(:complaint_id AS uuid),
                CAST(:city_id      AS uuid)
            )
        """),
        {
            "complaint_id": complaint_id,
            "city_id":      city_id,
            "payload":      json.dumps({
                "authority":        authority_code,
                "routing_reason":   routing_reason,
                "routing_conf":     routing_conf,
                "mapped_dept_ids":  dept_ids,
                "mappings":         valid_mappings,
                "avg_confidence":   round(avg_confidence, 4),
                "latency_ms":       latency_ms,
                "fallback_used":    fallback_used,
                "infra_node_id":    resolved_node_id,
                "node_created":     infra_node_info.get("created", False),
            }),
        },
    )

    logger.info(
        "Complaint %s mapped → depts=%s avg_conf=%.2f fallback=%s node_created=%s",
        complaint_id,
        [m.get("dept_code") for m in valid_mappings],
        avg_confidence,
        fallback_used,
        infra_node_info.get("created", False),
    )

    return {
        "dept_ids":       dept_ids,
        "mappings":       valid_mappings,
        "authority":      authority_code,
        "avg_confidence": avg_confidence,
        "routing_reason": routing_reason,
        "node_id":        resolved_node_id,
        "node_created":   infra_node_info.get("created", False),
    }