# PS-CRM — Complete GCP Architecture Guide
## From Zero to Production

---

## ARCHITECTURE OVERVIEW

```
CITIZEN / OFFICIAL / ADMIN
        │
        ▼
┌─────────────────────────────────────────────────────────────┐
│                    FIREBASE LAYER                           │
│  Firebase Auth (Identity)  │  FCM (Push Notifications)     │
└─────────────────────────────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────────────────────────────┐
│                 API GATEWAY / CLOUD RUN                     │
│  ingestion-service  │  workflow-engine  │  agent-service    │
│  notification-svc   │  kpi-service      │  public-api       │
└─────────────────────────────────────────────────────────────┘
        │                    │                    │
        ▼                    ▼                    ▼
┌──────────────┐   ┌──────────────────┐   ┌─────────────────┐
│  Cloud SQL   │   │   Cloud Pub/Sub  │   │   Vertex AI     │
│  PostgreSQL  │   │   (Event Bus)    │   │ (Agents + LLM)  │
│  + pgvector  │   └──────────────────┘   └─────────────────┘
│  + PostGIS   │            │
└──────────────┘            ▼
        │           ┌──────────────────┐
        │           │  Cloud Tasks     │
        │           │  (Scheduled)     │
        │           └──────────────────┘
        ▼
┌─────────────────────────────────────────────────────────────┐
│                    SUPPORT SERVICES                         │
│  Cloud Storage (GCS)  │  Secret Manager  │  Cloud Scheduler│
│  Cloud Translation    │  Cloud Logging   │  Cloud Monitoring│
└─────────────────────────────────────────────────────────────┘
```

---

## ALLOYDB vs CLOUD SQL — DECIDE THIS FIRST

### What is AlloyDB?
AlloyDB is Google's PostgreSQL-compatible database with a columnar engine,
faster analytics, and built-in vector search. It is NOT Cloud SQL.

### For PS-CRM: Use Cloud SQL, NOT AlloyDB.

| Feature           | Cloud SQL PostgreSQL     | AlloyDB                     |
|-------------------|--------------------------|-----------------------------|
| PostgreSQL compat | Full                     | Full                        |
| pgvector          | ✅ Yes                   | ✅ Yes (built-in)           |
| PostGIS           | ✅ Yes                   | ✅ Yes                      |
| Free tier         | ❌ No (~$7/month min)    | ❌ No (~$150/month min)     |
| Hackathon viable  | ✅ Yes                   | ❌ No                       |
| Your schema runs  | ✅ Unchanged             | ✅ Unchanged                |
| When to upgrade   | > 1M complaints/day      | Never for this use case     |

**Verdict:** AlloyDB costs ~20x more than Cloud SQL for no meaningful benefit
at your scale. Your schema (pgvector + PostGIS + partitioning) already covers
everything AlloyDB would give you. Stick with Cloud SQL.

**Free tier workaround for Cloud SQL:**
Cloud SQL has no free tier but has a $300 free credit for new GCP accounts.
That covers ~3-4 months of a db-f1-micro instance at full usage.
After credits: ~$7-15/month for a small instance. That's your only real cost.

---

## STEP-BY-STEP SETUP

---

### PHASE 0 — PROJECT SETUP (Do this first, everything depends on it)

#### 0.1 Create GCP Project
```bash
# Install gcloud CLI first: https://cloud.google.com/sdk/docs/install

# Login
gcloud auth login

# Create project
gcloud projects create ps-crm-delhi --name="PS-CRM Delhi"

# Set as default
gcloud config set project ps-crm-delhi

# Link billing account (REQUIRED — even for free tier services)
# Get your billing account ID:
gcloud billing accounts list

# Link it:
gcloud billing projects link ps-crm-delhi \
  --billing-account=YOUR_BILLING_ACCOUNT_ID
```

#### 0.2 Enable Core APIs (do all at once)
```bash
gcloud services enable \
  sqladmin.googleapis.com \
  run.googleapis.com \
  pubsub.googleapis.com \
  cloudtasks.googleapis.com \
  cloudscheduler.googleapis.com \
  storage.googleapis.com \
  secretmanager.googleapis.com \
  translate.googleapis.com \
  monitoring.googleapis.com \
  logging.googleapis.com \
  aiplatform.googleapis.com \
  firebase.googleapis.com \
  fcm.googleapis.com \
  identitytoolkit.googleapis.com \
  eventarc.googleapis.com \
  artifactregistry.googleapis.com \
  cloudbuild.googleapis.com
```

#### 0.3 Set region (all services use this)
```bash
gcloud config set compute/region asia-south1
# asia-south1 = Mumbai — closest to Delhi, lowest latency
```

---

### PHASE 1 — CLOUD SQL (PostgreSQL + pgvector + PostGIS)

**Free tier status:** ❌ NOT free. ~$7-15/month after $300 credit.

