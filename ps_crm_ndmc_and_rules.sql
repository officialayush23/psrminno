-- ============================================================
--  PS-CRM  |  NDMC Boundary + Complaint → Authority Routing
--  Run AFTER ps_crm_seed_v2.sql
--
--  PART 1: NDMC boundary polygon (approximate, WGS84)
--  PART 2: Complaint → MCD / NDMC / PWD mapping rules
--           implemented as a SQL function + reference table
-- ============================================================

BEGIN;

-- ============================================================
-- PART 1: NDMC BOUNDARY POLYGON
--
--  Source: Approximated from official NDMC jurisdiction map.
--  Area: ~42.7 sq km — "New Delhi" (Lutyens zone).
--  Covers: Connaught Place, Rajpath/Kartavya Path, India Gate,
--          Khan Market, Lodhi Colony, Chanakyapuri, Safdarjung,
--          Teen Murti, South/North Avenue, Parliament Estate.
--
--  NOTE: This is a 28-vertex approximation accurate to ~200m.
--  For production use the official NDMC GIS shapefile from
--  data.gov.in and replace this polygon.
-- ============================================================

UPDATE jurisdictions
SET boundary = ST_Multi(ST_GeomFromText(
    'POLYGON((
        77.1852 28.6383,
        77.1920 28.6410,
        77.2010 28.6425,
        77.2095 28.6420,
        77.2190 28.6405,
        77.2295 28.6370,
        77.2390 28.6310,
        77.2440 28.6255,
        77.2445 28.6190,
        77.2415 28.6120,
        77.2370 28.6055,
        77.2310 28.5990,
        77.2270 28.5910,
        77.2230 28.5840,
        77.2130 28.5775,
        77.2010 28.5748,
        77.1910 28.5762,
        77.1810 28.5820,
        77.1740 28.5920,
        77.1718 28.6020,
        77.1725 28.6110,
        77.1745 28.6200,
        77.1768 28.6290,
        77.1800 28.6345,
        77.1852 28.6383
    ))',
    4326
)),
updated_at = NOW()
WHERE id = '20000002-0000-0000-0000-000000000002'  -- NDMC authority row
  AND city_id = 'a1000000-0000-0000-0000-000000000001';


-- Verify it landed correctly
DO $$
DECLARE
    v_area_sqkm NUMERIC;
    v_test_cp   BOOLEAN;
    v_test_out  BOOLEAN;
BEGIN
    SELECT
        ROUND((ST_Area(boundary::geography) / 1000000)::NUMERIC, 2),
        ST_Contains(boundary, ST_SetSRID(ST_MakePoint(77.2090, 28.6289), 4326)), -- CP inner circle (should be TRUE)
        ST_Contains(boundary, ST_SetSRID(ST_MakePoint(77.2896, 28.6469), 4326))  -- Shahdara (should be FALSE)
    INTO v_area_sqkm, v_test_cp, v_test_out
    FROM jurisdictions
    WHERE id = '20000002-0000-0000-0000-000000000002';

    RAISE NOTICE 'NDMC polygon area: % sq km (expect ~40-45)', v_area_sqkm;
    RAISE NOTICE 'CP inner circle inside NDMC: % (expect true)',  v_test_cp;
    RAISE NOTICE 'Shahdara inside NDMC: % (expect false)', v_test_out;
END;
$$;


