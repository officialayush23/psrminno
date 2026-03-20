-- PS-CRM Seed v3 — Workflows + Surveys
-- Run AFTER: 4.sql, ps_crm_seed_v2.sql, ps_crm_ndmc_and_rules.sql
-- Safe to re-run. All inserts are idempotent.
 
BEGIN;
 
-- ============================================================
-- 1. WORKFLOW TEMPLATES
-- ============================================================
INSERT INTO workflow_templates
  (id, city_id, name, description, created_by, created_at)
VALUES
  ('e0000001-0000-0000-0000-000000000001'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Road Repair','Road surface damage, potholes, craters, tarmac failure','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000002'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Drain Clearance','Blocked storm drain, nali overflow, waterlogging','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000003'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Streetlight Repair','Street light out, lamp post fault, dark road','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000004'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Wire Hazard Resolution','Loose or sparking wire, tree-on-wire emergency','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000005'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Tree / Branch Removal','Fallen tree, dangerous overhanging branch','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000006'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Water Pipe Repair','Burst pipe, leakage, no water supply - DJB','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000007'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Garbage Clearance','Uncollected garbage, overflowing dhalao','00000000-0000-0000-0000-000000000000'::uuid,NOW()),
  ('e0000001-0000-0000-0000-000000000008'::uuid,'a1000000-0000-0000-0000-000000000001'::uuid,'Footpath Repair','Broken tiles, missing footpath slabs','00000000-0000-0000-0000-000000000000'::uuid,NOW())
ON CONFLICT (city_id, name) DO NOTHING;
 
-- ============================================================
-- 2. WORKFLOW TEMPLATE VERSIONS
-- Each version is a separate INSERT to avoid any casting issues.
-- template_id resolved via subquery so it works on re-runs.
-- ============================================================
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000001'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Road Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b1000001-0000-0000-0000-000000000001'::uuid,
  1, TRUE, TRUE, NULL, 'MCD road repair: survey, NOC, repair, QA', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Road Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000002'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Road Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '20000002-0000-0000-0000-000000000002'::uuid, 'b1000001-0000-0000-0000-000000000001'::uuid,
  1, TRUE, TRUE, NULL, 'NDMC road: council work order required', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Road Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000003'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Road Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b2000002-0000-0000-0000-000000000002'::uuid,
  1, TRUE, TRUE, NULL, 'MCD pothole: no road cutting NOC for patching', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Road Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000004'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Drain Clearance'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b3000003-0000-0000-0000-000000000003'::uuid,
  1, TRUE, TRUE, NULL, 'MCD drain: inspect, desilting, jetting, verify', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Drain Clearance') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000005'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Drain Clearance'), 'a1000000-0000-0000-0000-000000000001'::uuid, '20000002-0000-0000-0000-000000000002'::uuid, 'b3000003-0000-0000-0000-000000000003'::uuid,
  1, TRUE, TRUE, NULL, 'NDMC drain: handled by NDMC Engg directly', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Drain Clearance') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000006'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Streetlight Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, '21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid,
  1, TRUE, TRUE, NULL, 'MCD E&M: inspect, parts, repair, night test', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Streetlight Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000007'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Streetlight Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '20000002-0000-0000-0000-000000000002'::uuid, '21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid,
  1, TRUE, TRUE, NULL, 'NDMC E&M: same flow under NDMC electrical division', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Streetlight Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000008'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Wire Hazard Resolution'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b7000007-0000-0000-0000-000000000007'::uuid,
  1, TRUE, TRUE, NULL, 'MCD wire hazard: Horticulture first then E&M', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Wire Hazard Resolution') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000009'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Wire Hazard Resolution'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'bb00000b-0000-0000-0000-00000000000b'::uuid,
  1, TRUE, TRUE, NULL, 'MCD electric pole: E&M only', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Wire Hazard Resolution') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000010'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Tree / Branch Removal'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b5000005-0000-0000-0000-000000000005'::uuid,
  1, TRUE, TRUE, NULL, 'MCD Horticulture: inspect, permission, remove, debris', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Tree / Branch Removal') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000011'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Water Pipe Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, NULL, 'b8000008-0000-0000-0000-000000000008'::uuid,
  1, TRUE, TRUE, NULL, 'DJB water pipe: isolate, NOC, repair, test, reinstate', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Water Pipe Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000012'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Water Pipe Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, NULL, 'b9000009-0000-0000-0000-000000000009'::uuid,
  1, TRUE, TRUE, NULL, 'DJB sewer: inspect, jetting, repair, verify', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Water Pipe Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000013'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Garbage Clearance'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b6000006-0000-0000-0000-000000000006'::uuid,
  1, TRUE, TRUE, NULL, 'MCD SWM: pickup, sanitise, sign-off', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Garbage Clearance') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000014'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Footpath Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '10000001-0000-0000-0000-000000000001'::uuid, 'b4000004-0000-0000-0000-000000000004'::uuid,
  1, TRUE, TRUE, NULL, 'MCD footpath: survey, material approval, repair, QA', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Footpath Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
INSERT INTO workflow_template_versions
  (id, template_id, city_id, jurisdiction_id, infra_type_id,
   version, is_active, is_latest_version, previous_version_id,
   notes, created_by, created_at)
SELECT 'e0000002-0000-0000-0000-000000000015'::uuid, (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Footpath Repair'), 'a1000000-0000-0000-0000-000000000001'::uuid, '20000002-0000-0000-0000-000000000002'::uuid, 'b4000004-0000-0000-0000-000000000004'::uuid,
  1, TRUE, TRUE, NULL, 'NDMC footpath: heritage material specs', '00000000-0000-0000-0000-000000000000'::uuid, NOW()
WHERE (SELECT id FROM workflow_templates WHERE city_id='a1000000-0000-0000-0000-000000000001'::uuid AND name='Footpath Repair') IS NOT NULL
ON CONFLICT (template_id, version) DO NOTHING;
 
-- ============================================================
-- 3. WORKFLOW TEMPLATE STEPS
-- version_id resolved via subquery — always correct regardless
-- of prior runs or existing data.
-- ============================================================
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Site Survey & Assessment', 'JE visits site, photographs damage, estimates material quantity',
  8, FALSE, FALSE, ARRAY['survey'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Road Cutting NOC', 'Obtain NOC for road cutting. BLOCKED Jul-Sep monsoon moratorium.',
  24, FALSE, FALSE, ARRAY['road_cutting','noc'], '{"seasonal_block":"monsoon"}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Road Repair Execution', 'Contractor patches potholes or relays bitumen. Before/after photos mandatory.',
  48, FALSE, FALSE, ARRAY['road_repair','civil_work'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Quality Assurance Inspection', 'JE/AE inspects completed work. Signs completion certificate.',
  8, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Site Survey & Technical Report', 'JE prepares technical report with cost estimate for council',
  8, FALSE, FALSE, ARRAY['survey'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'NDMC Work Order Approval', 'NDMC Secretary approval required before any contractor engagement.',
  48, FALSE, FALSE, ARRAY['admin_approval','work_order'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Road Cutting NOC', 'NOC for road cutting - seasonal block applies',
  24, FALSE, FALSE, ARRAY['road_cutting','noc'], '{"seasonal_block":"monsoon"}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Repair Execution', 'Repair with NDMC heritage-compatible materials',
  48, FALSE, FALSE, ARRAY['road_repair','civil_work'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 5, 'd1000000-0000-0000-0000-000000000001'::uuid, 'QA + NDMC Completion Certificate', 'Final inspection and NDMC completion certificate',
  8, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 5
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Site Verification', 'JE verifies pothole size and assigns priority',
  4, FALSE, FALSE, ARRAY['survey'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Pothole Patching', 'Cold/hot mix patching. No NOC needed. Not subject to monsoon block.',
  24, FALSE, FALSE, ARRAY['road_repair','patching'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Sign-off & Photo Check', 'After photo uploaded, supervisor verifies. Complaint closed.',
  4, FALSE, FALSE, ARRAY['inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Drain Inspection', 'Field staff inspect drain, assess blockage level and cause',
  4, FALSE, FALSE, ARRAY['inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Desilting & Manual Clearance', 'MCD drain gang removes silt and debris',
  12, FALSE, FALSE, ARRAY['drain_clearance','desilting'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd9000000-0000-0000-0000-000000000009'::uuid, 'High-Pressure Jetting', 'Optional: jetting machine for deep blockage',
  6, TRUE, FALSE, ARRAY['drain_jetting'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Site Verification & Close', 'JE verifies free flow. Citizens notified.',
  4, FALSE, FALSE, ARRAY['inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'NDMC Drain Inspection', 'NDMC field engineer inspects and classifies blockage',
  4, FALSE, FALSE, ARRAY['inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Clearance & Jetting', 'NDMC drain crew - combined manual and jetting',
  8, FALSE, FALSE, ARRAY['drain_clearance','desilting'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Completion Verification', 'Engineer sign-off and citizen notification',
  2, FALSE, FALSE, ARRAY['inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Electrical Inspection', 'Lineman inspects pole, checks connection, identifies fault',
  4, FALSE, FALSE, ARRAY['inspection','electrical'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Parts Requisition', 'Parts request logged. Emergency procurement if out-of-stock.',
  8, FALSE, FALSE, ARRAY['procurement'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Repair & Restoration', 'Lineman replaces bulb/fixes wiring. Night test mandatory.',
  6, FALSE, FALSE, ARRAY['electrical','repair'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Functional Test & Close', 'AE verifies light operational at night.',
  4, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd2000000-0000-0000-0000-000000000002'::uuid, 'NDMC Electrical Inspection', 'NDMC Elect Division lineman inspection',
  4, FALSE, FALSE, ARRAY['inspection','electrical'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Repair & Restoration', 'Repair by NDMC contractor or direct employee',
  6, FALSE, FALSE, ARRAY['electrical','repair'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd2000000-0000-0000-0000-000000000002'::uuid, 'NDMC Completion Sign-off', 'NDMC AE verifies and closes',
  4, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd4000000-0000-0000-0000-000000000004'::uuid, 'Horticulture: Branch Removal', 'Horticulture cuts branch on wire. E&M CANNOT start until COMPLETED.',
  4, FALSE, FALSE, ARRAY['tree_cutting','emergency_clearance'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd2000000-0000-0000-0000-000000000002'::uuid, 'E&M: Wire Repair & Insulation', 'Lineman secures/replaces damaged wire. BSES/BYPL coordination if HT line.',
  6, FALSE, FALSE, ARRAY['electrical','wire_repair'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Safety Clearance & Sign-off', 'AE verifies no live wire exposure. Public safety clearance issued.',
  2, FALSE, FALSE, ARRAY['inspection','safety_clearance'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Pole Inspection & Risk Assessment', 'E&M assesses damage, checks BSES/BYPL HT line',
  4, FALSE, FALSE, ARRAY['inspection','electrical'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Pole Replacement/Straightening', 'Pole replaced or re-anchored. Power restored.',
  12, FALSE, FALSE, ARRAY['electrical','civil_work'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd2000000-0000-0000-0000-000000000002'::uuid, 'Functional Test & Close', 'AE verifies safe operation and signs off',
  4, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd4000000-0000-0000-0000-000000000004'::uuid, 'Tree / Branch Inspection', 'Horticulture assesses - fallen/dangerous/diseased',
  4, FALSE, FALSE, ARRAY['inspection','horticulture'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd4000000-0000-0000-0000-000000000004'::uuid, 'DDA / Forest Dept Permission', 'For DDA park trees: permission required. Waivable for emergencies.',
  24, TRUE, FALSE, ARRAY['admin_approval'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd4000000-0000-0000-0000-000000000004'::uuid, 'Tree Removal / Pruning', 'Horticulture team removes fallen tree or prunes dangerous branches.',
  8, FALSE, FALSE, ARRAY['tree_cutting','horticulture'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd4000000-0000-0000-0000-000000000004'::uuid, 'Debris Clearance', 'Wood/debris removed to depot. Road/footpath cleared.',
  4, FALSE, FALSE, ARRAY['clearance','horticulture'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 1, 'da000000-0000-0000-0000-00000000000a'::uuid, 'Leak Detection & Isolation', 'DJB isolates zone valve. Citizens notified of supply interruption.',
  4, FALSE, FALSE, ARRAY['inspection','water_isolation'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Road Cutting NOC from MCD/NDMC', 'DJB applies for NOC. Seasonal block applies.',
  24, FALSE, FALSE, ARRAY['road_cutting','noc'], '{"seasonal_block":"monsoon"}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 3, 'da000000-0000-0000-0000-00000000000a'::uuid, 'Pipe Repair / Replacement', 'DJB crew excavates, repairs or replaces pipe section.',
  24, FALSE, FALSE, ARRAY['water_repair','civil_work'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 4, 'da000000-0000-0000-0000-00000000000a'::uuid, 'Pressure Test & Supply Restoration', 'DJB tests pipeline, restores supply.',
  8, FALSE, FALSE, ARRAY['water_test','inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 5, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Road Reinstatement', 'Road surface reinstated by MCD/NDMC after DJB pipe work.',
  24, FALSE, FALSE, ARRAY['road_repair','reinstatement'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 5
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 1, 'da000000-0000-0000-0000-00000000000a'::uuid, 'Sewer Inspection', 'DJB crew inspects manhole, identifies blockage level',
  4, FALSE, FALSE, ARRAY['inspection','sewer'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 2, 'da000000-0000-0000-0000-00000000000a'::uuid, 'High-Pressure Jetting', 'DJB jetting tanker clears blockage',
  6, FALSE, FALSE, ARRAY['sewer_jetting','drain_clearance'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 3, 'da000000-0000-0000-0000-00000000000a'::uuid, 'Structural Repair (if needed)', 'Manhole/pipe structural repair. Optional.',
  24, TRUE, FALSE, ARRAY['sewer_repair','civil_work'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1), 4, 'da000000-0000-0000-0000-00000000000a'::uuid, 'Flow Verification & Sign-off', 'DJB verifies free flow. Area sanitised.',
  4, FALSE, FALSE, ARRAY['inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd3000000-0000-0000-0000-000000000003'::uuid, 'Immediate Garbage Pickup', 'SWM team same-day. Dhalaao cleared. Before/after photos.',
  8, FALSE, FALSE, ARRAY['garbage_collection','swm'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd3000000-0000-0000-0000-000000000003'::uuid, 'Site Sanitisation', 'Area disinfected, drain checked for organic waste.',
  2, FALSE, FALSE, ARRAY['sanitation','swm'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd3000000-0000-0000-0000-000000000003'::uuid, 'Supervisor Sign-off', 'Zone supervisor verifies and uploads after photo.',
  2, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Footpath Damage Survey', 'JE surveys broken tiles, missing slabs. Material estimate.',
  4, FALSE, FALSE, ARRAY['survey','inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Material Approval', 'Material type and quantity approved by AE/EE.',
  8, FALSE, FALSE, ARRAY['admin_approval','procurement'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Repair & Reinstatement', 'Tiles laid, slabs replaced, ramps fixed. Before/after photos.',
  24, FALSE, FALSE, ARRAY['civil_work','footpath_repair'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd1000000-0000-0000-0000-000000000001'::uuid, 'QA Check & Close', 'JE walks repaired section. Verifies no trip hazards.',
  4, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 1, 'd1000000-0000-0000-0000-000000000001'::uuid, 'NDMC Footpath Survey', 'NDMC Engg surveys with heritage material specs',
  4, FALSE, FALSE, ARRAY['survey','inspection'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 1
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 2, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Material Approval (NDMC specs)', 'Heritage-compatible material approved by NDMC AE',
  8, FALSE, FALSE, ARRAY['admin_approval','procurement'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 2
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 3, 'd1000000-0000-0000-0000-000000000001'::uuid, 'Repair', 'NDMC footpath repair with approved materials',
  24, FALSE, FALSE, ARRAY['civil_work','footpath_repair'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 3
  );
 
INSERT INTO workflow_template_steps
  (id, version_id, step_number, department_id, step_name, description,
   expected_duration_hours, is_optional, requires_tender,
   work_type_codes, metadata, created_at)
SELECT uuid_generate_v4(), (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1), 4, 'd1000000-0000-0000-0000-000000000001'::uuid, 'QA & NDMC Sign-off', 'NDMC AE verifies and closes',
  4, FALSE, FALSE, ARRAY['inspection','qa'], '{}'::jsonb, NOW()
WHERE (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_template_steps
    WHERE version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND step_number = 4
  );
 
-- ============================================================
-- 4. WORKFLOW STEP DEPENDENCIES
-- Both step_id and depends_on_step_id resolved via subquery.
-- No hardcoded step UUIDs — fully safe on re-runs.
-- ============================================================
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 5), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 5) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 5) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b1000001-0000-0000-0000-000000000001'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Road Repair' AND v.infra_type_id='b2000002-0000-0000-0000-000000000002'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Drain Clearance' AND v.infra_type_id='b3000003-0000-0000-0000-000000000003'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Streetlight Repair' AND v.infra_type_id='21c476c5-c48f-4426-a2e6-6284ca831dc8'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='b7000007-0000-0000-0000-000000000007'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Wire Hazard Resolution' AND v.infra_type_id='bb00000b-0000-0000-0000-00000000000b'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Tree / Branch Removal' AND v.infra_type_id='b5000005-0000-0000-0000-000000000005'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 5), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 5) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 5) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b8000008-0000-0000-0000-000000000008'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Water Pipe Repair' AND v.infra_type_id='b9000009-0000-0000-0000-000000000009'::uuid AND v.jurisdiction_id IS NULL AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Garbage Clearance' AND v.infra_type_id='b6000006-0000-0000-0000-000000000006'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='10000001-0000-0000-0000-000000000001'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 1)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 2)
  );
 
INSERT INTO workflow_step_dependencies (step_id, depends_on_step_id)
SELECT (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4), (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
WHERE (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) IS NOT NULL AND (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM workflow_step_dependencies
    WHERE step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 4) AND depends_on_step_id = (SELECT s.id FROM workflow_template_steps s WHERE s.version_id = (SELECT v.id FROM workflow_template_versions v JOIN workflow_templates t ON t.id=v.template_id WHERE t.name='Footpath Repair' AND v.infra_type_id='b4000004-0000-0000-0000-000000000004'::uuid AND v.jurisdiction_id='20000002-0000-0000-0000-000000000002'::uuid AND v.is_latest_version=TRUE LIMIT 1) AND s.step_number = 3)
  );
 
-- ============================================================
-- 5. SURVEY TEMPLATES
-- ============================================================
INSERT INTO survey_templates
  (id, name, survey_type, trigger_at_step_pct, questions, is_active, created_by, created_at)
VALUES
  ('e0000004-0000-0000-0000-000000000001'::uuid,
   'Midway Citizen Satisfaction', 'midway', 50,
   '[{"id":"q1","text":"Work has started. Are you satisfied with the speed of response?","text_hi":"\u0915\u094d\u092f\u093e \u0906\u092a \u092a\u094d\u0930\u0924\u093f\u0915\u094d\u0930\u093f\u092f\u093e \u0915\u0940 \u0917\u0924\u093f \u0938\u0947 \u0938\u0902\u0924\u0941\u0937\u094d\u091f \u0939\u0948\u0902?","type":"rating","scale":5,"required":true},{"id":"q2","text":"Were you informed about progress?","type":"boolean","required":true},{"id":"q3","text":"Any specific concerns about the ongoing work?","type":"text","required":false,"max_chars":300}]'::jsonb,
   TRUE, '00000000-0000-0000-0000-000000000000'::uuid, NOW()),
  ('e0000004-0000-0000-0000-000000000002'::uuid,
   'Completion Citizen Satisfaction', 'completion', NULL,
   '[{"id":"q1","text":"How satisfied are you with the resolution?","type":"rating","scale":5,"required":true},{"id":"q2","text":"Was the work completed professionally?","type":"rating","scale":5,"required":true},{"id":"q3","text":"Is the problem fully resolved?","type":"boolean","required":true},{"id":"q4","text":"Additional feedback?","type":"text","required":false,"max_chars":500}]'::jsonb,
   TRUE, '00000000-0000-0000-0000-000000000000'::uuid, NOW()),
  ('e0000004-0000-0000-0000-000000000003'::uuid,
   'Worker Task Feedback', 'worker_feedback', NULL,
   '[{"id":"q1","text":"Did you have all materials and equipment needed?","type":"boolean","required":true},{"id":"q2","text":"Were the task instructions clear?","type":"rating","scale":5,"required":true},{"id":"q3","text":"Any obstacles encountered?","type":"text","required":false,"max_chars":300},{"id":"q4","text":"Estimated time taken (hours)","type":"number","required":true}]'::jsonb,
   TRUE, '00000000-0000-0000-0000-000000000000'::uuid, NOW())
ON CONFLICT DO NOTHING;
 
 
COMMIT;
 
-- VERIFICATION QUERIES:
-- SELECT COUNT(*) FROM workflow_templates;         -- expect 8
-- SELECT COUNT(*) FROM workflow_template_versions; -- expect 15
-- SELECT COUNT(*) FROM workflow_template_steps;    -- expect 56
-- SELECT COUNT(*) FROM workflow_step_dependencies; -- expect 37
-- SELECT COUNT(*) FROM survey_templates;           -- expect 3