#### 1.1 Create the instance
```bash
gcloud sql instances create ps-crm-db \
  --database-version=POSTGRES_15 \
  --tier=db-g1-small \
  --region=asia-south1 \
  --storage-type=SSD \
  --storage-size=20GB \
  --storage-auto-increase \
  --backup-start-time=02:00 \
  --maintenance-window-day=SUN \
  --maintenance-window-hour=3 \
  --database-flags=max_connections=100 \
  --availability-type=zonal
```

**Tier guide:**
- `db-f1-micro`  — 0.6GB RAM — development only (not recommended)
- `db-g1-small`  — 1.7GB RAM — hackathon + early production ✅
- `db-n1-standard-2` — 7.5GB RAM — when you go live at scale

#### 1.2 Create database and user
```bash
# Create database
gcloud sql databases create pscrm \
  --instance=ps-crm-db \
  --charset=UTF8

# Create app user (never use postgres superuser in app)
gcloud sql users create pscrm_app \
  --instance=ps-crm-db \
  --password=GENERATE_A_STRONG_PASSWORD_HERE
```

#### 1.3 Enable extensions (connect via Cloud Shell or proxy)
```bash
# Install Cloud SQL Auth Proxy locally
curl -o cloud-sql-proxy \
  https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.8.1/cloud-sql-proxy.linux.amd64
chmod +x cloud-sql-proxy

# Start proxy in background
./cloud-sql-proxy ps-crm-delhi:asia-south1:ps-crm-db &

# Connect via psql
psql "host=127.0.0.1 port=5432 dbname=pscrm user=pscrm_app"
```

```sql
-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS vector;  -- pgvector

-- Verify
SELECT extname, extversion FROM pg_extension
WHERE extname IN ('uuid-ossp', 'postgis', 'vector');
```

#### 1.4 Run your schema files IN ORDER
```bash
psql "host=127.0.0.1 port=5432 dbname=pscrm user=pscrm_app" \
  -f ps_crm_schema_v3.sql

psql "host=127.0.0.1 port=5432 dbname=pscrm user=pscrm_app" \
  -f ps_crm_critical_fixes_v3_1.sql

psql "host=127.0.0.1 port=5432 dbname=pscrm user=pscrm_app" \
  -f ps_crm_final_fixes_v3_2.sql
```

#### 1.5 Store connection string in Secret Manager
```bash
gcloud secrets create pscrm-db-url \
  --data-file=- <<< "postgresql://pscrm_app:PASSWORD@/pscrm?host=/cloudsql/ps-crm-delhi:asia-south1:ps-crm-db"

# Cloud Run services access this secret at runtime — no hardcoded credentials
```

---

### PHASE 2 — VECTOR SEARCH STRATEGY

**Your situation:** pgvector inside Cloud SQL handles embeddings.
You do NOT need a separate vector database. Here is why, and when you would.

#### Your vector architecture (pgvector — already in schema)
```
Complaint ingestion
     │
     ▼
Cloud Run ingestion-service
     │
     ├── 1. Call Nomic API (text embedding, 768d)
     ├── 2. Call Nomic API (image embedding, 768d) if image present
     │
     ▼
INSERT INTO complaint_embeddings (text_embedding, image_embedding)
     │
     ▼
IVFFlat index (lists=100) — cosine similarity
```

#### Similarity search query (duplicate detection)
```sql
SELECT
    ce.complaint_id,
    1 - (ce.text_embedding <=> $1::vector) AS similarity
FROM complaint_embeddings ce
JOIN complaints c ON c.id = ce.complaint_id
WHERE c.infra_node_id = $2
  AND c.is_deleted = FALSE
  AND 1 - (ce.text_embedding <=> $1::vector) > 0.85
ORDER BY ce.text_embedding <=> $1::vector
LIMIT 5;
```

#### When you would need Vertex AI Vector Search (Matching Engine)
- > 5 million complaint embeddings
- Sub-100ms search across entire city history
- For PS-CRM at hackathon/early production: pgvector is sufficient.

#### Nomic API setup
```bash
# Store Nomic API key in Secret Manager
gcloud secrets create nomic-api-key \
  --data-file=- <<< "YOUR_NOMIC_API_KEY"

# In Cloud Run ingestion-service (Python):
# pip install nomic
```

```python
# ingestion_service/embeddings.py
import nomic
from nomic import embed

def get_text_embedding(text: str) -> list[float]:
    """Always called. Required for every complaint."""
    output = embed.text(
        texts=[text],
        model='nomic-embed-text-v1.5',
        task_type='search_document'
    )
    return output['embeddings'][0]  # 768-dim

def get_image_embedding(image_url: str) -> list[float] | None:
    """Called only if complaint has images. Returns None on failure."""
    try:
        output = embed.image(
            images=[image_url],
            model='nomic-embed-vision-v1.5'
        )
        return output['embeddings'][0]  # 768-dim
    except Exception:
        return None  # NULL in DB — valid, not a failure
```