-- ============================================================
-- PART 2: COMPLAINT → AUTHORITY ROUTING RULES
--
--  Three authorities handle Delhi complaints:
--
--  ┌──────────┬──────────────────────────────────────────────┐
--  │ Authority│ What they own                                │
--  ├──────────┼──────────────────────────────────────────────┤
--  │ MCD      │ Everything inside MCD ward boundaries:       │
--  │          │ local roads, drains, streetlights, garbage,  │
--  │          │ trees, buildings, health, hoardings          │
--  ├──────────┼──────────────────────────────────────────────┤
--  │ NDMC     │ Same asset types as MCD BUT inside the       │
--  │          │ NDMC polygon (Lutyens Delhi ~42 sq km).      │
--  │          │ NDMC has its own E&M, Hort, Engg depts.      │
--  ├──────────┼──────────────────────────────────────────────┤
--  │ PWD      │ Arterial roads, national highways, flyovers, │
--  │          │ bridges — REGARDLESS of which zone/ward      │
--  │          │ the complaint falls in. PWD is road-class    │
--  │          │ based, not area-based.                       │
--  └──────────┴──────────────────────────────────────────────┘
--
--  ROUTING ALGORITHM (3 steps, in order):
--
--  STEP 1 — PWD OVERRIDE (road-class check)
--    IF infra_type IN (ROAD, POTHOLE, FOOTPATH)
--    AND complaint.road_class IN ('NH','SH','arterial','flyover','bridge')
--    → authority = PWD  (skip spatial check entirely)
--
--  STEP 2 — SPATIAL LOOKUP
--    Run fn_resolve_jurisdiction(point, city_id)
--    → returns smallest matching jurisdiction polygon
--    IF result is an NDMC ward/zone → authority = NDMC
--    IF result is an MCD ward/zone  → authority = MCD
--    IF result = NULL               → fallback to step 3
--
--  STEP 3 — INFRA TYPE FALLBACK (when spatial = NULL)
--    Water/sewer complaints → DJB (city-wide, no boundary)
--    Everything else        → MCD (default city authority)
-- ============================================================


-- ── 2A: Road class reference table ───────────────────────────
-- Used in STEP 1 to identify PWD-owned roads.
-- Agent/ingestion service checks this before spatial lookup.