---

### PHASE 3 — CLOUD PUB/SUB (Event Bus)

**Free tier:** ✅ First 10GB/month free. You will not exceed this.

#### 3.1 Create topics
```bash
# One topic per domain
gcloud pubsub topics create ps-crm-complaints
gcloud pubsub topics create ps-crm-workflow
gcloud pubsub topics create ps-crm-tasks
gcloud pubsub topics create ps-crm-surveys
gcloud pubsub topics create ps-crm-notifications
gcloud pubsub topics create ps-crm-agent

# Dead letter topic (failed messages go here → ops alert)
gcloud pubsub topics create ps-crm-dead-letter
```

#### 3.2 Create subscriptions (one per consuming Cloud Run service)
```bash
# ingestion events → agent-service
gcloud pubsub subscriptions create sub-agent-complaints \
  --topic=ps-crm-complaints \
  --ack-deadline=60 \
  --dead-letter-topic=ps-crm-dead-letter \
  --max-delivery-attempts=5 \
  --push-endpoint=https://agent-service-HASH-uc.a.run.app/events/complaints

# workflow events → notification-service
gcloud pubsub subscriptions create sub-notifications-workflow \
  --topic=ps-crm-workflow \
  --ack-deadline=60 \
  --dead-letter-topic=ps-crm-dead-letter \
  --max-delivery-attempts=5 \
  --push-endpoint=https://notification-service-HASH-uc.a.run.app/events/workflow

# task events → notification-service
gcloud pubsub subscriptions create sub-notifications-tasks \
  --topic=ps-crm-tasks \
  --ack-deadline=60 \
  --dead-letter-topic=ps-crm-dead-letter \
  --max-delivery-attempts=5 \
  --push-endpoint=https://notification-service-HASH-uc.a.run.app/events/tasks

# survey events → survey-service
gcloud pubsub subscriptions create sub-surveys \
  --topic=ps-crm-surveys \
  --ack-deadline=60 \
  --dead-letter-topic=ps-crm-dead-letter \
  --max-delivery-attempts=5 \
  --push-endpoint=https://survey-service-HASH-uc.a.run.app/events/surveys
```

#### 3.3 Event flow (how your services publish)
```python
# Any Cloud Run service — publishing an event
from google.cloud import pubsub_v1
import json

publisher = pubsub_v1.PublisherClient()

def publish_event(topic_name: str, event_type: str, payload: dict):
    topic_path = publisher.topic_path("ps-crm-delhi", topic_name)
    data = json.dumps({
        "event_type": event_type,
        "payload": payload
    }).encode("utf-8")
    future = publisher.publish(
        topic_path,
        data,
        event_type=event_type  # message attribute for filtering
    )
    return future.result()  # blocks until published

# Example: complaint received
publish_event(
    "ps-crm-complaints",
    "COMPLAINT_RECEIVED",
    {
        "complaint_id": str(complaint_id),
        "city_id": str(city_id),
        "is_repeat": is_repeat,
        "priority": priority
    }
)
```

---

### PHASE 4 — VERTEX AI (Agentic AI)

**Free tier:** Gemini 1.5 Flash — 15 requests/min free on free tier.
Gemini 1.5 Pro — paid. For hackathon: Flash is sufficient.

#### 4.1 Enable Vertex AI
```bash
gcloud services enable aiplatform.googleapis.com

# Set default location
gcloud config set ai/region asia-south1
```

#### 4.2 Agent Architecture for PS-CRM

Your agents map to these Vertex AI components:

```
INGESTION AGENT
  → Cloud Run (ingestion-service)
  → Calls: Nomic (embeddings) + Cloud Translation + Gemini Flash (summary)
  → Writes: fn_ingest_complaint() DB function

WORKFLOW ENGINE AGENT
  → Cloud Run (workflow-engine)
  → Triggered by: ps-crm-complaints Pub/Sub
  → Uses: Gemini Flash for dept mapping + priority scoring
  → Writes: workflow_instances, workflow_step_instances, domain_events

SUMMARY GENERATOR AGENT
  → Cloud Run (agent-service)
  → Triggered by: new task assignment event
  → Uses: Gemini Flash to summarise complaint cluster for official
  → Writes: tasks.agent_summary, complaints.agent_summary

ESCALATION DETECTOR
  → Cloud Run (agent-service)
  → Triggered by: Cloud Scheduler every 15 minutes
  → Reads: task_sla WHERE is_breached = FALSE AND due_at < NOW()
  → Publishes: TASK_SLA_BREACHED to ps-crm-tasks

SURVEY TRIGGER AGENT
  → Fully autonomous — no human in loop
  → Triggered by: STEP_COMPLETED event on ps-crm-workflow
  → Checks: workflow progress % vs survey_templates.trigger_at_step_pct
  → Creates: survey_instances, schedules Cloud Tasks dispatch
```

#### 4.3 Vertex AI Agent Builder (for complex agents)
```bash
# Enable Agent Builder
gcloud services enable discoveryengine.googleapis.com

# For LangGraph-style agentic workflows, use Vertex AI Reasoning Engine
# (replaces the need to run LangGraph on Cloud Run yourself)
gcloud services enable aiplatform.googleapis.com
```

```python
# agent-service/workflow_engine_agent.py
import vertexai
from vertexai.generative_models import GenerativeModel

vertexai.init(project="ps-crm-delhi", location="asia-south1")

model = GenerativeModel("gemini-1.5-flash-002")

DEPT_MAPPER_PROMPT = """
You are a civic complaint router for Delhi.
Given this complaint: {description}
Location: {address} (Jurisdiction: {jurisdiction})
Infrastructure type: {infra_type}

Return a JSON object:
{{
  "departments": ["DEPT_CODE_1", "DEPT_CODE_2"],
  "sequence": "sequential" | "parallel",
  "priority": "low" | "normal" | "high" | "critical",
  "reasoning": "one sentence"
}}

Available departments: {available_depts}
Rules:
- If road + utilities involved: IGL or DJB first, PWD last
- NDMC jurisdiction: use NDMC workflow, not PWD
- Only return departments that are actually needed
"""

def map_complaint_to_departments(
    description: str,
    address: str,
    jurisdiction: str,
    infra_type: str,
    available_depts: list[dict]
) -> dict:
    prompt = DEPT_MAPPER_PROMPT.format(
        description=description,
        address=address,
        jurisdiction=jurisdiction,
        infra_type=infra_type,
        available_depts=json.dumps(available_depts)
    )
    response = model.generate_content(
        prompt,
        generation_config={"response_mime_type": "application/json"}
    )
    return json.loads(response.text)
```

#### 4.4 Gemini for complaint summary (shown to officials)
```python
SUMMARY_PROMPT = """
You are a civil servant assistant in Delhi. Summarise this complaint
for an official in 2-3 sentences. Be direct. Include:
1. What the problem is
2. How many citizens reported it
3. Priority level and reason

Complaint: {description}
Cluster size: {cluster_count} complaints
Is repeat: {is_repeat}
Last resolved: {last_resolved}
Priority: {priority}

Respond in {language}. Be concise.
"""

def generate_complaint_summary(complaint: dict, language: str = "hi") -> str:
    response = model.generate_content(
        SUMMARY_PROMPT.format(**complaint, language=language)
    )
    return response.text
```

---

### PHASE 5 — FIREBASE (Auth + Push Notifications)

**Free tier:** ✅ Firebase Auth — completely free (Spark plan).
             ✅ FCM (push notifications) — completely free, unlimited.

#### 5.1 Create Firebase Project linked to GCP
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Initialize Firebase in your project
# Go to: https://console.firebase.google.com
# Click "Add Project" → Select existing GCP project "ps-crm-delhi"
# This links Firebase to your GCP project
```

#### 5.2 Enable Firebase Auth
```
Firebase Console → ps-crm-delhi → Authentication → Get Started

Enable these sign-in providers:
  ✅ Phone (for citizens — OTP via SMS)
  ✅ Google (for officials/admins — easier login)
  ✅ Email/Password (fallback)

Under "Phone" provider:
  → Add test phone numbers for development
  → Production: uses Google's SMS infrastructure (free up to 10 SMS/day,
    then $0.01/SMS — use Twilio for bulk if needed)
```

#### 5.3 Firebase Auth in your app
```javascript
// Frontend (React/Next.js)
import { initializeApp } from 'firebase/app';
import { getAuth, signInWithPhoneNumber, RecaptchaVerifier } from 'firebase/auth';

const firebaseConfig = {
  apiKey: "YOUR_API_KEY",
  authDomain: "ps-crm-delhi.firebaseapp.com",
  projectId: "ps-crm-delhi",
};

const app = initializeApp(firebaseConfig);
const auth = getAuth(app);

// Phone OTP sign-in (citizens)
async function sendOTP(phoneNumber: string) {
  const recaptcha = new RecaptchaVerifier(auth, 'recaptcha-container', {size: 'invisible'});
  const result = await signInWithPhoneNumber(auth, phoneNumber, recaptcha);
  return result; // call result.confirm(otp) with the OTP user enters
}
```

```python
# Backend (Cloud Run) — verify Firebase token
import firebase_admin
from firebase_admin import credentials, auth

cred = credentials.ApplicationDefault()  # uses GCP service account automatically
firebase_admin.initialize_app(cred)