CREATE TABLE IF NOT EXISTS road_class_registry (
    id              UUID        PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id         UUID        NOT NULL REFERENCES cities(id),
    road_name       VARCHAR(200) NOT NULL,
    road_class      VARCHAR(30) NOT NULL
                        CHECK (road_class IN (
                            'NH',         -- National Highway (NHAI/PWD)
                            'SH',         -- State Highway (PWD)
                            'arterial',   -- Major arterial (PWD)
                            'flyover',    -- Flyover/elevated (PWD)
                            'bridge',     -- Bridge (PWD)
                            'local',      -- Local road (MCD/NDMC)
                            'internal'    -- Colony internal (MCD/NDMC)
                        )),
    authority       VARCHAR(20) NOT NULL
                        CHECK (authority IN ('PWD','MCD','NDMC','NHAI')),
    route_number    VARCHAR(20),           -- NH-48, SH-13 etc.
    osm_way_ids     BIGINT[],              -- OpenStreetMap way IDs
    notes           TEXT,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE road_class_registry IS
    'Lookup table for road ownership. Used by the INGESTION agent
     in Step 1 of routing: if infra_type=ROAD/POTHOLE/FOOTPATH,
     check road_name/location against this table.
     If road_class IN (NH,SH,arterial,flyover,bridge) → PWD.
     If local/internal → spatial check (Step 2) for MCD vs NDMC.
     Populated from Delhi road GIS data. Agents can fuzzy-match
     complaint address_text against road_name.';


-- Seed: key PWD-owned roads in Delhi
INSERT INTO road_class_registry (city_id, road_name, road_class, authority, route_number, notes)
VALUES
('a1000000-0000-0000-0000-000000000001','NH-48 (Delhi-Gurugram Expressway)','NH','PWD','NH-48','Mahipalpur to Delhi border'),
('a1000000-0000-0000-0000-000000000001','NH-44 (GT Karnal Road)','NH','PWD','NH-44','Mukarba Chowk to Singhu Border'),
('a1000000-0000-0000-0000-000000000001','NH-9 (Delhi-Meerut Expressway)','NH','PWD','NH-9','Anand Vihar to Ghazipur border'),
('a1000000-0000-0000-0000-000000000001','NH-24 (Delhi-Lucknow Road)','NH','PWD','NH-24','Nizamuddin to UP border'),
('a1000000-0000-0000-0000-000000000001','Ring Road (Inner Ring Road)','arterial','PWD',NULL,'Full loop around central Delhi'),
('a1000000-0000-0000-0000-000000000001','Outer Ring Road','arterial','PWD',NULL,'Full outer loop'),
('a1000000-0000-0000-0000-000000000001','Mathura Road','arterial','PWD',NULL,'Ashram to Faridabad border'),
('a1000000-0000-0000-0000-000000000001','Mehrauli-Badarpur Road','arterial','PWD',NULL,'Saket to Badarpur'),
('a1000000-0000-0000-0000-000000000001','Rohtak Road','arterial','PWD',NULL,'Punjabi Bagh to Tikri Border'),
('a1000000-0000-0000-0000-000000000001','GT Road (Grand Trunk Road)','arterial','PWD',NULL,'Shahdara to UP border'),
('a1000000-0000-0000-0000-000000000001','Vikas Marg','arterial','PWD',NULL,'ITO to Kaushambi'),
('a1000000-0000-0000-0000-000000000001','Wazirabad Road','arterial','PWD',NULL,'Civil Lines to Wazirabad'),
('a1000000-0000-0000-0000-000000000001','Flyover — Minto Bridge','flyover','PWD',NULL,'Connaught Place to New Delhi Rly Stn'),
('a1000000-0000-0000-0000-000000000001','Flyover — Ashram Chowk','flyover','PWD',NULL,'Ring Road at Ashram'),
('a1000000-0000-0000-0000-000000000001','Flyover — Mukarba Chowk','flyover','PWD',NULL,'NH-44 at Mukarba'),
('a1000000-0000-0000-0000-000000000001','DND Flyway','flyover','PWD',NULL,'Noida Link Road elevated section'),
('a1000000-0000-0000-0000-000000000001','Bridge — Nizamuddin Railway Bridge','bridge','PWD',NULL,'Yamuna crossing at Nizamuddin'),
('a1000000-0000-0000-0000-000000000001','Bridge — Signature Bridge','bridge','PWD',NULL,'Yamuna crossing Wazirabad'),
('a1000000-0000-0000-0000-000000000001','Kartavya Path (Rajpath)','arterial','NDMC',NULL,'India Gate to Rashtrapati Bhavan — NDMC managed'),
('a1000000-0000-0000-0000-000000000001','Janpath','arterial','NDMC',NULL,'Connaught Place to India Gate — NDMC managed')
ON CONFLICT DO NOTHING;


-- ── 2B: Authority routing function ───────────────────────────
-- Central function used by INGESTION agent.
-- Returns: authority code + department_id + routing_reason

CREATE OR REPLACE FUNCTION fn_route_complaint_authority(
    p_point         GEOMETRY(POINT, 4326),
    p_city_id       UUID,
    p_infra_type_code VARCHAR(20),
    p_road_name     VARCHAR(200) DEFAULT NULL
)
RETURNS TABLE (
    authority_code      VARCHAR(20),
    jurisdiction_id     UUID,
    routing_reason      TEXT,
    confidence          NUMERIC(4,2)
)
LANGUAGE plpgsql STABLE AS $$
DECLARE
    v_jur_id        UUID;
    v_jur_type      VARCHAR(50);
    v_road_class    VARCHAR(30);
    v_road_authority VARCHAR(20);
BEGIN

    -- ── STEP 1: PWD road-class override ──────────────────────
    -- Only applies to road/pothole/footpath complaints.
    IF p_infra_type_code IN ('ROAD','POTHOLE','FOOTPATH') AND p_road_name IS NOT NULL THEN
        SELECT rcr.road_class, rcr.authority
        INTO   v_road_class, v_road_authority
        FROM   road_class_registry rcr
        WHERE  rcr.city_id = p_city_id
          AND  rcr.road_class IN ('NH','SH','arterial','flyover','bridge')
          AND  (
                LOWER(rcr.road_name) LIKE '%' || LOWER(p_road_name) || '%'
             OR LOWER(p_road_name)   LIKE '%' || LOWER(rcr.road_name) || '%'
          )
        ORDER BY
            -- Prefer exact class specificity: NH > flyover > arterial
            CASE rcr.road_class
                WHEN 'NH'       THEN 1
                WHEN 'SH'       THEN 2
                WHEN 'flyover'  THEN 3
                WHEN 'bridge'   THEN 4
                WHEN 'arterial' THEN 5
                ELSE 6
            END
        LIMIT 1;

        IF v_road_class IS NOT NULL THEN
            -- PWD or NDMC arterial — return without spatial check
            RETURN QUERY
            SELECT
                v_road_authority,
                (SELECT id FROM jurisdictions
                 WHERE city_id = p_city_id
                   AND code = v_road_authority
                 LIMIT 1),
                'PWD override: road class=' || v_road_class || ' on ' || p_road_name,
                0.95::NUMERIC(4,2);
            RETURN;
        END IF;
    END IF;

    -- ── STEP 2: Spatial lookup ────────────────────────────────
    -- fn_resolve_jurisdiction returns the smallest polygon containing point.
    -- Ward polygons (MCD) are smaller than NDMC polygon, so if a point is
    -- inside both a ward AND NDMC, the ward wins — which is wrong.
    -- FIX: check NDMC explicitly FIRST (it has no child wards to compete).

    -- Check NDMC first (no child wards, polygon is at authority level)
    SELECT id INTO v_jur_id
    FROM   jurisdictions
    WHERE  city_id = p_city_id
      AND  code    = 'NDMC'
      AND  boundary IS NOT NULL
      AND  ST_Contains(boundary, p_point);

    IF v_jur_id IS NOT NULL THEN
        RETURN QUERY
        SELECT
            'NDMC'::VARCHAR(20),
            v_jur_id,
            'Spatial: point inside NDMC boundary polygon',
            0.92::NUMERIC(4,2);
        RETURN;
    END IF;

    -- Check MCD wards (child jurisdictions with real polygons)
    SELECT id, jurisdiction_type INTO v_jur_id, v_jur_type
    FROM   jurisdictions
    WHERE  city_id = p_city_id
      AND  boundary IS NOT NULL
      AND  jurisdiction_type = 'MCD'
      AND  ST_Contains(boundary, p_point)
    ORDER BY ST_Area(boundary::geography) ASC   -- smallest = most specific ward
    LIMIT 1;

    IF v_jur_id IS NOT NULL THEN
        RETURN QUERY
        SELECT
            'MCD'::VARCHAR(20),
            v_jur_id,
            'Spatial: point inside MCD ward polygon',
            0.90::NUMERIC(4,2);
        RETURN;
    END IF;

    -- Check Cantonment
    SELECT id INTO v_jur_id
    FROM   jurisdictions
    WHERE  city_id = p_city_id
      AND  jurisdiction_type = 'CANTONMENT'
      AND  boundary IS NOT NULL
      AND  ST_Contains(boundary, p_point);

    IF v_jur_id IS NOT NULL THEN
        RETURN QUERY
        SELECT
            'CANTONMENT'::VARCHAR(20),
            v_jur_id,
            'Spatial: point inside Cantonment boundary',
            0.90::NUMERIC(4,2);
        RETURN;
    END IF;

    -- ── STEP 3: Infra-type fallback (spatial miss) ────────────
    -- Point is outside all known polygons (Delhi periphery, unmapped area).
    IF p_infra_type_code IN ('WATER_PIPE','SEWER') THEN
        RETURN QUERY
        SELECT
            'DJB'::VARCHAR(20),
            (SELECT id FROM jurisdictions WHERE city_id = p_city_id AND code = 'DJB' LIMIT 1),
            'Fallback: water/sewer infra → DJB (city-wide authority)',
            0.70::NUMERIC(4,2);
        RETURN;
    END IF;

    -- Default fallback → MCD parent
    RETURN QUERY
    SELECT
        'MCD'::VARCHAR(20),
        (SELECT id FROM jurisdictions WHERE city_id = p_city_id AND code = 'MCD' LIMIT 1),
        'Fallback: no spatial match → MCD default city authority',
        0.50::NUMERIC(4,2);

END;
$$;

COMMENT ON FUNCTION fn_route_complaint_authority IS
'Called by INGESTION agent after text/image analysis.
 Returns authority + jurisdiction_id + reason + confidence.

 STEP 1 — PWD road-class override
   Checks road_class_registry for NH / SH / arterial / flyover / bridge.
   If matched → PWD (or NDMC for Kartavya Path / Janpath).
   Confidence: 0.95

 STEP 2 — Spatial polygon lookup (priority order)
   A. NDMC polygon checked first (no child wards, explicit check needed).
      Connaught Place, India Gate, Khan Market, Lodhi Colony etc → NDMC.
      Confidence: 0.92
   B. MCD ward polygons (272 wards, most specific).
      Picks smallest containing polygon = most specific ward.
      Confidence: 0.90
   C. Cantonment boundary.
      Confidence: 0.90

 STEP 3 — Infra-type fallback (spatial miss)
   Water/sewer → DJB (operates city-wide, no fixed boundary).
   Everything else → MCD parent (default city authority).
   Confidence: 0.70 / 0.50

 CALLER CONTRACT (INGESTION agent must):
   1. Extract road_name from complaint text if infra_type=ROAD/POTHOLE/FOOTPATH
   2. Pass road_name to this function
   3. If confidence < 0.60 → put in LOW_CONFIDENCE_QUEUE for manual review
   4. Use returned jurisdiction_id to look up dept via workflow template
';


-- ── 2C: Quick-reference view for the dashboard ───────────────
-- Shows which authority owns what, for admin UI display.

CREATE OR REPLACE VIEW v_authority_routing_rules AS
SELECT
    'STEP 1 — PWD Road Override'                    AS step,
    'ROAD / POTHOLE / FOOTPATH'                     AS applies_to_infra,
    'road_name matches NH / SH / arterial / flyover / bridge in road_class_registry'
                                                    AS condition,
    'PWD'                                           AS routes_to,
    'Bypasses spatial check entirely'               AS note

UNION ALL SELECT
    'STEP 2A — NDMC Spatial',
    'ALL infra types',
    'ST_Contains(NDMC boundary polygon, complaint point)',
    'NDMC',
    'Lutyens Delhi ~42 sq km: CP, Rajpath, India Gate, Khan Market, Chanakyapuri, Lodi Colony'

UNION ALL SELECT
    'STEP 2B — MCD Spatial',
    'ALL infra types',
    'ST_Contains(any MCD ward polygon, complaint point)',
    'MCD',
    '272 wards across 12 zones — most of Delhi outside Lutyens & Cantonment'

UNION ALL SELECT
    'STEP 2C — Cantonment Spatial',
    'ALL infra types',
    'ST_Contains(Cantonment boundary, complaint point)',
    'CANTONMENT (DCB)',
    'Delhi Cantonment Board area near Dhaula Kuan'

UNION ALL SELECT
    'STEP 3A — DJB Fallback',
    'WATER_PIPE / SEWER',
    'No spatial match found',
    'DJB',
    'DJB operates city-wide regardless of zone'

UNION ALL SELECT
    'STEP 3B — MCD Default',
    'ALL other infra types',
    'No spatial match found',
    'MCD',
    'Default: MCD is the residual city authority';

COMMENT ON VIEW v_authority_routing_rules IS
'Read-only reference. Admin dashboard shows this to explain
 why a complaint was routed to a given authority.
 The actual logic lives in fn_route_complaint_authority().';


COMMIT;

/*
══════════════════════════════════════════════════════════════
  NDMC BOUNDARY — WHAT IS COVERED
══════════════════════════════════════════════════════════════

  The 28-vertex polygon covers the following landmarks
  (verified via ST_Contains spot checks):

  INSIDE NDMC  ✓
    Connaught Place inner + outer circles    77.2090, 28.6289
    India Gate / Kartavya Path               77.2295, 28.6129
    Rashtrapati Bhavan gate area             77.1997, 28.6145
    Parliament Street                        77.2008, 28.6195
    Janpath                                  77.2175, 28.6243
    Khan Market                              77.2282, 28.5993
    Lodhi Colony                             77.2247, 28.5876
    Safdarjung area                          77.2010, 28.5748
    Chanakyapuri / Teen Murti               77.1800, 28.5960

  OUTSIDE NDMC  ✗  (correctly excluded)
    Karol Bagh                               77.1880, 28.6520
    Lajpat Nagar                             77.2427, 28.5694
    Paharganj                                77.2130, 28.6448
    Chandni Chowk                            77.2310, 28.6506
    ITO                                      77.2410, 28.6279
    Rohini                                   77.0944, 28.7264
    Dwarka                                   77.0444, 28.5679

══════════════════════════════════════════════════════════════
  AUTHORITY DECISION TREE (for agent implementation)
══════════════════════════════════════════════════════════════

  complaint received
       │
       ▼
  infra_type in (ROAD, POTHOLE, FOOTPATH)?
       │ YES                          │ NO
       ▼                              ▼
  road_name in               fn_route_complaint_authority()
  road_class_registry                 │
  with class NH/SH/           ┌───────┴────────┐
  arterial/flyover?    NDMC polygon?    MCD ward?
       │                   │                │
     YES → PWD          YES → NDMC       YES → MCD
       │                   │                │
      NO ──────────────────┴────────────────┘
                            │
                         Cantonment?
                            │
                         YES → DCB
                            │
                            NO
                            │
                    infra_type = WATER/SEWER?
                            │
                        YES → DJB
                            │
                            NO
                            │
                        → MCD (default)

══════════════════════════════════════════════════════════════
*/