def verify_token(id_token: str) -> dict:
    """Called on every API request. Returns user info."""
    decoded = auth.verify_id_token(id_token)
    return {
        "uid": decoded["uid"],
        "phone": decoded.get("phone_number"),
        "email": decoded.get("email")
    }
    # Map decoded["uid"] to users.auth_uid in your DB
```

#### 5.4 Firebase Cloud Messaging (Push Notifications)
```bash
# FCM is automatically available when Firebase project is created.
# No separate enablement needed.

# Store FCM server key in Secret Manager:
# Go to: Firebase Console → Project Settings → Cloud Messaging → Server Key
gcloud secrets create fcm-server-key \
  --data-file=- <<< "YOUR_FCM_SERVER_KEY"
```

```python
# notification-service/push.py
import firebase_admin
from firebase_admin import messaging

def send_push_notification(
    fcm_token: str,
    title: str,
    body: str,
    data: dict = None
):
    """
    Push notification to a specific device.
    fcm_token comes from users.fcm_token in your DB.
    """
    message = messaging.Message(
        notification=messaging.Notification(title=title, body=body),
        data=data or {},
        token=fcm_token,
        android=messaging.AndroidConfig(
            priority="high",
            notification=messaging.AndroidNotification(
                sound="default",
                channel_id="ps_crm_alerts"
            )
        )
    )
    response = messaging.send(message)
    return response  # message ID

def send_topic_notification(
    topic: str,  # e.g. "city_DEL_complaints"
    title: str,
    body: str,
    data: dict = None
):
    """
    Broadcast to all devices subscribed to a topic.
    Use for area-wide notifications (citizens within 5km).
    More efficient than individual sends.
    """
    message = messaging.Message(
        notification=messaging.Notification(title=title, body=body),
        data=data or {},
        topic=topic
    )
    return messaging.send(message)
```

#### 5.5 Notification flow (combined Firebase + Twilio)

```
NOTIFICATION_DISPATCHER receives event from ps-crm-notifications Pub/Sub
        │
        ├── Channel = push
        │     └── FCM send_push_notification(users.fcm_token)
        │
        ├── Channel = twilio_whatsapp
        │     └── Twilio API → WhatsApp message
        │
        ├── Channel = twilio_sms
        │     └── Twilio API → SMS
        │
        └── Channel = email
              └── SendGrid / Cloud SMTP → email

All results → INSERT INTO notification_logs (status, external_message_id)
Twilio webhook → Cloud Run webhook handler → UPDATE notification_logs.status
FCM has no delivery webhook — use data messages + app-side receipt
```

---

### PHASE 6 — CLOUD RUN (Your Services)

**Free tier:** ✅ 2 million requests/month free. 360,000 vCPU-seconds free.
This is generous — PS-CRM will run essentially free on Cloud Run.

#### 6.1 Create Artifact Registry (stores your Docker images)
```bash
gcloud artifacts repositories create ps-crm-images \
  --repository-format=docker \
  --location=asia-south1 \
  --description="PS-CRM service images"

# Configure Docker to push to GCP
gcloud auth configure-docker asia-south1-docker.pkg.dev
```

#### 6.2 Services to create and their responsibilities

| Service | Trigger | Responsibility |
|---------|---------|----------------|
| `ingestion-service` | HTTP POST /complaints | Calls fn_ingest_complaint, computes embeddings, publishes to Pub/Sub |
| `workflow-engine` | Pub/Sub push (ps-crm-complaints) | Creates workflow_instances, assigns steps, checks constraints |
| `agent-service` | Pub/Sub push (ps-crm-agent) | Gemini summaries, dept mapping, priority scoring |
| `notification-service` | Pub/Sub push (ps-crm-notifications) | FCM + Twilio + email dispatch, writes notification_logs |
| `kpi-service` | Cloud Scheduler (nightly) | Computes official/contractor KPI snapshots |
| `public-api` | HTTP (all roles) | REST API for frontend — citizen portal, admin dashboard |
| `webhook-handler` | HTTP POST /webhooks/* | Twilio delivery webhooks, updates notification_logs.status |

#### 6.3 Deploy a service (example: ingestion-service)
```bash
# Build and push image
docker build -t asia-south1-docker.pkg.dev/ps-crm-delhi/ps-crm-images/ingestion-service:latest \
  ./services/ingestion-service
docker push asia-south1-docker.pkg.dev/ps-crm-delhi/ps-crm-images/ingestion-service:latest

# Deploy to Cloud Run
gcloud run deploy ingestion-service \
  --image=asia-south1-docker.pkg.dev/ps-crm-delhi/ps-crm-images/ingestion-service:latest \
  --region=asia-south1 \
  --platform=managed \
  --no-allow-unauthenticated \
  --service-account=ps-crm-ingestion@ps-crm-delhi.iam.gserviceaccount.com \
  --set-secrets=DATABASE_URL=pscrm-db-url:latest,NOMIC_API_KEY=nomic-api-key:latest \
  --add-cloudsql-instances=ps-crm-delhi:asia-south1:ps-crm-db \
  --memory=512Mi \
  --cpu=1 \
  --min-instances=0 \
  --max-instances=10 \
  --concurrency=80
```

#### 6.4 Service accounts (least-privilege — one per service)
```bash
# Create a service account per Cloud Run service
for service in ingestion workflow-engine agent notification kpi public-api; do
  gcloud iam service-accounts create ps-crm-$service \
    --display-name="PS-CRM $service service"
done

# Grant Cloud SQL access
gcloud projects add-iam-policy-binding ps-crm-delhi \
  --member="serviceAccount:ps-crm-ingestion@ps-crm-delhi.iam.gserviceaccount.com" \
  --role="roles/cloudsql.client"

# Grant Pub/Sub publish (ingestion publishes events)
gcloud projects add-iam-policy-binding ps-crm-delhi \
  --member="serviceAccount:ps-crm-ingestion@ps-crm-delhi.iam.gserviceaccount.com" \
  --role="roles/pubsub.publisher"

# Grant Secret Manager access
gcloud projects add-iam-policy-binding ps-crm-delhi \
  --member="serviceAccount:ps-crm-ingestion@ps-crm-delhi.iam.gserviceaccount.com" \
  --role="roles/secretmanager.secretAccessor"

# Grant Vertex AI access (agent-service only)
gcloud projects add-iam-policy-binding ps-crm-delhi \
  --member="serviceAccount:ps-crm-agent@ps-crm-delhi.iam.gserviceaccount.com" \
  --role="roles/aiplatform.user"
```

---

### PHASE 7 — CLOUD TASKS (Scheduled Jobs)

**Free tier:** ✅ 1 million operations/month free.

#### 7.1 Create queues
```bash
gcloud tasks queues create ps-crm-notifications \
  --location=asia-south1 \
  --max-dispatches-per-second=10 \
  --max-concurrent-dispatches=20

gcloud tasks queues create ps-crm-surveys \
  --location=asia-south1 \
  --max-dispatches-per-second=5 \
  --max-concurrent-dispatches=10

gcloud tasks queues create ps-crm-overdue-checks \
  --location=asia-south1 \
  --max-dispatches-per-second=2 \
  --max-concurrent-dispatches=5

gcloud tasks queues create ps-crm-kpi \
  --location=asia-south1 \
  --max-dispatches-per-second=1 \
  --max-concurrent-dispatches=2

gcloud tasks queues create ps-crm-escalations \
  --location=asia-south1 \
  --max-dispatches-per-second=5 \
  --max-concurrent-dispatches=10
```

#### 7.2 Creating a task (Python example)
```python
# workflow-engine — schedule SLA check after task is assigned
from google.cloud import tasks_v2
from google.protobuf import timestamp_pb2
import datetime, json

def schedule_sla_check(task_id: str, due_at: datetime.datetime):
    client = tasks_v2.CloudTasksClient()
    queue = client.queue_path("ps-crm-delhi", "asia-south1", "ps-crm-overdue-checks")

    # Fire 5 minutes after SLA due_at
    schedule_time = due_at + datetime.timedelta(minutes=5)
    timestamp = timestamp_pb2.Timestamp()
    timestamp.FromDatetime(schedule_time)

    task = {
        "http_request": {
            "http_method": tasks_v2.HttpMethod.POST,
            "url": "https://workflow-engine-HASH-uc.a.run.app/tasks/sla-check",
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps({"task_id": str(task_id)}).encode()
        },
        "schedule_time": timestamp,
        "name": f"{queue}/tasks/sla-check-{task_id}"  # idempotent name
    }

    client.create_task(request={"parent": queue, "task": task})

    # Also write to cloud_task_schedule table (your DB registry)
    # INSERT INTO cloud_task_schedule (cloud_task_name, queue_name, task_type, ...)
```

---

### PHASE 8 — CLOUD SCHEDULER (Nightly Jobs)

**Free tier:** ✅ 3 jobs free/month. You need 2. Fits.

#### 8.1 Create scheduled jobs
```bash
# Nightly KPI snapshot — runs at 1 AM IST (19:30 UTC)
gcloud scheduler jobs create http ps-crm-kpi-snapshot \
  --location=asia-south1 \
  --schedule="30 19 * * *" \
  --uri="https://kpi-service-HASH-uc.a.run.app/jobs/kpi-snapshot" \
  --http-method=POST \
  --oidc-service-account-email=ps-crm-kpi@ps-crm-delhi.iam.gserviceaccount.com

# Monthly partition creation — 25th of every month at midnight
gcloud scheduler jobs create http ps-crm-partition-create \
  --location=asia-south1 \
  --schedule="0 0 25 * *" \
  --uri="https://public-api-HASH-uc.a.run.app/admin/create-next-partition" \
  --http-method=POST \
  --oidc-service-account-email=ps-crm-kpi@ps-crm-delhi.iam.gserviceaccount.com

# Missing embeddings backfill — runs at 3 AM IST daily
gcloud scheduler jobs create http ps-crm-embeddings-backfill \
  --location=asia-south1 \
  --schedule="30 21 * * *" \
  --uri="https://ingestion-service-HASH-uc.a.run.app/jobs/backfill-embeddings" \
  --http-method=POST \
  --oidc-service-account-email=ps-crm-ingestion@ps-crm-delhi.iam.gserviceaccount.com
```

---

### PHASE 9 — CLOUD STORAGE (GCS) for Media

**Free tier:** ✅ 5GB free. Sufficient for hackathon.
After: ~$0.02/GB/month. Cheap.

#### 9.1 Create buckets
```bash
# Complaint media (photos, voice recordings)
gcloud storage buckets create gs://ps-crm-complaint-media \
  --location=asia-south1 \
  --uniform-bucket-level-access

# Tender documents
gcloud storage buckets create gs://ps-crm-tender-docs \
  --location=asia-south1 \
  --uniform-bucket-level-access

# Task evidence (before/after photos)
gcloud storage buckets create gs://ps-crm-task-evidence \
  --location=asia-south1 \
  --uniform-bucket-level-access

# Set lifecycle rule: delete files older than 5 years
gcloud storage buckets update gs://ps-crm-complaint-media \
  --lifecycle-file=lifecycle.json
```

```json
// lifecycle.json
{
  "rule": [{
    "action": {"type": "Delete"},
    "condition": {"age": 1825}
  }]
}
```

#### 9.2 Upload flow (signed URLs — no public bucket needed)
```python
# ingestion-service — generate signed upload URL for citizen
from google.cloud import storage
import datetime

def generate_upload_url(filename: str, content_type: str) -> str:
    """
    Returns a signed URL. Citizen uploads directly from browser to GCS.
    Cloud Run never handles the file bytes — only the URL.
    """
    client = storage.Client()
    bucket = client.bucket("ps-crm-complaint-media")
    blob = bucket.blob(f"complaints/{datetime.date.today()}/{filename}")

    url = blob.generate_signed_url(
        version="v4",
        expiration=datetime.timedelta(minutes=15),
        method="PUT",
        content_type=content_type
    )
    return url
    # Store url → complaints.images JSONB
```

---

### PHASE 10 — CLOUD TRANSLATION API

**Free tier:** ✅ 500,000 characters/month free.
A complaint averages ~200 chars → 2,500 complaints/month free.
After: $20 per million characters. Very cheap.

#### 10.1 Enable and use
```bash
gcloud services enable translate.googleapis.com
```

```python
# ingestion-service — translate complaint to English before embedding
from google.cloud import translate_v2

translate_client = translate_v2.Client()

def translate_to_english(text: str, source_language: str = None) -> str:
    """
    Translates Hindi/Urdu/other → English for embedding.
    source_language: 'hi', 'ur', 'pa', etc. None = auto-detect.
    """
    if source_language == 'en':
        return text  # skip API call

    result = translate_client.translate(
        text,
        target_language='en',
        source_language=source_language  # None = auto-detect
    )
    return result['translatedText']
```

---

### PHASE 11 — SECRET MANAGER

**Free tier:** ✅ 6 secret versions free. 10,000 access operations free/month.
You have ~8 secrets. After: $0.06/secret version/month. Negligible.

#### 11.1 Store all secrets
```bash
# Database URL (already done in Phase 1)
# Nomic API key (already done in Phase 2)

# Twilio credentials
gcloud secrets create twilio-account-sid --data-file=- <<< "YOUR_SID"
gcloud secrets create twilio-auth-token  --data-file=- <<< "YOUR_TOKEN"
gcloud secrets create twilio-whatsapp-number --data-file=- <<< "+14155238886"

# FCM server key (already done in Phase 5)

# SendGrid API key (for email)
gcloud secrets create sendgrid-api-key --data-file=- <<< "YOUR_KEY"

# JWT secret (for API tokens between services)
gcloud secrets create pscrm-jwt-secret \
  --data-file=- <<< "$(openssl rand -base64 64)"
```

---

### PHASE 12 — CLOUD MONITORING + ALERTING

**Free tier:** ✅ Basic monitoring free. First 150MB of logs/month free.

#### 12.1 Enable and configure
```bash
gcloud services enable monitoring.googleapis.com logging.googleapis.com
```

#### 12.2 Create critical alerts
```bash
# Alert: Cloud SQL CPU > 80%
gcloud alpha monitoring policies create \
  --notification-channels=YOUR_EMAIL_CHANNEL \
  --display-name="Cloud SQL High CPU" \
  --condition-display-name="CPU > 80%" \
  --condition-filter='resource.type="cloudsql_database" metric.type="cloudsql.googleapis.com/database/cpu/utilization"' \
  --condition-threshold-value=0.8 \
  --condition-threshold-duration=300s

# Alert: Pub/Sub dead letter topic receives messages
# (means something is failing to process — investigate immediately)
# Set this up in Console: Monitoring → Alerting → Create Policy
# Metric: pubsub.googleapis.com/subscription/num_undelivered_messages
# Filter: subscription_id = "ps-crm-dead-letter-sub"
# Threshold: > 0
```

---

## COMPLETE SERVICES COST SUMMARY

| Service | Free Tier | After Free Tier | PS-CRM Usage |
|---------|-----------|-----------------|--------------|
| Cloud SQL (db-g1-small) | ❌ No | ~$15/month | Always paid |
| Cloud Run | ✅ 2M req/month | $0.40/million req | Free at hackathon scale |
| Cloud Pub/Sub | ✅ 10GB/month | $0.04/GB | Free |
| Cloud Tasks | ✅ 1M ops/month | $0.40/million | Free |
| Cloud Scheduler | ✅ 3 jobs | $0.10/job/month | Free (need 3 jobs) |
| Cloud Storage | ✅ 5GB | $0.02/GB/month | Free initially |
| Firebase Auth | ✅ Unlimited | Free forever | Free |
| FCM | ✅ Unlimited | Free forever | Free |
| Cloud Translation | ✅ 500K chars/month | $20/million chars | Free initially |
| Vertex AI (Gemini Flash) | ✅ 15 req/min | Pay-per-token | Mostly free |
| Secret Manager | ✅ 6 versions | $0.06/version/month | ~$0.50/month |
| Cloud Monitoring | ✅ 150MB logs | $0.50/GB | Free |
| AlloyDB | ❌ No free tier | ~$150/month min | DON'T USE |
| **Total (hackathon)** | | | **~$15-20/month** |

**The only unavoidable cost: Cloud SQL (~$15/month).**
Everything else runs on free tier at hackathon/early production scale.

---

## FINAL DEPLOYMENT CHECKLIST

```
BEFORE GOING LIVE:

[ ] GCP project created and billing linked
[ ] All APIs enabled (Phase 0 command)
[ ] Cloud SQL instance running + schema deployed (all 3 files)
[ ] pgvector, PostGIS verified working
[ ] All secrets in Secret Manager (never in code)
[ ] Firebase project linked to GCP project
[ ] Firebase Auth phone + Google providers enabled
[ ] FCM configured, server key in Secret Manager
[ ] All Pub/Sub topics + subscriptions created
[ ] All Cloud Tasks queues created
[ ] GCS buckets created
[ ] Service accounts created (one per Cloud Run service)
[ ] All Cloud Run services deployed with correct service accounts
[ ] Cloud Scheduler jobs created (KPI, partitions, backfill)
[ ] Cloud Translation API enabled
[ ] Vertex AI enabled + Gemini Flash tested
[ ] Dead letter topic alert configured
[ ] Cloud SQL CPU alert configured
[ ] Nomic API key stored + embedding function tested
[ ] fn_ingest_complaint() tested end-to-end in staging
```

---

## GCP ARCHITECTURE DIAGRAM (Text)

```
                        INTERNET
                           │
                    [Firebase Auth]
                    [Identity Platform]
                           │ JWT token
                           ▼
                   [Cloud Run: public-api]
                   Validates Firebase JWT
                           │
             ┌─────────────┼──────────────┐
             ▼             ▼              ▼
    [ingestion-svc]  [workflow-engine]  [agent-svc]
         │                │                 │
         │    [Cloud Pub/Sub topics]        │
         ├──► ps-crm-complaints             │
         │         │                       │
         │         ▼                       │
         │    [workflow-engine]             │
         │         │                       │
         │         ├──► ps-crm-workflow     │
         │         │         │             │
         │         │         ▼             │
         │         │   [notification-svc]  │
         │         │         │             │
         │         │    ┌────┴────┐        │
         │         │    ▼         ▼        │
         │         │  [FCM]   [Twilio]     │
         │         │  (push)  (WA/SMS)     │
         │         │                       │
         ▼         ▼                       ▼
    ┌─────────────────────────────────────────┐
    │         CLOUD SQL (PostgreSQL 15)        │
    │  + pgvector  + PostGIS  + partitioning  │
    └─────────────────────────────────────────┘
         │
    [Cloud Storage]    [Cloud Tasks]    [Vertex AI]
    complaint media    SLA checks       Gemini Flash
    task evidence      surveys          dept mapping
    tender docs        escalations      summaries
```
