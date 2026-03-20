# CODEBASE DOCUMENTATION

## 1. Project Structure Full folder and file tree, every file listed, brief one line on what each file does

```text
.gitattributes
.gitignore
4.sql
context.md
LICENSE
PROTOTYPE_ARCHITECTURE.docx
README.md
VERIFICATION.docx
backend/.env
backend/.gitignore
backend/config.py
backend/db.py
backend/dependencies.py
backend/main.py
backend/models.py
backend/requirements.txt
backend/schemas.py
backend/agents/event_worker.py
backend/agents/notification_agent.py
backend/agents/orchestrator.py
backend/agents/predictive_agent.py
backend/agents/predictive_node.py
backend/agents/routing_agent.py
backend/agents/state.py
backend/agents/task_agent.py
backend/agents/__init__.py
backend/data/complaints/022c4075-1fca-4275-9213-fb026b2cf197.json
backend/data/complaints/473ed5a5-7c00-46bd-9584-fdeb7d3b687a.json
backend/data/complaints/557cc27a-e356-4ebd-82cf-aff5f5a6834e.json
backend/data/complaints/8ab6eb19-604c-4211-9e52-a059f7472130.json
backend/data/complaints/cbfe1369-b7a1-4a60-b8f6-07226eda6008.json
backend/data/embeddings/1320301e-774e-47bc-a5d2-0874b0349773.json
backend/data/embeddings/14b6434a-5dc4-4ec9-85c2-d33b05c5c2b1.json
backend/data/embeddings/1cf0c102-6436-47eb-8245-2a26e835b0c4.json
backend/data/embeddings/557cc27a-e356-4ebd-82cf-aff5f5a6834e.json
backend/data/embeddings/68ec82b9-c3e8-42b8-981c-965772774e0d.json
backend/data/embeddings/8ab6eb19-604c-4211-9e52-a059f7472130.json
backend/data/embeddings/a1084d96-289b-4fbc-8580-93eea5e2ff15.json
backend/data/embeddings/b1a73d1e-4007-47c4-b854-2045d32adf22.json
backend/data/embeddings/cbfe1369-b7a1-4a60-b8f6-07226eda6008.json
backend/data/embeddings/ce5a8b94-3960-4193-9b80-eeef8adbe846.json
backend/data/embeddings/d842ee07-4066-4a54-b34f-b6ccbcfdb838.json
backend/data/embeddings/de136b36-a3bd-4d18-865a-b699158d1714.json
backend/data/embeddings/f922e8e1-e053-48d0-9626-ded36ba66702.json
backend/data/uploads/192df537-967f-42ad-bc61-d046755895ad.jpg
backend/data/uploads/1b08667e-dd06-42e0-a2b8-1bd908fbd47a.jpg
backend/data/uploads/1beda2b8-d05a-46cd-9f29-f0104b460817.jpg
backend/data/uploads/3e8992c9-c225-4944-940c-619a0f394eb6.jpg
backend/data/uploads/44b6a2b0-f0d8-47e9-97ef-9f7563964ae2.jpg
backend/data/uploads/46c4d3c5-8419-4ca4-b720-c1da89c47c8e.jpg
backend/data/uploads/4db37c4b-13e0-407b-b0e5-3afb59ffb6bd.jpg
backend/data/uploads/6c1e6c6d-1575-4b48-b05a-7f3b05409c29.jpg
backend/data/uploads/6dbc8d6a-6e34-4fa7-971d-bd208bfa22a1.jpg
backend/data/uploads/750d0df9-8a8e-41f6-b990-81afe1b2c3ac.jpg
backend/data/uploads/7b0b7036-1a45-4eb2-8ac6-b0050cff28e4.jpg
backend/data/uploads/8a14ff81-76a2-426e-8025-1dba7b4275ee.jpg
backend/data/uploads/8a8aecdb-8917-4795-ae6b-c074c1c263d6.jpg
backend/data/uploads/8b4ed685-b46d-4c15-b6e2-3f71aa8b3cc0.jpg
backend/data/uploads/944e7dbd-dca9-489a-8354-34d7deb763da.jpg
backend/data/uploads/9626e338-fed6-408e-ada5-4eecfff41187.jpg
backend/data/uploads/96541443-2bee-4b3b-9ab4-fac046111a69.jpg
backend/data/uploads/a40ceac1-6010-43be-bdf2-f910a78e8b23.jpg
backend/data/uploads/a8e475e4-5fb5-4e79-b50b-ced04edad40b.jpg
backend/data/uploads/bdc674a4-7ab8-4b4f-b889-92ce86fe1122.jpg
backend/data/uploads/c3aa223e-f0ba-4fc1-904b-928f64a96520.png
backend/data/uploads/e2ea70b9-8334-4097-becc-8e6aaa309226.jpg
backend/data/uploads/e70d15c6-4919-4876-ad86-ac9b4b753aeb.jpg
backend/data/uploads/e96de5bd-95c8-4c2c-b381-406e8f54158e.jpg
backend/data/uploads/ebab0b81-b265-4421-b052-0cdbbca84749.jpg
backend/data/uploads/f1033a11-bd12-4029-ba51-dcf9685de88b.jpg
backend/realtime/connection_manager.py
backend/realtime/__init__.py
backend/routes/auth_router.py
backend/routes/complaint_router.py
backend/routes/__init__.py
backend/services/complaint_service.py
backend/services/embedding_service.py
backend/services/storage_service.py
backend/services/__init__.py
frontend/.env
frontend/.gitignore
frontend/index.html
frontend/package-lock.json
frontend/package.json
frontend/vite.config.js
frontend/src/App.jsx
frontend/src/main.jsx
frontend/src/styles.css
frontend/src/api/authApi.js
frontend/src/api/client.js
frontend/src/api/complaintsApi.js
frontend/src/components/PageShell.jsx
frontend/src/pages/AdminPage.jsx
frontend/src/pages/ComplaintStatusPage.jsx
frontend/src/pages/LoginPage.jsx
frontend/src/pages/SignupPage.jsx
frontend/src/pages/SubmitComplaintPage.jsx
```

- .gitattributes - Git attributes configuration for line endings and diff handling.
- .gitignore - Root ignore rules for repository-local generated files.
- 4.sql - Primary PostgreSQL schema and database bootstrap SQL script.
- context.md - Project context notes and implementation guidance document.
- LICENSE - Repository software license text.
- PROTOTYPE_ARCHITECTURE.docx - Architecture document for prototype-level system design.
- README.md - Project overview, setup steps, and usage instructions.
- VERIFICATION.docx - Verification and validation notes document.
- backend/.env - Backend environment variable values for local runtime.
- backend/.gitignore - Backend-local ignore rules.
- backend/config.py - Application settings and environment variable mapping definitions.
- backend/db.py - SQLAlchemy engine and session dependency setup.
- backend/dependencies.py - Request dependency helpers including token/user resolution logic.
- backend/main.py - FastAPI application entrypoint and router registration.
- backend/models.py - SQLAlchemy ORM model definitions for application tables.
- backend/requirements.txt - Pinned Python dependency manifest for backend runtime.
- backend/schemas.py - Pydantic request/response schema definitions for API contracts.
- backend/agents/event_worker.py - Backend agent orchestration module for workflow processing.
- backend/agents/notification_agent.py - Backend agent orchestration module for workflow processing.
- backend/agents/orchestrator.py - Backend agent orchestration module for workflow processing.
- backend/agents/predictive_agent.py - Backend agent orchestration module for workflow processing.
- backend/agents/predictive_node.py - Backend agent orchestration module for workflow processing.
- backend/agents/routing_agent.py - Backend agent orchestration module for workflow processing.
- backend/agents/state.py - Backend agent orchestration module for workflow processing.
- backend/agents/task_agent.py - Backend agent orchestration module for workflow processing.
- backend/agents/__init__.py - Backend agent orchestration module for workflow processing.
- backend/data/complaints/022c4075-1fca-4275-9213-fb026b2cf197.json - Persisted complaint payload artifact stored as JSON.
- backend/data/complaints/473ed5a5-7c00-46bd-9584-fdeb7d3b687a.json - Persisted complaint payload artifact stored as JSON.
- backend/data/complaints/557cc27a-e356-4ebd-82cf-aff5f5a6834e.json - Persisted complaint payload artifact stored as JSON.
- backend/data/complaints/8ab6eb19-604c-4211-9e52-a059f7472130.json - Persisted complaint payload artifact stored as JSON.
- backend/data/complaints/cbfe1369-b7a1-4a60-b8f6-07226eda6008.json - Persisted complaint payload artifact stored as JSON.
- backend/data/embeddings/1320301e-774e-47bc-a5d2-0874b0349773.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/14b6434a-5dc4-4ec9-85c2-d33b05c5c2b1.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/1cf0c102-6436-47eb-8245-2a26e835b0c4.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/557cc27a-e356-4ebd-82cf-aff5f5a6834e.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/68ec82b9-c3e8-42b8-981c-965772774e0d.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/8ab6eb19-604c-4211-9e52-a059f7472130.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/a1084d96-289b-4fbc-8580-93eea5e2ff15.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/b1a73d1e-4007-47c4-b854-2045d32adf22.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/cbfe1369-b7a1-4a60-b8f6-07226eda6008.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/ce5a8b94-3960-4193-9b80-eeef8adbe846.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/d842ee07-4066-4a54-b34f-b6ccbcfdb838.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/de136b36-a3bd-4d18-865a-b699158d1714.json - Persisted embedding artifact stored as JSON.
- backend/data/embeddings/f922e8e1-e053-48d0-9626-ded36ba66702.json - Persisted embedding artifact stored as JSON.
- backend/data/uploads/192df537-967f-42ad-bc61-d046755895ad.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/1b08667e-dd06-42e0-a2b8-1bd908fbd47a.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/1beda2b8-d05a-46cd-9f29-f0104b460817.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/3e8992c9-c225-4944-940c-619a0f394eb6.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/44b6a2b0-f0d8-47e9-97ef-9f7563964ae2.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/46c4d3c5-8419-4ca4-b720-c1da89c47c8e.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/4db37c4b-13e0-407b-b0e5-3afb59ffb6bd.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/6c1e6c6d-1575-4b48-b05a-7f3b05409c29.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/6dbc8d6a-6e34-4fa7-971d-bd208bfa22a1.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/750d0df9-8a8e-41f6-b990-81afe1b2c3ac.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/7b0b7036-1a45-4eb2-8ac6-b0050cff28e4.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/8a14ff81-76a2-426e-8025-1dba7b4275ee.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/8a8aecdb-8917-4795-ae6b-c074c1c263d6.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/8b4ed685-b46d-4c15-b6e2-3f71aa8b3cc0.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/944e7dbd-dca9-489a-8354-34d7deb763da.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/9626e338-fed6-408e-ada5-4eecfff41187.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/96541443-2bee-4b3b-9ab4-fac046111a69.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/a40ceac1-6010-43be-bdf2-f910a78e8b23.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/a8e475e4-5fb5-4e79-b50b-ced04edad40b.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/bdc674a4-7ab8-4b4f-b889-92ce86fe1122.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/c3aa223e-f0ba-4fc1-904b-928f64a96520.png - Uploaded complaint media file saved to local storage.
- backend/data/uploads/e2ea70b9-8334-4097-becc-8e6aaa309226.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/e70d15c6-4919-4876-ad86-ac9b4b753aeb.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/e96de5bd-95c8-4c2c-b381-406e8f54158e.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/ebab0b81-b265-4421-b052-0cdbbca84749.jpg - Uploaded complaint media file saved to local storage.
- backend/data/uploads/f1033a11-bd12-4029-ba51-dcf9685de88b.jpg - Uploaded complaint media file saved to local storage.
- backend/realtime/connection_manager.py - Realtime connection management module for websocket messaging.
- backend/realtime/__init__.py - Realtime connection management module for websocket messaging.
- backend/routes/auth_router.py - FastAPI router module defining HTTP API endpoints.
- backend/routes/complaint_router.py - FastAPI router module defining HTTP API endpoints.
- backend/routes/__init__.py - FastAPI router module defining HTTP API endpoints.
- backend/services/complaint_service.py - Backend service module containing business logic and integrations.
- backend/services/embedding_service.py - Backend service module containing business logic and integrations.
- backend/services/storage_service.py - Backend service module containing business logic and integrations.
- backend/services/__init__.py - Backend service module containing business logic and integrations.
- frontend/.env - Frontend environment variable values for local runtime.
- frontend/.gitignore - Frontend-local ignore rules.
- frontend/index.html - Frontend HTML shell used by Vite build and dev server.
- frontend/package-lock.json - Resolved dependency lockfile for frontend packages.
- frontend/package.json - Frontend package manifest with scripts and dependencies.
- frontend/vite.config.js - Vite bundler configuration for frontend build/dev behavior.
- frontend/src/App.jsx - Frontend React entry or root component module.
- frontend/src/main.jsx - Frontend React entry or root component module.
- frontend/src/styles.css - Frontend stylesheet containing application-wide styles.
- frontend/src/api/authApi.js - Frontend API client wrapper module for backend HTTP calls.
- frontend/src/api/client.js - Frontend API client wrapper module for backend HTTP calls.
- frontend/src/api/complaintsApi.js - Frontend API client wrapper module for backend HTTP calls.
- frontend/src/components/PageShell.jsx - Reusable frontend UI component module.
- frontend/src/pages/AdminPage.jsx - Frontend page component implementing route-level UI.
- frontend/src/pages/ComplaintStatusPage.jsx - Frontend page component implementing route-level UI.
- frontend/src/pages/LoginPage.jsx - Frontend page component implementing route-level UI.
- frontend/src/pages/SignupPage.jsx - Frontend page component implementing route-level UI.
- frontend/src/pages/SubmitComplaintPage.jsx - Frontend page component implementing route-level UI.

## 2. Authentication System Full code of how authentication works, what get_current_user returns, exact shape and fields of the user object, what library is used, where middleware is defined

#### backend/routes/auth_router.py
`$lang
import base64
import hashlib
import hmac
import os
import re
from datetime import datetime, timedelta, timezone

import jwt
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from config import settings
from db import get_db
from dependencies import get_current_user
from models import City, User
from schemas import AuthResponse, SignInRequest, SignUpRequest, TokenData

router = APIRouter(prefix="/auth", tags=["Auth"])

PASSWORD_ITERATIONS = 390000
PASSWORD_REGEX = re.compile(r"^(?=.*[A-Za-z])(?=.*\d).{8,}$")


def _hash_password(password: str) -> str:
    salt = os.urandom(16)
    digest = hashlib.pbkdf2_hmac("sha256", password.encode("utf-8"), salt, PASSWORD_ITERATIONS)
    return "pbkdf2_sha256${}${}${}".format(
        PASSWORD_ITERATIONS,
        base64.b64encode(salt).decode("ascii"),
        base64.b64encode(digest).decode("ascii"),
    )


def _verify_password(password: str, stored: str) -> bool:
    try:
        algo, iteration_str, salt_b64, digest_b64 = stored.split("$", 3)
        if algo != "pbkdf2_sha256":
            return False
        iterations = int(iteration_str)
        salt = base64.b64decode(salt_b64.encode("ascii"))
        expected = base64.b64decode(digest_b64.encode("ascii"))
    except Exception:
        return False

    actual = hashlib.pbkdf2_hmac("sha256", password.encode("utf-8"), salt, iterations)
    return hmac.compare_digest(actual, expected)


def _issue_access_token(user: User) -> tuple[str, int]:
    expires_seconds = settings.AUTH_ACCESS_TOKEN_EXPIRE_MINUTES * 60
    expires_at = datetime.now(timezone.utc) + timedelta(seconds=expires_seconds)
    payload = {
        "sub": str(user.id),
        "role": user.role,
        "email": user.email,
        "type": "access",
        "exp": int(expires_at.timestamp()),
        "iat": int(datetime.now(timezone.utc).timestamp()),
    }
    token = jwt.encode(payload, settings.AUTH_JWT_SECRET, algorithm=settings.AUTH_JWT_ALGORITHM)
    return token, expires_seconds


def _resolve_city_id(db: Session, city_code: str | None):
    if city_code:
        city = db.query(City).filter(City.city_code == city_code.strip()).first()
        if not city:
            raise HTTPException(status_code=400, detail="Invalid city_code")
        return city.id

    first_city = db.query(City).order_by(City.created_at.asc()).first()
    return first_city.id if first_city else None


def _validate_password_strength(password: str) -> None:
    if not PASSWORD_REGEX.match(password):
        raise HTTPException(
            status_code=400,
            detail="Password must be at least 8 characters and include letters and numbers",
        )


@router.post("/signup", response_model=AuthResponse)
def signup(payload: SignUpRequest, db: Session = Depends(get_db)):
    email = payload.email.strip().lower()
    if not email:
        raise HTTPException(status_code=400, detail="Email is required")

    if db.query(User).filter(User.email == email).first():
        raise HTTPException(status_code=409, detail="Email already registered")

    _validate_password_strength(payload.password)
    city_id = _resolve_city_id(db, payload.city_code)
    password_hash = _hash_password(payload.password)

    user = User(
        city_id=city_id,
        email=email,
        full_name=payload.full_name.strip(),
        preferred_language=(payload.preferred_language or "hi").strip(),
        role="citizen",
        is_active=True,
        is_verified=True,
        auth_provider="password",
        extra_meta={"password_hash": password_hash},
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    token, expires_in = _issue_access_token(user)
    return AuthResponse(
        access_token=token,
        expires_in=expires_in,
        user_id=user.id,
        role=user.role,
        email=user.email or "",
        full_name=user.full_name,
    )


@router.post("/login")
def login(payload: SignInRequest, db: Session = Depends(get_db)):
    email = payload.email.strip().lower()
    user = db.query(User).filter(User.email == email).first()
    if not user or not user.is_active:
        raise HTTPException(status_code=401, detail="Invalid email or password")

    meta = user.extra_meta or {}
    stored_hash = meta.get("password_hash") if isinstance(meta, dict) else None
    if not stored_hash or not _verify_password(payload.password, stored_hash):
        raise HTTPException(status_code=401, detail="Invalid email or password")

    token, expires_in = _issue_access_token(user)
    return AuthResponse(
        access_token=token,
        expires_in=expires_in,
        user_id=user.id,
        role=user.role,
        email=user.email or "",
        full_name=user.full_name,
    )


@router.get("/me")
def me(current_user: TokenData = Depends(get_current_user), db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id == current_user.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return {
        "user_id": str(user.id),
        "email": user.email,
        "full_name": user.full_name,
        "role": user.role,
        "is_active": user.is_active,
    }

```

#### backend/dependencies.py
`$lang
# backend/dependencies.py
import jwt
from fastapi import Depends, HTTPException, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from config import settings
from schemas import TokenData
from db import get_db
from models import User
from sqlalchemy.orm import Session

security = HTTPBearer()

def _decode_local_token(token: str):
    return jwt.decode(
        token,
        settings.AUTH_JWT_SECRET,
        algorithms=[settings.AUTH_JWT_ALGORITHM],
    )


def _decode_supabase_token(token: str):
    if not settings.SUPABASE_JWT_SECRET:
        raise jwt.InvalidTokenError("SUPABASE_JWT_SECRET not configured")

    return jwt.decode(
        token,
        settings.SUPABASE_JWT_SECRET,
        algorithms=["HS256", "ES256", "RS256"],
        audience="authenticated",
    )


def get_current_user(
    credentials: HTTPAuthorizationCredentials = Security(security),
    db: Session = Depends(get_db),
) -> TokenData:
    token = credentials.credentials
    try:
        payload = _decode_local_token(token)
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail="Token has expired")
    except jwt.InvalidTokenError:
        try:
            payload = _decode_supabase_token(token)
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=401, detail="Token has expired")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=401, detail="Invalid authentication token")

    user_id = payload.get("sub") or payload.get("user_id")
    if not user_id:
        raise HTTPException(status_code=401, detail="Invalid token payload")

    user = db.query(User).filter(User.id == user_id, User.is_active.is_(True)).first()
    if not user:
        raise HTTPException(status_code=401, detail="User not found or inactive")

    role = payload.get("role") or user.role
    return TokenData(user_id=user.id, role=role)
```

#### backend/main.py
`$lang
# backend/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes import complaint_router, auth_router


app = FastAPI(
    title="PSCRM Civic Intelligence API",
    description="Multi-Agent Event-Driven Civic Infrastructure Platform",
    version="1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(complaint_router.router)
app.include_router(auth_router.router)

@app.get("/")
def root():
    return {"status": "online", "message": "PSCRM Core Nervous System Active"}
```

#### backend/schemas.py
`$lang
from typing import List, Optional
from uuid import UUID

from fastapi import UploadFile
from pydantic import BaseModel, ConfigDict, Field

class ComplaintCreate(BaseModel):
    text: str
    lat: float
    lng: float
    photo_url: Optional[str] = None


class ComplaintIngestRequest(BaseModel):
    model_config = ConfigDict(arbitrary_types_allowed=True)

    citizen_id: UUID
    city_id: UUID
    city_code: str
    title: str
    description: str
    original_language: str
    lat: float = Field(ge=-90, le=90)
    lng: float = Field(ge=-180, le=180)
    infra_type_id: UUID

    address_text: Optional[str] = None
    infra_name: Optional[str] = None
    priority: Optional[str] = "normal"
    voice_transcript: Optional[str] = None
    agent_summary: Optional[str] = None
    agent_priority_reason: Optional[str] = None
    agent_suggested_dept_ids: Optional[List[str]] = None
    embedding_model: Optional[str] = "nomic-embed-text-v1.5"

    images: List[UploadFile] = Field(default_factory=list)
    voice_recording: Optional[UploadFile] = None


class ComplaintIngestResponse(BaseModel):
    complaint_id: UUID
    complaint_number: str
    infra_node_id: UUID
    workflow_instance_id: Optional[UUID]
    is_repeat_complaint: bool
    is_new_infra_node: bool
    repeat_gap_days: Optional[int]
    jurisdiction_id: Optional[UUID]

class ComplaintResponse(BaseModel):
    id: int
    status: str
    message: str


class SignUpRequest(BaseModel):
    full_name: str
    email: str
    password: str
    city_code: Optional[str] = None
    preferred_language: Optional[str] = "hi"


class SignInRequest(BaseModel):
    email: str
    password: str


class AuthResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    expires_in: int
    user_id: UUID
    role: str
    email: str
    full_name: str


class TokenData(BaseModel):
    user_id: UUID
    role: str
    
class SurveySubmit(BaseModel):

    complaint_id: int
    rating: int
    comment: str
    

class AssistantQuery(BaseModel):
    query: str
```

#### backend/models.py
`$lang
# backend/models.py

import uuid
import enum
from sqlalchemy import (
    Column, String, Boolean, Integer, Text, Numeric,
    DateTime, Date, SmallInteger, ForeignKey, ARRAY,
    CheckConstraint, UniqueConstraint
)
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from geoalchemy2 import Geometry
from pgvector.sqlalchemy import Vector
from db import Base


# ============================================================
# LAYER 1 â€” REFERENCE / MASTER DATA
# ============================================================

class City(Base):
    __tablename__ = "cities"

    id           = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name         = Column(String(100), nullable=False)
    state        = Column(String(100))
    country_code = Column(String(2), nullable=False, default="IN")
    city_code    = Column(String(10), nullable=False, unique=True)
    timezone     = Column(String(50), nullable=False, default="Asia/Kolkata")
    extra_meta   = Column("metadata", JSONB, nullable=False, default=dict)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Jurisdiction(Base):
    __tablename__ = "jurisdictions"

    id                = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id           = Column(UUID(as_uuid=True), ForeignKey("cities.id", ondelete="RESTRICT"), nullable=False)
    parent_id         = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name              = Column(String(200), nullable=False)
    code              = Column(String(30), nullable=False)
    jurisdiction_type = Column(String(50), nullable=False)
    boundary          = Column(Geometry("MULTIPOLYGON", srid=4326))
    extra_meta        = Column("metadata", JSONB, nullable=False, default=dict)
    created_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "code"),)


class WorkflowConstraint(Base):
    __tablename__ = "workflow_constraints"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id                  = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id          = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name                     = Column(String(300), nullable=False)
    description              = Column(Text)
    constraint_type          = Column(String(30), nullable=False)
    affected_dept_codes      = Column(ARRAY(Text), nullable=False, default=list)
    affected_work_type_codes = Column(ARRAY(Text), nullable=False, default=list)
    is_recurring_annual      = Column(Boolean, nullable=False, default=False)
    start_month              = Column(SmallInteger)
    start_day                = Column(SmallInteger)
    end_month                = Column(SmallInteger)
    end_day                  = Column(SmallInteger)
    active_from              = Column(Date)
    active_until             = Column(Date)
    condition                = Column(JSONB, nullable=False, default=dict)
    block_message            = Column(Text, nullable=False)
    legal_reference          = Column(Text)
    is_active                = Column(Boolean, nullable=False, default=True)
    created_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    updated_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Department(Base):
    __tablename__ = "departments"

    id               = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id          = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id  = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name             = Column(String(300), nullable=False)
    code             = Column(String(30), nullable=False)
    contact_email    = Column(String(255))
    contact_phone    = Column(String(20))
    head_official_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="SET NULL"))
    extra_meta       = Column("metadata", JSONB, nullable=False, default=dict)
    created_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "code"),)


class InfraType(Base):
    __tablename__ = "infra_types"

    id                    = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name                  = Column(String(100), nullable=False)
    code                  = Column(String(30), nullable=False, unique=True)
    default_dept_ids      = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    cluster_radius_meters = Column(Integer, nullable=False, default=50)
    repeat_alert_years    = Column(Integer, nullable=False, default=3)
    icon_url              = Column(Text)
    extra_meta            = Column("metadata", JSONB, nullable=False, default=dict)
    created_at            = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 2 â€” USERS & ACTORS
# ============================================================

class User(Base):
    __tablename__ = "users"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id            = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    department_id      = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    jurisdiction_id    = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    email              = Column(String(255), unique=True)
    phone              = Column(String(20), unique=True)
    full_name          = Column(String(300), nullable=False)
    preferred_language = Column(String(10), nullable=False, default="hi")
    role               = Column(String(20), nullable=False)
    is_active          = Column(Boolean, nullable=False, default=True)
    is_verified        = Column(Boolean, nullable=False, default=False)
    auth_uid           = Column(String(255), unique=True)
    auth_provider      = Column(String(30), nullable=False, default="phone_otp")
    fcm_token          = Column(Text)
    twilio_opt_in      = Column(Boolean, nullable=False, default=True)
    email_opt_in       = Column(Boolean, nullable=False, default=True)
    extra_meta         = Column("metadata", JSONB, nullable=False, default=dict)
    created_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        CheckConstraint("email IS NOT NULL OR phone IS NOT NULL", name="chk_user_contact"),
    )


class Contractor(Base):
    __tablename__ = "contractors"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id              = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    company_name         = Column(String(400), nullable=False)
    registration_number  = Column(String(100), nullable=False)
    registered_dept_ids  = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    license_expiry       = Column(Date)
    max_concurrent_tasks = Column(Integer, nullable=False, default=5)
    performance_score    = Column(Numeric(4, 2), nullable=False, default=5.0)
    is_blacklisted       = Column(Boolean, nullable=False, default=False)
    blacklist_reason     = Column(Text)
    blacklisted_at       = Column(DateTime(timezone=True))
    blacklisted_by       = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    extra_meta           = Column("metadata", JSONB, nullable=False, default=dict)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Worker(Base):
    __tablename__ = "workers"

    id                = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id           = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    department_id     = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    contractor_id     = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    employee_id       = Column(String(100))
    skills            = Column(ARRAY(Text), nullable=False, default=list)
    is_available      = Column(Boolean, nullable=False, default=True)
    current_task_count = Column(Integer, nullable=False, default=0)
    performance_score = Column(Numeric(4, 2), nullable=False, default=5.0)
    extra_meta        = Column("metadata", JSONB, nullable=False, default=dict)
    created_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 3 â€” INFRASTRUCTURE
# ============================================================

class InfraNode(Base):
    __tablename__ = "infra_nodes"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id                   = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id           = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_type_id             = Column(UUID(as_uuid=True), ForeignKey("infra_types.id"), nullable=False)
    name                      = Column(String(400))
    location                  = Column(Geometry("GEOMETRY", srid=4326), nullable=False)
    location_hash             = Column(String, unique=False)
    status                    = Column(String(30), nullable=False, default="operational")
    attributes                = Column(JSONB, nullable=False, default=dict)
    last_resolved_at          = Column(DateTime(timezone=True))
    last_resolved_workflow_id = Column(UUID(as_uuid=True))
    total_complaint_count     = Column(Integer, nullable=False, default=0)
    total_resolved_count      = Column(Integer, nullable=False, default=0)
    is_deleted                = Column(Boolean, nullable=False, default=False)
    deleted_at                = Column(DateTime(timezone=True))
    deleted_by                = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason           = Column(Text)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class AssetHealthLog(Base):
    __tablename__ = "asset_health_logs"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id            = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id", ondelete="CASCADE"), nullable=False)
    health_score             = Column(Numeric(4, 2))
    open_complaint_count     = Column(Integer, nullable=False, default=0)
    resolved_complaint_count = Column(Integer, nullable=False, default=0)
    avg_resolution_days      = Column(Numeric(8, 2))
    last_complaint_at        = Column(DateTime(timezone=True))
    computed_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 4 â€” COMPLAINTS
# ============================================================

class Complaint(Base):
    __tablename__ = "complaints"

    id           = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    complaint_number             = Column(String(30), nullable=False)
    citizen_id                   = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    city_id                      = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id              = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_node_id                = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"))
    workflow_instance_id         = Column(UUID(as_uuid=True))
    title                        = Column(String(500), nullable=False)
    description                  = Column(Text, nullable=False)
    original_language            = Column(String(10), nullable=False, default="hi")
    translated_description       = Column(Text)
    location                     = Column(Geometry("POINT", srid=4326), nullable=False)
    address_text                 = Column(Text)
    images                       = Column(JSONB, nullable=False, default=list)
    voice_recording_url          = Column(Text)
    voice_transcript             = Column(Text)
    voice_transcript_language    = Column(String(10))
    status                       = Column(String(30), nullable=False, default="received")
    priority                     = Column(String(20), nullable=False, default="normal")
    is_repeat_complaint          = Column(Boolean, nullable=False, default=False)
    repeat_previous_complaint_id = Column(UUID(as_uuid=True))
    repeat_previous_resolved_at  = Column(DateTime(timezone=True))
    repeat_gap_days              = Column(Integer)
    is_emergency                 = Column(Boolean, nullable=False, default=False)
    emergency_bypass_at          = Column(DateTime(timezone=True))
    emergency_bypass_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    emergency_bypass_reason      = Column(Text)
    emergency_audit_trail        = Column(JSONB, nullable=False, default=dict)
    is_cluster_primary           = Column(Boolean, nullable=False, default=False)
    agent_summary                = Column(Text)
    agent_priority_reason        = Column(Text)
    agent_suggested_dept_ids     = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    is_recomplaint               = Column(Boolean, nullable=False, default=False)
    parent_complaint_id          = Column(UUID(as_uuid=True))
    resolved_at                  = Column(DateTime(timezone=True))
    rejected_reason              = Column(Text)
    is_deleted                   = Column(Boolean, nullable=False, default=False)
    deleted_at                   = Column(DateTime(timezone=True))
    deleted_by                   = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason              = Column(Text)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now(), primary_key=True)
    updated_at                   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class ComplaintStatusHistory(Base):
    __tablename__ = "complaint_status_history"

    id           = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    complaint_id = Column(UUID(as_uuid=True), nullable=False)
    old_status   = Column(String(30))
    new_status   = Column(String(30), nullable=False)
    changed_by   = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    reason       = Column(Text)
    extra_meta   = Column("metadata", JSONB, nullable=False, default=dict)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now(), primary_key=True)


    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class ComplaintCluster(Base):
    __tablename__ = "complaint_clusters"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"), nullable=False)
    primary_complaint_id = Column(UUID(as_uuid=True), nullable=False)
    complaint_count      = Column(Integer, nullable=False, default=1)
    cluster_summary      = Column(Text)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class ComplaintClusterMember(Base):
    __tablename__ = "complaint_cluster_members"

    cluster_id   = Column(UUID(as_uuid=True), ForeignKey("complaint_clusters.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    complaint_id = Column(UUID(as_uuid=True), nullable=False, primary_key=True)
    joined_at    = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class ComplaintEmbedding(Base):
    __tablename__ = "complaint_embeddings"

    complaint_id    = Column(UUID(as_uuid=True), primary_key=True)
    text_embedding  = Column(Vector(768), nullable=False)
    image_embedding = Column(Vector(768))
    model_version   = Column(String(100), nullable=False, default="nomic-embed-text-v1.5")
    embedded_at     = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 5 â€” WORKFLOW ENGINE
# ============================================================

class WorkflowTemplate(Base):
    __tablename__ = "workflow_templates"

    id          = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id     = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    name        = Column(String(300), nullable=False)
    description = Column(Text)
    created_by  = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at  = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "name"),)


class WorkflowTemplateVersion(Base):
    __tablename__ = "workflow_template_versions"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    template_id         = Column(UUID(as_uuid=True), ForeignKey("workflow_templates.id"), nullable=False)
    city_id             = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id     = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_type_id       = Column(UUID(as_uuid=True), ForeignKey("infra_types.id"))
    version             = Column(Integer, nullable=False)
    is_active           = Column(Boolean, nullable=False, default=True)
    is_latest_version   = Column(Boolean, nullable=False, default=True)
    previous_version_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id"))
    notes               = Column(Text)
    created_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("template_id", "version"),)


class WorkflowTemplateStep(Base):
    __tablename__ = "workflow_template_steps"

    id                      = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    version_id              = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id", ondelete="CASCADE"), nullable=False)
    step_number             = Column(Integer, nullable=False)
    department_id           = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    step_name               = Column(String(300), nullable=False)
    description             = Column(Text)
    expected_duration_hours = Column(Integer)
    is_optional             = Column(Boolean, nullable=False, default=False)
    requires_tender         = Column(Boolean, nullable=False, default=False)
    work_type_codes         = Column(ARRAY(Text), nullable=False, default=list)
    extra_meta              = Column("metadata", JSONB, nullable=False, default=dict)
    created_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("version_id", "step_number"),)


class WorkflowStepDependency(Base):
    __tablename__ = "workflow_step_dependencies"

    step_id            = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    depends_on_step_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id", ondelete="CASCADE"), nullable=False, primary_key=True)

    __table_args__ = (
        CheckConstraint("step_id != depends_on_step_id", name="chk_no_self_dependency"),
    )


class WorkflowInstance(Base):
    __tablename__ = "workflow_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"), nullable=False)
    template_id          = Column(UUID(as_uuid=True), ForeignKey("workflow_templates.id"), nullable=False)
    version_id           = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id"), nullable=False)
    jurisdiction_id      = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    status               = Column(String(30), nullable=False, default="active")
    mode                 = Column(String(20), nullable=False, default="normal")
    current_step_number  = Column(Integer, nullable=False, default=1)
    total_steps          = Column(Integer, nullable=False)
    started_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    completed_at         = Column(DateTime(timezone=True))
    blocked_reason       = Column(Text)
    blocked_until        = Column(Date)
    is_emergency         = Column(Boolean, nullable=False, default=False)
    emergency_bypass_log = Column(JSONB, nullable=False, default=dict)
    created_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class WorkflowStepInstance(Base):
    __tablename__ = "workflow_step_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    template_step_id     = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id"), nullable=False)
    step_number          = Column(Integer, nullable=False)
    department_id        = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    step_name            = Column(String(300), nullable=False)
    status               = Column(String(30), nullable=False, default="pending")
    assigned_official_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    unlocked_at          = Column(DateTime(timezone=True))
    started_at           = Column(DateTime(timezone=True))
    expected_completion_at = Column(DateTime(timezone=True))
    completed_at         = Column(DateTime(timezone=True))
    constraint_block_id  = Column(UUID(as_uuid=True), ForeignKey("workflow_constraints.id"))
    legally_blocked_at   = Column(DateTime(timezone=True))
    legally_blocked_until = Column(Date)
    agent_summary        = Column(Text)
    agent_priority       = Column(String(20))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("workflow_instance_id", "step_number"),)


class WorkflowComplaints(Base):
    __tablename__ = "workflow_complaints"

    workflow_instance_id     = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    complaint_id             = Column(UUID(as_uuid=True), nullable=False, primary_key=True)
    attached_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    attached_by_agent_log_id = Column(UUID(as_uuid=True), ForeignKey("agent_logs.id"))


class WorkflowStatusHistory(Base):
    __tablename__ = "workflow_status_history"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    old_status           = Column(String(30))
    new_status           = Column(String(30), nullable=False)
    changed_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    change_source        = Column(String(30), nullable=False, default="system")
    reason               = Column(Text)
    state_snapshot       = Column(JSONB, nullable=False, default=dict)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 6 â€” TASKS
# ============================================================

class Task(Base):
    __tablename__ = "tasks"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    task_number               = Column(String(30), nullable=False, unique=True)
    workflow_step_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_step_instances.id"))
    complaint_id              = Column(UUID(as_uuid=True))
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    jurisdiction_id           = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    assigned_official_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    assigned_worker_id        = Column(UUID(as_uuid=True), ForeignKey("workers.id"))
    assigned_contractor_id    = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    title                     = Column(String(500), nullable=False)
    description               = Column(Text)
    status                    = Column(String(30), nullable=False, default="pending")
    priority                  = Column(String(20), nullable=False, default="normal")
    override_reason_code      = Column(String(30))
    override_notes            = Column(Text)
    override_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    override_at               = Column(DateTime(timezone=True))
    previous_assignee         = Column(JSONB)
    due_at                    = Column(DateTime(timezone=True))
    started_at                = Column(DateTime(timezone=True))
    completed_at              = Column(DateTime(timezone=True))
    before_photos             = Column(JSONB, nullable=False, default=list)
    after_photos              = Column(JSONB, nullable=False, default=list)
    progress_photos           = Column(JSONB, nullable=False, default=list)
    completion_notes          = Column(Text)
    completion_location       = Column(Geometry("POINT", srid=4326))
    agent_summary             = Column(Text)
    is_deleted                = Column(Boolean, nullable=False, default=False)
    deleted_at                = Column(DateTime(timezone=True))
    deleted_by                = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason           = Column(Text)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class TaskStatusHistory(Base):
    __tablename__ = "task_status_history"

    id         = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    task_id    = Column(UUID(as_uuid=True), ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False)
    old_status = Column(String(30))
    new_status = Column(String(30), nullable=False)
    changed_by = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    reason     = Column(Text)
    extra_meta = Column("metadata", JSONB, nullable=False, default=dict)
    created_at = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class TaskSLA(Base):
    __tablename__ = "task_sla"

    task_id         = Column(UUID(as_uuid=True), ForeignKey("tasks.id", ondelete="CASCADE"), primary_key=True)
    sla_hours       = Column(Integer, nullable=False)
    started_at      = Column(DateTime(timezone=True))
    due_at          = Column(DateTime(timezone=True), nullable=False)
    is_breached     = Column(Boolean, nullable=False, default=False)
    breached_at     = Column(DateTime(timezone=True))
    warning_sent_at = Column(DateTime(timezone=True))
    escalation_log  = Column(JSONB, nullable=False, default=list)
    created_at      = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at      = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 7 â€” EMERGENCY POSTHOC TASKS
# ============================================================

class EmergencyPosthocTask(Base):
    __tablename__ = "emergency_posthoc_tasks"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id      = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    complaint_id              = Column(UUID(as_uuid=True), nullable=False)
    original_template_step_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id"), nullable=False)
    step_number               = Column(Integer, nullable=False)
    step_name                 = Column(String(300), nullable=False)
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    assigned_official_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    documentation_type        = Column(String(50), nullable=False)
    instructions              = Column(Text, nullable=False)
    is_mandatory              = Column(Boolean, nullable=False, default=True)
    status                    = Column(String(30), nullable=False, default="pending")
    waived_by                 = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    waived_reason             = Column(Text)
    uploaded_documents        = Column(JSONB, nullable=False, default=list)
    completion_notes          = Column(Text)
    due_within_hours          = Column(Integer, nullable=False, default=48)
    emergency_bypass_at       = Column(DateTime(timezone=True), nullable=False)
    due_at                    = Column(DateTime(timezone=True), nullable=False)
    completed_at              = Column(DateTime(timezone=True))
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 8 â€” TENDERS
# ============================================================

class Tender(Base):
    __tablename__ = "tenders"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    tender_number             = Column(String(30), nullable=False, unique=True)
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    workflow_step_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_step_instances.id"))
    complaint_id              = Column(UUID(as_uuid=True))
    requested_by              = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    title                     = Column(String(500), nullable=False)
    description               = Column(Text)
    scope_of_work             = Column(Text)
    estimated_cost            = Column(Numeric(15, 2))
    final_cost                = Column(Numeric(15, 2))
    status                    = Column(String(30), nullable=False, default="draft")
    approved_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    rejected_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    awarded_to_contractor_id  = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    documents                 = Column(JSONB, nullable=False, default=list)
    approval_notes            = Column(Text)
    rejection_reason          = Column(Text)
    submitted_at              = Column(DateTime(timezone=True))
    approved_at               = Column(DateTime(timezone=True))
    awarded_at                = Column(DateTime(timezone=True))
    due_date                  = Column(Date)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 9 â€” SURVEYS
# ============================================================

class SurveyTemplate(Base):
    __tablename__ = "survey_templates"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name                = Column(String(300), nullable=False)
    survey_type         = Column(String(30), nullable=False)
    trigger_at_step_pct = Column(SmallInteger, default=50)
    questions           = Column(JSONB, nullable=False)
    is_active           = Column(Boolean, nullable=False, default=True)
    created_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class SurveyInstance(Base):
    __tablename__ = "survey_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    template_id          = Column(UUID(as_uuid=True), ForeignKey("survey_templates.id"), nullable=False)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    complaint_id         = Column(UUID(as_uuid=True))
    survey_type          = Column(String(30), nullable=False)
    target_user_id       = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    target_role          = Column(String(30), nullable=False)
    status               = Column(String(20), nullable=False, default="pending")
    triggered_by         = Column(String(20), nullable=False, default="agent")
    channel              = Column(String(20), nullable=False, default="whatsapp")
    related_location     = Column(Geometry("POINT", srid=4326))
    triggered_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    sent_at              = Column(DateTime(timezone=True))
    opened_at            = Column(DateTime(timezone=True))
    completed_at         = Column(DateTime(timezone=True))
    expires_at           = Column(DateTime(timezone=True))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class SurveyResponse(Base):
    __tablename__ = "survey_responses"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    survey_instance_id = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"), nullable=False)
    respondent_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    answers            = Column(JSONB, nullable=False)
    overall_rating     = Column(Numeric(3, 1))
    feedback_text      = Column(Text)
    submitted_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 10 â€” NOTIFICATIONS
# ============================================================

class NotificationTemplate(Base):
    __tablename__ = "notification_templates"

    id               = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name             = Column(String(300), nullable=False)
    event_type       = Column(String(100), nullable=False)
    channel          = Column(String(30), nullable=False)
    language         = Column(String(10), nullable=False, default="hi")
    subject_template = Column(Text)
    body_template    = Column(Text, nullable=False)
    is_active        = Column(Boolean, nullable=False, default=True)
    created_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("event_type", "channel", "language"),)


class NotificationLog(Base):
    __tablename__ = "notification_logs"

    id                  = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    template_id         = Column(UUID(as_uuid=True), ForeignKey("notification_templates.id"))
    recipient_user_id   = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    recipient_contact   = Column(String(255), nullable=False)
    channel             = Column(String(30), nullable=False)
    event_type          = Column(String(100), nullable=False)
    complaint_id        = Column(UUID(as_uuid=True))
    task_id             = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    survey_instance_id  = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"))
    payload             = Column(JSONB, nullable=False, default=dict)
    status              = Column(String(20), nullable=False, default="pending")
    external_message_id = Column(String(255))
    error_message       = Column(Text)
    sent_at             = Column(DateTime(timezone=True))
    delivered_at        = Column(DateTime(timezone=True))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class AreaNotificationSubscription(Base):
    __tablename__ = "area_notification_subscriptions"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id            = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    location           = Column(Geometry("POINT", srid=4326), nullable=False)
    radius_meters      = Column(Integer, nullable=False, default=5000)
    preferred_channels = Column(ARRAY(Text), nullable=False, default=list)
    is_active          = Column(Boolean, nullable=False, default=True)
    created_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 11 â€” GCP INTEGRATION
# ============================================================

class PubSubEventLog(Base):
    __tablename__ = "pubsub_event_log"

    id                   = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    event_type           = Column(String(100), nullable=False)
    pubsub_topic         = Column(String(300))
    pubsub_message_id    = Column(String(200))
    published_at         = Column(DateTime(timezone=True))
    ack_at               = Column(DateTime(timezone=True))
    payload              = Column(JSONB, nullable=False, default=dict)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id              = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    user_id              = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    processed_by         = Column(String(200))
    processing_status    = Column(String(20), nullable=False, default="published")
    retry_count          = Column(SmallInteger, nullable=False, default=0)
    error_message        = Column(Text)
    processed_at         = Column(DateTime(timezone=True))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class CloudTaskSchedule(Base):
    __tablename__ = "cloud_task_schedule"

    id                     = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    cloud_task_name        = Column(String(500), nullable=False, unique=True)
    queue_name             = Column(String(200), nullable=False)
    task_type              = Column(String(100), nullable=False)
    complaint_id           = Column(UUID(as_uuid=True))
    workflow_instance_id   = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id                = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    survey_instance_id     = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"))
    target_user_id         = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    payload                = Column(JSONB, nullable=False, default=dict)
    scheduled_for          = Column(DateTime(timezone=True), nullable=False)
    schedule_delay_seconds = Column(Integer, nullable=False, default=0)
    status                 = Column(String(20), nullable=False, default="scheduled")
    retry_count            = Column(SmallInteger, nullable=False, default=0)
    error_message          = Column(Text)
    executed_at            = Column(DateTime(timezone=True))
    created_at             = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 12 â€” AGENT LOGS
# ============================================================

class AgentLog(Base):
    __tablename__ = "agent_logs"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    agent_type           = Column(String(60), nullable=False)
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id              = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    input_data           = Column(JSONB, nullable=False, default=dict)
    output_data          = Column(JSONB, nullable=False, default=dict)
    action_taken         = Column(String(300))
    confidence_score     = Column(Numeric(5, 4))
    human_overridden     = Column(Boolean, nullable=False, default=False)
    override_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    override_reason      = Column(Text)
    latency_ms           = Column(Integer)
    model_used           = Column(String(100))
    tokens_used          = Column(Integer)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 13 â€” PUBLIC ANNOUNCEMENTS
# ============================================================

class PublicAnnouncement(Base):
    __tablename__ = "public_announcements"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id      = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    title                = Column(String(500), nullable=False)
    content              = Column(Text, nullable=False)
    work_type            = Column(String(100))
    affected_area        = Column(Geometry("POLYGON", srid=4326))
    status               = Column(String(30), nullable=False)
    expected_start_date  = Column(Date)
    expected_end_date    = Column(Date)
    actual_end_date      = Column(Date)
    is_published         = Column(Boolean, nullable=False, default=False)
    published_at         = Column(DateTime(timezone=True))
    expires_at           = Column(DateTime(timezone=True))
    created_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 14 â€” KPI SNAPSHOTS
# ============================================================

class OfficialPerformanceSnapshot(Base):
    __tablename__ = "official_performance_snapshots"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    official_id              = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    department_id            = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    snapshot_date            = Column(Date, nullable=False)
    tasks_assigned           = Column(Integer, nullable=False, default=0)
    tasks_completed          = Column(Integer, nullable=False, default=0)
    tasks_overdue            = Column(Integer, nullable=False, default=0)
    avg_resolution_hours     = Column(Numeric(8, 2))
    avg_survey_rating        = Column(Numeric(4, 2))
    override_count           = Column(Integer, nullable=False, default=0)
    override_reason_breakdown = Column(JSONB, nullable=False, default=dict)
    complaints_handled       = Column(Integer, nullable=False, default=0)
    emergency_bypasses       = Column(Integer, nullable=False, default=0)
    posthoc_tasks_pending    = Column(Integer, nullable=False, default=0)
    created_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("official_id", "snapshot_date"),)


class ContractorPerformanceSnapshot(Base):
    __tablename__ = "contractor_performance_snapshots"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    contractor_id       = Column(UUID(as_uuid=True), ForeignKey("contractors.id"), nullable=False)
    snapshot_date       = Column(Date, nullable=False)
    tasks_completed     = Column(Integer, nullable=False, default=0)
    tasks_overdue       = Column(Integer, nullable=False, default=0)
    avg_completion_hours = Column(Numeric(8, 2))
    avg_survey_rating   = Column(Numeric(4, 2))
    tenders_won         = Column(Integer, nullable=False, default=0)
    tenders_applied     = Column(Integer, nullable=False, default=0)
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("contractor_id", "snapshot_date"),)


# ============================================================
# LAYER 15 â€” DOMAIN EVENTS
# ============================================================

class DomainEvent(Base):
    __tablename__ = "domain_events"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    event_type           = Column(String(100), nullable=False)
    entity_type          = Column(String(60), nullable=False)
    entity_id            = Column(UUID(as_uuid=True), nullable=False)
    actor_id             = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    actor_type           = Column(String(30))
    payload              = Column(JSONB, nullable=False, default=dict)
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
```

## 3. Database Layer Full code of engine setup, session management, whether async or sync, what ORM or query method is used, connection string handling, where it all lives

#### backend/db.py
`$lang
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from config import settings

engine = create_engine(
    settings.DATABASE_URL,
    pool_pre_ping=True,
    pool_size=10,
    max_overflow=20
)

SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
```

#### backend/config.py
`$lang
from pydantic_settings import BaseSettings
from typing import Optional

class Settings(BaseSettings):
    DATABASE_URL: str
    GEMINI_API_KEY: str
    NOMIC_API_KEY: str
    GROQ_API_KEY: str
    AUTH_JWT_SECRET: str
    AUTH_JWT_ALGORITHM: str = "HS256"
    AUTH_ACCESS_TOKEN_EXPIRE_MINUTES: int = 60
    SUPABASE_JWT_SECRET: Optional[str] = None
    GCS_ENABLED: bool = False
    GCS_BUCKET_NAME: Optional[str] = None
    GCS_PROJECT_ID: Optional[str] = None
    GCS_UPLOAD_PREFIX: str = "complaints"
    GCS_EMBEDDINGS_PREFIX: str = "embeddings"
    GCS_STRICT_MODE: bool = False

    class Config:
        env_file = ".env"

settings = Settings()
```

#### backend/models.py
`$lang
# backend/models.py

import uuid
import enum
from sqlalchemy import (
    Column, String, Boolean, Integer, Text, Numeric,
    DateTime, Date, SmallInteger, ForeignKey, ARRAY,
    CheckConstraint, UniqueConstraint
)
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from geoalchemy2 import Geometry
from pgvector.sqlalchemy import Vector
from db import Base


# ============================================================
# LAYER 1 â€” REFERENCE / MASTER DATA
# ============================================================

class City(Base):
    __tablename__ = "cities"

    id           = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name         = Column(String(100), nullable=False)
    state        = Column(String(100))
    country_code = Column(String(2), nullable=False, default="IN")
    city_code    = Column(String(10), nullable=False, unique=True)
    timezone     = Column(String(50), nullable=False, default="Asia/Kolkata")
    extra_meta   = Column("metadata", JSONB, nullable=False, default=dict)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Jurisdiction(Base):
    __tablename__ = "jurisdictions"

    id                = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id           = Column(UUID(as_uuid=True), ForeignKey("cities.id", ondelete="RESTRICT"), nullable=False)
    parent_id         = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name              = Column(String(200), nullable=False)
    code              = Column(String(30), nullable=False)
    jurisdiction_type = Column(String(50), nullable=False)
    boundary          = Column(Geometry("MULTIPOLYGON", srid=4326))
    extra_meta        = Column("metadata", JSONB, nullable=False, default=dict)
    created_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "code"),)


class WorkflowConstraint(Base):
    __tablename__ = "workflow_constraints"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id                  = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id          = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name                     = Column(String(300), nullable=False)
    description              = Column(Text)
    constraint_type          = Column(String(30), nullable=False)
    affected_dept_codes      = Column(ARRAY(Text), nullable=False, default=list)
    affected_work_type_codes = Column(ARRAY(Text), nullable=False, default=list)
    is_recurring_annual      = Column(Boolean, nullable=False, default=False)
    start_month              = Column(SmallInteger)
    start_day                = Column(SmallInteger)
    end_month                = Column(SmallInteger)
    end_day                  = Column(SmallInteger)
    active_from              = Column(Date)
    active_until             = Column(Date)
    condition                = Column(JSONB, nullable=False, default=dict)
    block_message            = Column(Text, nullable=False)
    legal_reference          = Column(Text)
    is_active                = Column(Boolean, nullable=False, default=True)
    created_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    updated_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Department(Base):
    __tablename__ = "departments"

    id               = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id          = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id  = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name             = Column(String(300), nullable=False)
    code             = Column(String(30), nullable=False)
    contact_email    = Column(String(255))
    contact_phone    = Column(String(20))
    head_official_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="SET NULL"))
    extra_meta       = Column("metadata", JSONB, nullable=False, default=dict)
    created_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "code"),)


class InfraType(Base):
    __tablename__ = "infra_types"

    id                    = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name                  = Column(String(100), nullable=False)
    code                  = Column(String(30), nullable=False, unique=True)
    default_dept_ids      = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    cluster_radius_meters = Column(Integer, nullable=False, default=50)
    repeat_alert_years    = Column(Integer, nullable=False, default=3)
    icon_url              = Column(Text)
    extra_meta            = Column("metadata", JSONB, nullable=False, default=dict)
    created_at            = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 2 â€” USERS & ACTORS
# ============================================================

class User(Base):
    __tablename__ = "users"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id            = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    department_id      = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    jurisdiction_id    = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    email              = Column(String(255), unique=True)
    phone              = Column(String(20), unique=True)
    full_name          = Column(String(300), nullable=False)
    preferred_language = Column(String(10), nullable=False, default="hi")
    role               = Column(String(20), nullable=False)
    is_active          = Column(Boolean, nullable=False, default=True)
    is_verified        = Column(Boolean, nullable=False, default=False)
    auth_uid           = Column(String(255), unique=True)
    auth_provider      = Column(String(30), nullable=False, default="phone_otp")
    fcm_token          = Column(Text)
    twilio_opt_in      = Column(Boolean, nullable=False, default=True)
    email_opt_in       = Column(Boolean, nullable=False, default=True)
    extra_meta         = Column("metadata", JSONB, nullable=False, default=dict)
    created_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        CheckConstraint("email IS NOT NULL OR phone IS NOT NULL", name="chk_user_contact"),
    )


class Contractor(Base):
    __tablename__ = "contractors"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id              = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    company_name         = Column(String(400), nullable=False)
    registration_number  = Column(String(100), nullable=False)
    registered_dept_ids  = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    license_expiry       = Column(Date)
    max_concurrent_tasks = Column(Integer, nullable=False, default=5)
    performance_score    = Column(Numeric(4, 2), nullable=False, default=5.0)
    is_blacklisted       = Column(Boolean, nullable=False, default=False)
    blacklist_reason     = Column(Text)
    blacklisted_at       = Column(DateTime(timezone=True))
    blacklisted_by       = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    extra_meta           = Column("metadata", JSONB, nullable=False, default=dict)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Worker(Base):
    __tablename__ = "workers"

    id                = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id           = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    department_id     = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    contractor_id     = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    employee_id       = Column(String(100))
    skills            = Column(ARRAY(Text), nullable=False, default=list)
    is_available      = Column(Boolean, nullable=False, default=True)
    current_task_count = Column(Integer, nullable=False, default=0)
    performance_score = Column(Numeric(4, 2), nullable=False, default=5.0)
    extra_meta        = Column("metadata", JSONB, nullable=False, default=dict)
    created_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 3 â€” INFRASTRUCTURE
# ============================================================

class InfraNode(Base):
    __tablename__ = "infra_nodes"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id                   = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id           = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_type_id             = Column(UUID(as_uuid=True), ForeignKey("infra_types.id"), nullable=False)
    name                      = Column(String(400))
    location                  = Column(Geometry("GEOMETRY", srid=4326), nullable=False)
    location_hash             = Column(String, unique=False)
    status                    = Column(String(30), nullable=False, default="operational")
    attributes                = Column(JSONB, nullable=False, default=dict)
    last_resolved_at          = Column(DateTime(timezone=True))
    last_resolved_workflow_id = Column(UUID(as_uuid=True))
    total_complaint_count     = Column(Integer, nullable=False, default=0)
    total_resolved_count      = Column(Integer, nullable=False, default=0)
    is_deleted                = Column(Boolean, nullable=False, default=False)
    deleted_at                = Column(DateTime(timezone=True))
    deleted_by                = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason           = Column(Text)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class AssetHealthLog(Base):
    __tablename__ = "asset_health_logs"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id            = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id", ondelete="CASCADE"), nullable=False)
    health_score             = Column(Numeric(4, 2))
    open_complaint_count     = Column(Integer, nullable=False, default=0)
    resolved_complaint_count = Column(Integer, nullable=False, default=0)
    avg_resolution_days      = Column(Numeric(8, 2))
    last_complaint_at        = Column(DateTime(timezone=True))
    computed_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 4 â€” COMPLAINTS
# ============================================================

class Complaint(Base):
    __tablename__ = "complaints"

    id           = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    complaint_number             = Column(String(30), nullable=False)
    citizen_id                   = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    city_id                      = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id              = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_node_id                = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"))
    workflow_instance_id         = Column(UUID(as_uuid=True))
    title                        = Column(String(500), nullable=False)
    description                  = Column(Text, nullable=False)
    original_language            = Column(String(10), nullable=False, default="hi")
    translated_description       = Column(Text)
    location                     = Column(Geometry("POINT", srid=4326), nullable=False)
    address_text                 = Column(Text)
    images                       = Column(JSONB, nullable=False, default=list)
    voice_recording_url          = Column(Text)
    voice_transcript             = Column(Text)
    voice_transcript_language    = Column(String(10))
    status                       = Column(String(30), nullable=False, default="received")
    priority                     = Column(String(20), nullable=False, default="normal")
    is_repeat_complaint          = Column(Boolean, nullable=False, default=False)
    repeat_previous_complaint_id = Column(UUID(as_uuid=True))
    repeat_previous_resolved_at  = Column(DateTime(timezone=True))
    repeat_gap_days              = Column(Integer)
    is_emergency                 = Column(Boolean, nullable=False, default=False)
    emergency_bypass_at          = Column(DateTime(timezone=True))
    emergency_bypass_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    emergency_bypass_reason      = Column(Text)
    emergency_audit_trail        = Column(JSONB, nullable=False, default=dict)
    is_cluster_primary           = Column(Boolean, nullable=False, default=False)
    agent_summary                = Column(Text)
    agent_priority_reason        = Column(Text)
    agent_suggested_dept_ids     = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    is_recomplaint               = Column(Boolean, nullable=False, default=False)
    parent_complaint_id          = Column(UUID(as_uuid=True))
    resolved_at                  = Column(DateTime(timezone=True))
    rejected_reason              = Column(Text)
    is_deleted                   = Column(Boolean, nullable=False, default=False)
    deleted_at                   = Column(DateTime(timezone=True))
    deleted_by                   = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason              = Column(Text)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now(), primary_key=True)
    updated_at                   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class ComplaintStatusHistory(Base):
    __tablename__ = "complaint_status_history"

    id           = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    complaint_id = Column(UUID(as_uuid=True), nullable=False)
    old_status   = Column(String(30))
    new_status   = Column(String(30), nullable=False)
    changed_by   = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    reason       = Column(Text)
    extra_meta   = Column("metadata", JSONB, nullable=False, default=dict)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now(), primary_key=True)


    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class ComplaintCluster(Base):
    __tablename__ = "complaint_clusters"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"), nullable=False)
    primary_complaint_id = Column(UUID(as_uuid=True), nullable=False)
    complaint_count      = Column(Integer, nullable=False, default=1)
    cluster_summary      = Column(Text)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class ComplaintClusterMember(Base):
    __tablename__ = "complaint_cluster_members"

    cluster_id   = Column(UUID(as_uuid=True), ForeignKey("complaint_clusters.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    complaint_id = Column(UUID(as_uuid=True), nullable=False, primary_key=True)
    joined_at    = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class ComplaintEmbedding(Base):
    __tablename__ = "complaint_embeddings"

    complaint_id    = Column(UUID(as_uuid=True), primary_key=True)
    text_embedding  = Column(Vector(768), nullable=False)
    image_embedding = Column(Vector(768))
    model_version   = Column(String(100), nullable=False, default="nomic-embed-text-v1.5")
    embedded_at     = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 5 â€” WORKFLOW ENGINE
# ============================================================

class WorkflowTemplate(Base):
    __tablename__ = "workflow_templates"

    id          = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id     = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    name        = Column(String(300), nullable=False)
    description = Column(Text)
    created_by  = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at  = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "name"),)


class WorkflowTemplateVersion(Base):
    __tablename__ = "workflow_template_versions"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    template_id         = Column(UUID(as_uuid=True), ForeignKey("workflow_templates.id"), nullable=False)
    city_id             = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id     = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_type_id       = Column(UUID(as_uuid=True), ForeignKey("infra_types.id"))
    version             = Column(Integer, nullable=False)
    is_active           = Column(Boolean, nullable=False, default=True)
    is_latest_version   = Column(Boolean, nullable=False, default=True)
    previous_version_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id"))
    notes               = Column(Text)
    created_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("template_id", "version"),)


class WorkflowTemplateStep(Base):
    __tablename__ = "workflow_template_steps"

    id                      = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    version_id              = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id", ondelete="CASCADE"), nullable=False)
    step_number             = Column(Integer, nullable=False)
    department_id           = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    step_name               = Column(String(300), nullable=False)
    description             = Column(Text)
    expected_duration_hours = Column(Integer)
    is_optional             = Column(Boolean, nullable=False, default=False)
    requires_tender         = Column(Boolean, nullable=False, default=False)
    work_type_codes         = Column(ARRAY(Text), nullable=False, default=list)
    extra_meta              = Column("metadata", JSONB, nullable=False, default=dict)
    created_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("version_id", "step_number"),)


class WorkflowStepDependency(Base):
    __tablename__ = "workflow_step_dependencies"

    step_id            = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    depends_on_step_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id", ondelete="CASCADE"), nullable=False, primary_key=True)

    __table_args__ = (
        CheckConstraint("step_id != depends_on_step_id", name="chk_no_self_dependency"),
    )


class WorkflowInstance(Base):
    __tablename__ = "workflow_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"), nullable=False)
    template_id          = Column(UUID(as_uuid=True), ForeignKey("workflow_templates.id"), nullable=False)
    version_id           = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id"), nullable=False)
    jurisdiction_id      = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    status               = Column(String(30), nullable=False, default="active")
    mode                 = Column(String(20), nullable=False, default="normal")
    current_step_number  = Column(Integer, nullable=False, default=1)
    total_steps          = Column(Integer, nullable=False)
    started_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    completed_at         = Column(DateTime(timezone=True))
    blocked_reason       = Column(Text)
    blocked_until        = Column(Date)
    is_emergency         = Column(Boolean, nullable=False, default=False)
    emergency_bypass_log = Column(JSONB, nullable=False, default=dict)
    created_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class WorkflowStepInstance(Base):
    __tablename__ = "workflow_step_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    template_step_id     = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id"), nullable=False)
    step_number          = Column(Integer, nullable=False)
    department_id        = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    step_name            = Column(String(300), nullable=False)
    status               = Column(String(30), nullable=False, default="pending")
    assigned_official_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    unlocked_at          = Column(DateTime(timezone=True))
    started_at           = Column(DateTime(timezone=True))
    expected_completion_at = Column(DateTime(timezone=True))
    completed_at         = Column(DateTime(timezone=True))
    constraint_block_id  = Column(UUID(as_uuid=True), ForeignKey("workflow_constraints.id"))
    legally_blocked_at   = Column(DateTime(timezone=True))
    legally_blocked_until = Column(Date)
    agent_summary        = Column(Text)
    agent_priority       = Column(String(20))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("workflow_instance_id", "step_number"),)


class WorkflowComplaints(Base):
    __tablename__ = "workflow_complaints"

    workflow_instance_id     = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    complaint_id             = Column(UUID(as_uuid=True), nullable=False, primary_key=True)
    attached_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    attached_by_agent_log_id = Column(UUID(as_uuid=True), ForeignKey("agent_logs.id"))


class WorkflowStatusHistory(Base):
    __tablename__ = "workflow_status_history"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    old_status           = Column(String(30))
    new_status           = Column(String(30), nullable=False)
    changed_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    change_source        = Column(String(30), nullable=False, default="system")
    reason               = Column(Text)
    state_snapshot       = Column(JSONB, nullable=False, default=dict)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 6 â€” TASKS
# ============================================================

class Task(Base):
    __tablename__ = "tasks"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    task_number               = Column(String(30), nullable=False, unique=True)
    workflow_step_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_step_instances.id"))
    complaint_id              = Column(UUID(as_uuid=True))
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    jurisdiction_id           = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    assigned_official_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    assigned_worker_id        = Column(UUID(as_uuid=True), ForeignKey("workers.id"))
    assigned_contractor_id    = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    title                     = Column(String(500), nullable=False)
    description               = Column(Text)
    status                    = Column(String(30), nullable=False, default="pending")
    priority                  = Column(String(20), nullable=False, default="normal")
    override_reason_code      = Column(String(30))
    override_notes            = Column(Text)
    override_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    override_at               = Column(DateTime(timezone=True))
    previous_assignee         = Column(JSONB)
    due_at                    = Column(DateTime(timezone=True))
    started_at                = Column(DateTime(timezone=True))
    completed_at              = Column(DateTime(timezone=True))
    before_photos             = Column(JSONB, nullable=False, default=list)
    after_photos              = Column(JSONB, nullable=False, default=list)
    progress_photos           = Column(JSONB, nullable=False, default=list)
    completion_notes          = Column(Text)
    completion_location       = Column(Geometry("POINT", srid=4326))
    agent_summary             = Column(Text)
    is_deleted                = Column(Boolean, nullable=False, default=False)
    deleted_at                = Column(DateTime(timezone=True))
    deleted_by                = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason           = Column(Text)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class TaskStatusHistory(Base):
    __tablename__ = "task_status_history"

    id         = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    task_id    = Column(UUID(as_uuid=True), ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False)
    old_status = Column(String(30))
    new_status = Column(String(30), nullable=False)
    changed_by = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    reason     = Column(Text)
    extra_meta = Column("metadata", JSONB, nullable=False, default=dict)
    created_at = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class TaskSLA(Base):
    __tablename__ = "task_sla"

    task_id         = Column(UUID(as_uuid=True), ForeignKey("tasks.id", ondelete="CASCADE"), primary_key=True)
    sla_hours       = Column(Integer, nullable=False)
    started_at      = Column(DateTime(timezone=True))
    due_at          = Column(DateTime(timezone=True), nullable=False)
    is_breached     = Column(Boolean, nullable=False, default=False)
    breached_at     = Column(DateTime(timezone=True))
    warning_sent_at = Column(DateTime(timezone=True))
    escalation_log  = Column(JSONB, nullable=False, default=list)
    created_at      = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at      = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 7 â€” EMERGENCY POSTHOC TASKS
# ============================================================

class EmergencyPosthocTask(Base):
    __tablename__ = "emergency_posthoc_tasks"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id      = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    complaint_id              = Column(UUID(as_uuid=True), nullable=False)
    original_template_step_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id"), nullable=False)
    step_number               = Column(Integer, nullable=False)
    step_name                 = Column(String(300), nullable=False)
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    assigned_official_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    documentation_type        = Column(String(50), nullable=False)
    instructions              = Column(Text, nullable=False)
    is_mandatory              = Column(Boolean, nullable=False, default=True)
    status                    = Column(String(30), nullable=False, default="pending")
    waived_by                 = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    waived_reason             = Column(Text)
    uploaded_documents        = Column(JSONB, nullable=False, default=list)
    completion_notes          = Column(Text)
    due_within_hours          = Column(Integer, nullable=False, default=48)
    emergency_bypass_at       = Column(DateTime(timezone=True), nullable=False)
    due_at                    = Column(DateTime(timezone=True), nullable=False)
    completed_at              = Column(DateTime(timezone=True))
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 8 â€” TENDERS
# ============================================================

class Tender(Base):
    __tablename__ = "tenders"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    tender_number             = Column(String(30), nullable=False, unique=True)
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    workflow_step_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_step_instances.id"))
    complaint_id              = Column(UUID(as_uuid=True))
    requested_by              = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    title                     = Column(String(500), nullable=False)
    description               = Column(Text)
    scope_of_work             = Column(Text)
    estimated_cost            = Column(Numeric(15, 2))
    final_cost                = Column(Numeric(15, 2))
    status                    = Column(String(30), nullable=False, default="draft")
    approved_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    rejected_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    awarded_to_contractor_id  = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    documents                 = Column(JSONB, nullable=False, default=list)
    approval_notes            = Column(Text)
    rejection_reason          = Column(Text)
    submitted_at              = Column(DateTime(timezone=True))
    approved_at               = Column(DateTime(timezone=True))
    awarded_at                = Column(DateTime(timezone=True))
    due_date                  = Column(Date)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 9 â€” SURVEYS
# ============================================================

class SurveyTemplate(Base):
    __tablename__ = "survey_templates"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name                = Column(String(300), nullable=False)
    survey_type         = Column(String(30), nullable=False)
    trigger_at_step_pct = Column(SmallInteger, default=50)
    questions           = Column(JSONB, nullable=False)
    is_active           = Column(Boolean, nullable=False, default=True)
    created_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class SurveyInstance(Base):
    __tablename__ = "survey_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    template_id          = Column(UUID(as_uuid=True), ForeignKey("survey_templates.id"), nullable=False)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    complaint_id         = Column(UUID(as_uuid=True))
    survey_type          = Column(String(30), nullable=False)
    target_user_id       = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    target_role          = Column(String(30), nullable=False)
    status               = Column(String(20), nullable=False, default="pending")
    triggered_by         = Column(String(20), nullable=False, default="agent")
    channel              = Column(String(20), nullable=False, default="whatsapp")
    related_location     = Column(Geometry("POINT", srid=4326))
    triggered_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    sent_at              = Column(DateTime(timezone=True))
    opened_at            = Column(DateTime(timezone=True))
    completed_at         = Column(DateTime(timezone=True))
    expires_at           = Column(DateTime(timezone=True))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class SurveyResponse(Base):
    __tablename__ = "survey_responses"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    survey_instance_id = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"), nullable=False)
    respondent_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    answers            = Column(JSONB, nullable=False)
    overall_rating     = Column(Numeric(3, 1))
    feedback_text      = Column(Text)
    submitted_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 10 â€” NOTIFICATIONS
# ============================================================

class NotificationTemplate(Base):
    __tablename__ = "notification_templates"

    id               = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name             = Column(String(300), nullable=False)
    event_type       = Column(String(100), nullable=False)
    channel          = Column(String(30), nullable=False)
    language         = Column(String(10), nullable=False, default="hi")
    subject_template = Column(Text)
    body_template    = Column(Text, nullable=False)
    is_active        = Column(Boolean, nullable=False, default=True)
    created_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("event_type", "channel", "language"),)


class NotificationLog(Base):
    __tablename__ = "notification_logs"

    id                  = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    template_id         = Column(UUID(as_uuid=True), ForeignKey("notification_templates.id"))
    recipient_user_id   = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    recipient_contact   = Column(String(255), nullable=False)
    channel             = Column(String(30), nullable=False)
    event_type          = Column(String(100), nullable=False)
    complaint_id        = Column(UUID(as_uuid=True))
    task_id             = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    survey_instance_id  = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"))
    payload             = Column(JSONB, nullable=False, default=dict)
    status              = Column(String(20), nullable=False, default="pending")
    external_message_id = Column(String(255))
    error_message       = Column(Text)
    sent_at             = Column(DateTime(timezone=True))
    delivered_at        = Column(DateTime(timezone=True))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class AreaNotificationSubscription(Base):
    __tablename__ = "area_notification_subscriptions"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id            = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    location           = Column(Geometry("POINT", srid=4326), nullable=False)
    radius_meters      = Column(Integer, nullable=False, default=5000)
    preferred_channels = Column(ARRAY(Text), nullable=False, default=list)
    is_active          = Column(Boolean, nullable=False, default=True)
    created_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 11 â€” GCP INTEGRATION
# ============================================================

class PubSubEventLog(Base):
    __tablename__ = "pubsub_event_log"

    id                   = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    event_type           = Column(String(100), nullable=False)
    pubsub_topic         = Column(String(300))
    pubsub_message_id    = Column(String(200))
    published_at         = Column(DateTime(timezone=True))
    ack_at               = Column(DateTime(timezone=True))
    payload              = Column(JSONB, nullable=False, default=dict)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id              = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    user_id              = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    processed_by         = Column(String(200))
    processing_status    = Column(String(20), nullable=False, default="published")
    retry_count          = Column(SmallInteger, nullable=False, default=0)
    error_message        = Column(Text)
    processed_at         = Column(DateTime(timezone=True))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class CloudTaskSchedule(Base):
    __tablename__ = "cloud_task_schedule"

    id                     = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    cloud_task_name        = Column(String(500), nullable=False, unique=True)
    queue_name             = Column(String(200), nullable=False)
    task_type              = Column(String(100), nullable=False)
    complaint_id           = Column(UUID(as_uuid=True))
    workflow_instance_id   = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id                = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    survey_instance_id     = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"))
    target_user_id         = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    payload                = Column(JSONB, nullable=False, default=dict)
    scheduled_for          = Column(DateTime(timezone=True), nullable=False)
    schedule_delay_seconds = Column(Integer, nullable=False, default=0)
    status                 = Column(String(20), nullable=False, default="scheduled")
    retry_count            = Column(SmallInteger, nullable=False, default=0)
    error_message          = Column(Text)
    executed_at            = Column(DateTime(timezone=True))
    created_at             = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 12 â€” AGENT LOGS
# ============================================================

class AgentLog(Base):
    __tablename__ = "agent_logs"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    agent_type           = Column(String(60), nullable=False)
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id              = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    input_data           = Column(JSONB, nullable=False, default=dict)
    output_data          = Column(JSONB, nullable=False, default=dict)
    action_taken         = Column(String(300))
    confidence_score     = Column(Numeric(5, 4))
    human_overridden     = Column(Boolean, nullable=False, default=False)
    override_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    override_reason      = Column(Text)
    latency_ms           = Column(Integer)
    model_used           = Column(String(100))
    tokens_used          = Column(Integer)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 13 â€” PUBLIC ANNOUNCEMENTS
# ============================================================

class PublicAnnouncement(Base):
    __tablename__ = "public_announcements"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id      = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    title                = Column(String(500), nullable=False)
    content              = Column(Text, nullable=False)
    work_type            = Column(String(100))
    affected_area        = Column(Geometry("POLYGON", srid=4326))
    status               = Column(String(30), nullable=False)
    expected_start_date  = Column(Date)
    expected_end_date    = Column(Date)
    actual_end_date      = Column(Date)
    is_published         = Column(Boolean, nullable=False, default=False)
    published_at         = Column(DateTime(timezone=True))
    expires_at           = Column(DateTime(timezone=True))
    created_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 14 â€” KPI SNAPSHOTS
# ============================================================

class OfficialPerformanceSnapshot(Base):
    __tablename__ = "official_performance_snapshots"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    official_id              = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    department_id            = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    snapshot_date            = Column(Date, nullable=False)
    tasks_assigned           = Column(Integer, nullable=False, default=0)
    tasks_completed          = Column(Integer, nullable=False, default=0)
    tasks_overdue            = Column(Integer, nullable=False, default=0)
    avg_resolution_hours     = Column(Numeric(8, 2))
    avg_survey_rating        = Column(Numeric(4, 2))
    override_count           = Column(Integer, nullable=False, default=0)
    override_reason_breakdown = Column(JSONB, nullable=False, default=dict)
    complaints_handled       = Column(Integer, nullable=False, default=0)
    emergency_bypasses       = Column(Integer, nullable=False, default=0)
    posthoc_tasks_pending    = Column(Integer, nullable=False, default=0)
    created_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("official_id", "snapshot_date"),)


class ContractorPerformanceSnapshot(Base):
    __tablename__ = "contractor_performance_snapshots"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    contractor_id       = Column(UUID(as_uuid=True), ForeignKey("contractors.id"), nullable=False)
    snapshot_date       = Column(Date, nullable=False)
    tasks_completed     = Column(Integer, nullable=False, default=0)
    tasks_overdue       = Column(Integer, nullable=False, default=0)
    avg_completion_hours = Column(Numeric(8, 2))
    avg_survey_rating   = Column(Numeric(4, 2))
    tenders_won         = Column(Integer, nullable=False, default=0)
    tenders_applied     = Column(Integer, nullable=False, default=0)
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("contractor_id", "snapshot_date"),)


# ============================================================
# LAYER 15 â€” DOMAIN EVENTS
# ============================================================

class DomainEvent(Base):
    __tablename__ = "domain_events"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    event_type           = Column(String(100), nullable=False)
    entity_type          = Column(String(60), nullable=False)
    entity_id            = Column(UUID(as_uuid=True), nullable=False)
    actor_id             = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    actor_type           = Column(String(30))
    payload              = Column(JSONB, nullable=False, default=dict)
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
```

#### 4.sql
`$lang
-- ============================================================
--  PS-CRM  |  Smart Public Service CRM
--  FINAL CONSOLIDATED SCHEMA
--  Platform: GCP Cloud SQL (PostgreSQL 15+)
--
--  This is the ONLY file you need. Run once on a fresh DB:
--    psql -h <host> -U <user> -d <db> -f ps_crm_final.sql
--
--  Incorporates all fixes from v3.1 and v3.2.
--  Apply order: just this file. Nothing else.
--
--  Included in order:
--   1. Base schema (v3)
--   2. Critical fixes (v3.1): workflow_complaints junction,
--      location_hash race fix, normalized step dependencies,
--      assignment single source of truth, separate embeddings table,
--      task_sla, domain_events, soft delete, workflow_status_history,
--      survey geo index
--   3. Final fixes (v3.2): UNIQUE complaint->workflow constraint,
--      geohash upgrade, fn_ingest_complaint atomic transaction,
--      text_embedding NOT NULL, v_missing_embeddings monitoring view
-- ============================================================


-- ============================================================
-- PART 1: BASE SCHEMA (v3)
-- ============================================================

-- ============================================================
--  PS-CRM  |  Smart Public Service CRM
--  Production Schema v3 â€” COMPLETE, SINGLE FILE
--  Platform : GCP Cloud SQL (PostgreSQL 15+)
--  City     : Delhi (multi-city SaaS ready)
--
--  Apply order:
--    psql -h <host> -U <user> -d <db> -f ps_crm_schema_v3.sql
--
--  LAYER ORDER
--   1.  Extensions
--   2.  Reference / Master Data
--   3.  Users & Actors
--   4.  Infrastructure
--   5.  Complaints  (partitioned)
--   6.  Workflow Engine
--   7.  Tasks
--   8.  Emergency Post-Hoc
--   9.  Tenders
--  10.  Surveys
--  11.  Notifications
--  12.  GCP Integration (Pub/Sub + Cloud Tasks)
--  13.  Agent Logs
--  14.  Public Dashboard
--  15.  KPI Snapshots
--  16.  Deferred FKs
--  17.  Partitioned child tables
--  18.  Indexes
--  19.  Triggers
--  20.  Helper Functions
--  21.  Views
-- ============================================================


-- ============================================================
-- 1. EXTENSIONS
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS vector;      -- pgvector: Nomic 768-dim embeddings

-- ============================================================
-- 2. REFERENCE / MASTER DATA
-- ============================================================

-- â”€â”€ 2.1 Cities â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE cities (
    id              UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    name            VARCHAR(100) NOT NULL,
    state           VARCHAR(100),
    country_code    CHAR(2)      NOT NULL DEFAULT 'IN',
    city_code       VARCHAR(10)  NOT NULL UNIQUE, -- DEL, MUM, etc. (used in serial numbers)
    timezone        VARCHAR(50)  NOT NULL DEFAULT 'Asia/Kolkata',
    metadata        JSONB        NOT NULL DEFAULT '{}',
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE cities IS
    'Top-level city entity. Every resource is scoped to a city.
     city_code is used in complaint/task/tender serial numbers (CRM-DEL-...).
     Adding a new city = insert one row + seed its jurisdictions.';

-- â”€â”€ 2.2 Jurisdictions (authority boundaries) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- PostGIS MULTIPOLYGON for each authority area.
-- Reverse-lookup at complaint ingestion to auto-tag jurisdiction.
-- Delhi: NDMC, MCD, MCD_SOUTH, MCD_EAST, MCD_NORTH, PWD, DDA, CANTONMENT, DJB, IGL
CREATE TABLE jurisdictions (
    id                  UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id             UUID         NOT NULL REFERENCES cities(id) ON DELETE RESTRICT,
    parent_id           UUID         REFERENCES jurisdictions(id),  -- nested zones
    name                VARCHAR(200) NOT NULL,
    code                VARCHAR(30)  NOT NULL,
    jurisdiction_type   VARCHAR(50)  NOT NULL,
    -- e.g. NDMC | MCD | MCD_SOUTH | PWD | DDA | CANTONMENT | DJB | IGL
    boundary            GEOMETRY(MULTIPOLYGON, 4326),
    metadata            JSONB        NOT NULL DEFAULT '{}',
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (city_id, code)
);

COMMENT ON TABLE jurisdictions IS
    'Spatial authority boundaries. A single location can fall under multiple authorities:
     road â†’ PWD, drain â†’ MCD, land â†’ DDA.
     fn_resolve_jurisdiction() returns the most specific (smallest area) match.
     Workflow templates are keyed on (infra_type + jurisdiction) â€” same road complaint
     has different approval chains in NDMC vs MCD.
     Boundary GeoJSON sourced from Delhi Open Data portal.';

-- â”€â”€ 2.3 Workflow Constraints (admin-managed, no redeploy) â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workflow_constraints (
    id                       UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id                  UUID         NOT NULL REFERENCES cities(id),
    jurisdiction_id          UUID         REFERENCES jurisdictions(id), -- NULL = whole city

    name                     VARCHAR(300) NOT NULL,
    description              TEXT,
    constraint_type          VARCHAR(30)  NOT NULL
                                 CHECK (constraint_type IN (
                                     'seasonal',   -- monsoon moratorium, winter smog
                                     'emergency',  -- flood rescue ops, riots
                                     'policy',     -- election model code
                                     'resource'    -- equipment shortage
                                 )),

    -- What it blocks (empty array = ALL)
    affected_dept_codes      TEXT[]       NOT NULL DEFAULT '{}',
    affected_work_type_codes TEXT[]       NOT NULL DEFAULT '{}',

    -- Recurring annual (e.g. monsoon Jul-Sep every year)
    is_recurring_annual      BOOLEAN      NOT NULL DEFAULT FALSE,
    start_month              SMALLINT     CHECK (start_month BETWEEN 1 AND 12),
    start_day                SMALLINT     CHECK (start_day   BETWEEN 1 AND 31),
    end_month                SMALLINT     CHECK (end_month   BETWEEN 1 AND 12),
    end_day                  SMALLINT     CHECK (end_day     BETWEEN 1 AND 31),

    -- One-off absolute window
    active_from              DATE,
    active_until             DATE,

    -- Future-proof condition (e.g. {"rainfall_mm": ">50", "aqi": ">400"})
    condition                JSONB        NOT NULL DEFAULT '{}',

    -- Shown verbatim to officials and citizens when step is blocked
    block_message            TEXT         NOT NULL,
    legal_reference          TEXT,

    is_active                BOOLEAN      NOT NULL DEFAULT TRUE,
    created_by               UUID,        -- FK to users added after users table
    updated_by               UUID,
    created_at               TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at               TIMESTAMPTZ  NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_wc_date_range CHECK (
        (is_recurring_annual = TRUE
            AND start_month IS NOT NULL AND start_day IS NOT NULL
            AND end_month   IS NOT NULL AND end_day   IS NOT NULL)
        OR
        (is_recurring_annual = FALSE
            AND active_from IS NOT NULL AND active_until IS NOT NULL)
    )
);

COMMENT ON TABLE workflow_constraints IS
    'Admin-managed, frontend-editable workflow blocking rules.
     No code deployment needed to add/remove constraints.
     Admin adds monsoon moratorium every July â†’ system auto-blocks road-cutting steps.
     After September: admin deactivates it. Done.
     condition JSONB is for future sensor/API-driven triggers (rainfall, AQI).';

-- â”€â”€ 2.4 Departments â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- head_official_id FK added after users table (Layer 16)
CREATE TABLE departments (
    id                  UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id             UUID         NOT NULL REFERENCES cities(id),
    jurisdiction_id     UUID         REFERENCES jurisdictions(id), -- NULL = city-wide
    name                VARCHAR(300) NOT NULL,
    code                VARCHAR(30)  NOT NULL,                    -- PWD, MCD, NDMC, DJB, IGL
    contact_email       VARCHAR(255),
    contact_phone       VARCHAR(20),
    metadata            JSONB        NOT NULL DEFAULT '{}',
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (city_id, code)
);

COMMENT ON TABLE departments IS
    'Government departments scoped to city and optionally to a jurisdiction.
     DJB (water board) is city-wide; MCD Horticulture is zone-specific.';

-- â”€â”€ 2.5 Infrastructure Types â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE infra_types (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    name                    VARCHAR(100) NOT NULL,  -- Road, Drain, Streetlight, Water Pipe
    code                    VARCHAR(30)  NOT NULL UNIQUE,
    default_dept_ids        UUID[]       NOT NULL DEFAULT '{}',
    -- Radius within which complaints on same type are clustered to one infra_node
    cluster_radius_meters   INTEGER      NOT NULL DEFAULT 50,
    -- 3-year repeat threshold (configurable per type)
    repeat_alert_years      INTEGER      NOT NULL DEFAULT 3,
    icon_url                TEXT,
    metadata                JSONB        NOT NULL DEFAULT '{}',
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE infra_types IS
    'Master infra catalogue. cluster_radius_meters controls complaint clustering:
     two complaints within this distance on the same type â†’ same infra_node.
     repeat_alert_years: complaint on same node within this window â†’ priority critical.';


-- ============================================================
-- 3. USERS & ACTORS
-- ============================================================

CREATE TYPE user_role AS ENUM (
    'citizen',
    'worker',
    'contractor',
    'official',     -- assigns tasks, views area complaints
    'admin',        -- branch/zone admin
    'super_admin'   -- city-wide, approves tenders
);

CREATE TABLE users (
    id                  UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id             UUID         REFERENCES cities(id),
    department_id       UUID         REFERENCES departments(id),
    jurisdiction_id     UUID         REFERENCES jurisdictions(id),
    email               VARCHAR(255) UNIQUE,
    phone               VARCHAR(20)  UNIQUE,
    full_name           VARCHAR(300) NOT NULL,
    preferred_language  VARCHAR(10)  NOT NULL DEFAULT 'hi',
    role                user_role    NOT NULL,
    is_active           BOOLEAN      NOT NULL DEFAULT TRUE,
    is_verified         BOOLEAN      NOT NULL DEFAULT FALSE,
    -- Firebase Auth UID (GCP Identity Platform)
    auth_uid            VARCHAR(255) UNIQUE,
    auth_provider       VARCHAR(30)  NOT NULL DEFAULT 'phone_otp',
    -- GCP Firebase Cloud Messaging token for push
    fcm_token           TEXT,
    twilio_opt_in       BOOLEAN      NOT NULL DEFAULT TRUE,
    email_opt_in        BOOLEAN      NOT NULL DEFAULT TRUE,
    metadata            JSONB        NOT NULL DEFAULT '{}',
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_user_contact CHECK (email IS NOT NULL OR phone IS NOT NULL)
);

COMMENT ON TABLE users IS
    'Unified user table for all roles.
     auth_uid links to GCP Identity Platform / Firebase Auth.
     Citizens self-register via phone OTP.
     Officials, admins provisioned by super_admin.
     twilio_opt_in / email_opt_in respected by notification dispatcher.';

-- Now safe to backfill workflow_constraints creator FK
ALTER TABLE workflow_constraints
    ADD CONSTRAINT fk_wc_created_by FOREIGN KEY (created_by) REFERENCES users(id),
    ADD CONSTRAINT fk_wc_updated_by FOREIGN KEY (updated_by) REFERENCES users(id);

ALTER TABLE departments
    ADD COLUMN head_official_id UUID REFERENCES users(id) ON DELETE SET NULL;

-- â”€â”€ 3.1 Contractors â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE contractors (
    id                      UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id                 UUID          NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    city_id                 UUID          NOT NULL REFERENCES cities(id),
    company_name            VARCHAR(400)  NOT NULL,
    registration_number     VARCHAR(100)  NOT NULL,
    registered_dept_ids     UUID[]        NOT NULL DEFAULT '{}',
    license_expiry          DATE,
    max_concurrent_tasks    INTEGER       NOT NULL DEFAULT 5,
    performance_score       NUMERIC(4,2)  NOT NULL DEFAULT 5.0
                                CHECK (performance_score BETWEEN 0 AND 10),
    is_blacklisted          BOOLEAN       NOT NULL DEFAULT FALSE,
    blacklist_reason        TEXT,
    blacklisted_at          TIMESTAMPTZ,
    blacklisted_by          UUID          REFERENCES users(id),
    metadata                JSONB         NOT NULL DEFAULT '{}',
    created_at              TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE contractors IS
    'Registered contractors per city. Officials can override system assignment
     but must log a reason_code (enum). High override rate is flagged on KPI.
     Blacklisted contractors are excluded from all assignment suggestions.';

-- â”€â”€ 3.2 Workers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workers (
    id                  UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id             UUID          NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    department_id       UUID          REFERENCES departments(id),
    contractor_id       UUID          REFERENCES contractors(id), -- NULL = direct govt employee
    employee_id         VARCHAR(100),
    skills              TEXT[]        NOT NULL DEFAULT '{}',
    is_available        BOOLEAN       NOT NULL DEFAULT TRUE,
    current_task_count  INTEGER       NOT NULL DEFAULT 0,
    performance_score   NUMERIC(4,2)  NOT NULL DEFAULT 5.0
                            CHECK (performance_score BETWEEN 0 AND 10),
    metadata            JSONB         NOT NULL DEFAULT '{}',
    created_at          TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE workers IS
    'Field workers â€” direct employees (contractor_id IS NULL) or under a contractor.
     current_task_count incremented/decremented by trigger on task assignment.';


-- ============================================================
-- 4. INFRASTRUCTURE
-- ============================================================

-- â”€â”€ 4.1 Infra Nodes (simple assets: point or line) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE infra_nodes (
    id                      UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id                 UUID          NOT NULL REFERENCES cities(id),
    jurisdiction_id         UUID          REFERENCES jurisdictions(id), -- auto-resolved
    infra_type_id           UUID          NOT NULL REFERENCES infra_types(id),
    name                    VARCHAR(400),  -- "Streetlight near Chhatrapati Nagar"
    location                GEOMETRY(GEOMETRY, 4326) NOT NULL, -- POINT or LINESTRING
    status                  VARCHAR(30)   NOT NULL DEFAULT 'operational'
                                CHECK (status IN (
                                    'operational',
                                    'damaged',
                                    'under_repair',
                                    'decommissioned'
                                )),
    attributes              JSONB         NOT NULL DEFAULT '{}',

    -- â”€â”€ Repeat complaint tracking (denormalized for fast ingestion lookup) â”€â”€
    -- Updated every time a workflow on this node is marked completed
    last_resolved_at        TIMESTAMPTZ,
    last_resolved_workflow_id UUID,       -- FK to workflow_instances (added in Layer 16)
    total_complaint_count   INTEGER       NOT NULL DEFAULT 0,
    total_resolved_count    INTEGER       NOT NULL DEFAULT 0,

    created_at              TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE infra_nodes IS
    'Physical infrastructure items. Complaints are clustered under a node.
     last_resolved_at + infra_types.repeat_alert_years drive the repeat escalation:
     new complaint on same node within threshold â†’ priority = critical.
     This is denormalized intentionally â€” ingestion needs it in ONE fast lookup,
     not a subquery across the complaints table.
     total_complaint_count and total_resolved_count feed the hotspot detection view.';

-- â”€â”€ 4.2 Asset Health Logs â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE asset_health_logs (
    id                  UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    infra_node_id       UUID          NOT NULL REFERENCES infra_nodes(id) ON DELETE CASCADE,
    health_score        NUMERIC(4,2)  CHECK (health_score BETWEEN 0 AND 10),
    open_complaint_count   INTEGER    NOT NULL DEFAULT 0,
    resolved_complaint_count INTEGER  NOT NULL DEFAULT 0,
    avg_resolution_days NUMERIC(8,2),
    last_complaint_at   TIMESTAMPTZ,
    computed_at         TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE asset_health_logs IS
    'Append-only health snapshot per infra_node. Written by the KPI Cloud Scheduler job.
     Drives the infra hotspot detection view and agent priority scoring.
     health_score: 10 = perfect, 0 = repeatedly failing. Agent uses this for
     complaint priority suggestion alongside is_repeat_complaint flag.';


-- ============================================================
-- 5. COMPLAINTS  (range-partitioned by created_at â€” monthly)
-- ============================================================

-- Partitioned parent table â€” do NOT insert directly into this table.
-- Insert into the monthly child partitions (created in Layer 17).
CREATE TABLE complaints (
    id                          UUID         NOT NULL DEFAULT uuid_generate_v4(),
    complaint_number            VARCHAR(30)  NOT NULL,  -- CRM-DEL-2025-001234
    citizen_id                  UUID         NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    city_id                     UUID         NOT NULL REFERENCES cities(id),
    jurisdiction_id             UUID         REFERENCES jurisdictions(id),   -- auto-resolved
    infra_node_id               UUID         REFERENCES infra_nodes(id),     -- set after clustering
    workflow_instance_id        UUID,                                         -- FK deferred Layer 16

    -- â”€â”€ Content â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    title                       VARCHAR(500) NOT NULL,
    description                 TEXT         NOT NULL,
    original_language           VARCHAR(10)  NOT NULL DEFAULT 'hi',
    translated_description      TEXT,

    -- â”€â”€ Location â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    location                    GEOMETRY(POINT, 4326) NOT NULL,
    address_text                TEXT,

    -- â”€â”€ Media (stored in GCS; URLs here) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    -- [{url, gcs_path, mime_type, width, height, uploaded_at}]
    images                      JSONB        NOT NULL DEFAULT '[]',
    voice_recording_url         TEXT,        -- GCS signed URL
    voice_transcript            TEXT,
    voice_transcript_language   VARCHAR(10),

    -- â”€â”€ Nomic 768-dim embeddings (pgvector) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    text_embedding              vector(768),
    image_embedding             vector(768),

    -- â”€â”€ Status â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    status                      VARCHAR(30)  NOT NULL DEFAULT 'received'
                                    CHECK (status IN (
                                        'received',
                                        'clustered',
                                        'mapped',
                                        'workflow_started',
                                        'in_progress',
                                        'midway_survey_sent',
                                        'resolved',
                                        'closed',
                                        'rejected',
                                        'escalated',
                                        'constraint_blocked',
                                        'emergency'
                                    )),
    priority                    VARCHAR(20)  NOT NULL DEFAULT 'normal'
                                    CHECK (priority IN (
                                        'low', 'normal', 'high', 'critical', 'emergency'
                                    )),

    -- â”€â”€ Repeat complaint escalation â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    -- Set by fn_check_repeat_complaint() at ingestion
    is_repeat_complaint             BOOLEAN      NOT NULL DEFAULT FALSE,
    repeat_previous_complaint_id    UUID,       -- last resolved complaint on same node
    repeat_previous_resolved_at     TIMESTAMPTZ, -- when that one closed
    -- Days between previous resolution and this complaint's creation.
    -- Plain integer set once at ingestion by fn_ingest_complaint.
    -- Cannot be GENERATED: PostgreSQL requires immutable expressions;
    -- NOW() is volatile. Value is the gap at filing time, not today's gap.
    repeat_gap_days                 INTEGER,

    -- â”€â”€ Emergency bypass â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    is_emergency                BOOLEAN      NOT NULL DEFAULT FALSE,
    emergency_bypass_at         TIMESTAMPTZ,
    emergency_bypass_by         UUID         REFERENCES users(id),
    emergency_bypass_reason     TEXT,
    -- Snapshot written at bypass: {bypassed_by, reason, steps_bypassed, posthoc_task_ids}
    emergency_audit_trail       JSONB        NOT NULL DEFAULT '{}',

    -- â”€â”€ Clustering â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    is_cluster_primary          BOOLEAN      NOT NULL DEFAULT FALSE,

    -- â”€â”€ Agent outputs â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    agent_summary               TEXT,
    agent_priority_reason       TEXT,
    agent_suggested_dept_ids    UUID[]       NOT NULL DEFAULT '{}',

    -- â”€â”€ Re-complaint â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    is_recomplaint              BOOLEAN      NOT NULL DEFAULT FALSE,
    parent_complaint_id         UUID,        -- self-ref; FK cannot be on partitioned table
                                             -- enforced at app layer

    -- â”€â”€ Resolution â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    resolved_at                 TIMESTAMPTZ,
    rejected_reason             TEXT,

    created_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),

    PRIMARY KEY (id, created_at)   -- partition key must be in PK on Cloud SQL
) PARTITION BY RANGE (created_at);

COMMENT ON TABLE complaints IS
    'Core entity. Range-partitioned monthly by created_at for Cloud SQL performance.
     One row per citizen submission; multiple complaints cluster under one infra_node.

     REPEAT ESCALATION:
     fn_check_repeat_complaint(infra_node_id) is called at ingestion.
     If infra_node.last_resolved_at is within infra_types.repeat_alert_years:
       priority = critical
       is_repeat_complaint = TRUE
       repeat_previous_complaint_id = last resolved complaint
       repeat_gap_days (GENERATED) = days since last resolution
     agent_priority_reason shows: "Same infra reported again after X days.
     Previous resolution by [official] on [date]."

     PARTITIONING:
     Monthly child partitions are pre-created for 2 years (see Layer 17).
     Cloud Scheduler creates the next month partition on the 25th of each month.

     NOTE: self-referential FKs (parent_complaint_id, repeat_previous_complaint_id)
     cannot be enforced as FK constraints on partitioned tables in PostgreSQL.
     Enforced at application layer + checked by a nightly consistency Cloud Function.';

-- â”€â”€ 5.1 Complaint Status History â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Also range-partitioned (Layer 17)
CREATE TABLE complaint_status_history (
    id              UUID         NOT NULL DEFAULT uuid_generate_v4(),
    complaint_id    UUID         NOT NULL,
    old_status      VARCHAR(30),
    new_status      VARCHAR(30)  NOT NULL,
    changed_by      UUID         REFERENCES users(id),
    reason          TEXT,
    metadata        JSONB        NOT NULL DEFAULT '{}',
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id, created_at)
) PARTITION BY RANGE (created_at);

-- â”€â”€ 5.2 Complaint Clusters â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE complaint_clusters (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    infra_node_id           UUID         NOT NULL REFERENCES infra_nodes(id),
    primary_complaint_id    UUID         NOT NULL,  -- no FK: partitioned table
    complaint_count         INTEGER      NOT NULL DEFAULT 1,
    -- AI-generated summary of all complaints in cluster (shown to official)
    cluster_summary         TEXT,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE complaint_cluster_members (
    cluster_id      UUID        NOT NULL REFERENCES complaint_clusters(id) ON DELETE CASCADE,
    complaint_id    UUID        NOT NULL,   -- no FK: partitioned table
    joined_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (cluster_id, complaint_id)
);

COMMENT ON TABLE complaint_clusters IS
    'Groups complaints targeting the same infra_node.
     Citizens see: "X others also reported this issue."
     Officials see the cluster summary, not individual complaints.
     One cluster â†’ one workflow_instance â†’ one set of tasks.';


-- ============================================================
-- 6. WORKFLOW ENGINE
-- ============================================================

-- â”€â”€ 6.1 Workflow Templates (base â€” named, not versioned) â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workflow_templates (
    id          UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id     UUID         NOT NULL REFERENCES cities(id),
    name        VARCHAR(300) NOT NULL,
    description TEXT,
    created_by  UUID         REFERENCES users(id),
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (city_id, name)
);

COMMENT ON TABLE workflow_templates IS
    'Named base template. Versioning is separate (workflow_template_versions).
     Editing a template = creating a new version, never mutating the base.
     This table is just the anchor; all workflow logic lives in versions + steps.';

-- â”€â”€ 6.2 Workflow Template Versions (immutable on creation) â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workflow_template_versions (
    id                  UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    template_id         UUID         NOT NULL REFERENCES workflow_templates(id),
    city_id             UUID         NOT NULL REFERENCES cities(id),
    jurisdiction_id     UUID         REFERENCES jurisdictions(id),  -- NULL = city-wide
    infra_type_id       UUID         REFERENCES infra_types(id),    -- NULL = generic
    version             INTEGER      NOT NULL,
    is_active           BOOLEAN      NOT NULL DEFAULT TRUE,
    is_latest_version   BOOLEAN      NOT NULL DEFAULT TRUE,
    previous_version_id UUID         REFERENCES workflow_template_versions(id),
    notes               TEXT,
    created_by          UUID         REFERENCES users(id),
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (template_id, version)
);

COMMENT ON TABLE workflow_template_versions IS
    'Frozen version snapshot. Once created, never edited.
     When admin updates a template:
       1. old version: is_latest_version = FALSE
       2. new row inserted: version = old+1, is_latest_version = TRUE
     In-flight workflow_instances carry version_id and run to completion
     under that frozen version. New complaints pick up is_latest_version = TRUE.
     Admin dashboard v_workflow_version_activity shows active_instances per version
     â†’ safe_to_archive when active_instances = 0.

     JURISDICTION LAYER:
     A road complaint in NDMC matches version with jurisdiction_id = NDMC.
     Same complaint type in MCD matches MCD version. Different approval chains.
     fn_resolve_workflow_version() picks the most specific matching version.';

-- â”€â”€ 6.3 Workflow Template Steps â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workflow_template_steps (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    version_id              UUID         NOT NULL
                                REFERENCES workflow_template_versions(id) ON DELETE CASCADE,
    step_number             INTEGER      NOT NULL,
    department_id           UUID         NOT NULL REFERENCES departments(id),
    step_name               VARCHAR(300) NOT NULL,
    description             TEXT,
    expected_duration_hours INTEGER,
    -- Step IDs that must be completed before this step unlocks
    -- Enables: Horticulture(1) must complete before E&M(2) starts
    prerequisite_step_ids   UUID[]       NOT NULL DEFAULT '{}',
    is_optional             BOOLEAN      NOT NULL DEFAULT FALSE,
    requires_tender         BOOLEAN      NOT NULL DEFAULT FALSE,
    -- Matched against workflow_constraints.affected_work_type_codes
    work_type_codes         TEXT[]       NOT NULL DEFAULT '{}',
    metadata                JSONB        NOT NULL DEFAULT '{}',
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (version_id, step_number)
);

COMMENT ON TABLE workflow_template_steps IS
    'Ordered steps tied to a frozen version. prerequisite_step_ids enforces
     sequential locking: Step 3 cannot start until Steps 1 and 2 are completed.
     work_type_codes matched against workflow_constraints at step-unlock time.
     If blocked by an active constraint â†’ step status = constraint_blocked.';

-- â”€â”€ 6.4 Workflow Instances â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workflow_instances (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    -- Workflow drives the cluster (infra_node), not individual complaint
    infra_node_id           UUID         NOT NULL REFERENCES infra_nodes(id),
    template_id             UUID         NOT NULL REFERENCES workflow_templates(id),
    -- version_id is IMMUTABLE after creation â€” this is the governance contract
    version_id              UUID         NOT NULL REFERENCES workflow_template_versions(id),
    jurisdiction_id         UUID         REFERENCES jurisdictions(id),
    status                  VARCHAR(30)  NOT NULL DEFAULT 'active'
                                CHECK (status IN (
                                    'active',
                                    'paused',
                                    'constraint_blocked',
                                    'completed',
                                    'cancelled',
                                    'emergency_bypassed'
                                )),
    mode                    VARCHAR(20)  NOT NULL DEFAULT 'normal'
                                CHECK (mode IN ('normal', 'emergency')),
    current_step_number     INTEGER      NOT NULL DEFAULT 1,
    total_steps             INTEGER      NOT NULL,
    started_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    completed_at            TIMESTAMPTZ,
    blocked_reason          TEXT,
    blocked_until           DATE,        -- surfaced to citizens
    is_emergency            BOOLEAN      NOT NULL DEFAULT FALSE,
    -- Written at bypass: {bypassed_by, reason, bypassed_at, direct_assignee}
    emergency_bypass_log    JSONB        NOT NULL DEFAULT '{}',
    created_by              UUID         REFERENCES users(id),
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE workflow_instances IS
    'One running workflow per infra_node cluster.
     version_id is stamped at creation and NEVER changes.
     In-flight workflows always run to completion on their version.
     Manual admin migration available with audit log entry.

     EMERGENCY MODE:
     mode = emergency + is_emergency = TRUE â†’ all intermediate steps bypassed.
     emergency_posthoc_tasks auto-created for each bypassed non-optional step.
     Workflow status = emergency_bypassed.
     Officials get speed; audit trail is preserved via posthoc tasks.

     On completion: infra_nodes.last_resolved_at and last_resolved_workflow_id
     are updated for repeat-complaint detection on the next complaint.';

-- â”€â”€ 6.5 Workflow Step Instances â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE workflow_step_instances (
    id                          UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    workflow_instance_id        UUID         NOT NULL
                                    REFERENCES workflow_instances(id) ON DELETE CASCADE,
    template_step_id            UUID         NOT NULL
                                    REFERENCES workflow_template_steps(id),
    step_number                 INTEGER      NOT NULL,
    department_id               UUID         NOT NULL REFERENCES departments(id),
    step_name                   VARCHAR(300) NOT NULL,
    status                      VARCHAR(30)  NOT NULL DEFAULT 'pending'
                                    CHECK (status IN (
                                        'pending',
                                        'unlocked',
                                        'assigned',
                                        'in_progress',
                                        'completed',
                                        'blocked',
                                        'constraint_blocked',
                                        'bypassed_emergency',
                                        'skipped',
                                        'overridden'
                                    )),

    -- Assignment
    assigned_official_id        UUID         REFERENCES users(id),
    assigned_worker_id          UUID         REFERENCES workers(id),
    assigned_contractor_id      UUID         REFERENCES contractors(id),

    -- Override (enum-enforced â€” see Layer 7)
    override_reason_code        VARCHAR(30),  -- typed enum at app layer; CHECK below
    override_notes              TEXT,
    override_by                 UUID         REFERENCES users(id),
    override_at                 TIMESTAMPTZ,
    override_original_assignee  JSONB,        -- {type, id, name} snapshot

    -- Timing
    unlocked_at                 TIMESTAMPTZ,
    started_at                  TIMESTAMPTZ,
    expected_completion_at      TIMESTAMPTZ,
    completed_at                TIMESTAMPTZ,

    -- Constraint block
    constraint_block_id         UUID         REFERENCES workflow_constraints(id),
    legally_blocked_at          TIMESTAMPTZ,
    legally_blocked_until       DATE,

    -- Agent
    agent_summary               TEXT,
    agent_priority              VARCHAR(20),

    created_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (workflow_instance_id, step_number),
    CONSTRAINT chk_override_reason CHECK (
        override_reason_code IS NULL OR override_reason_code IN (
            'workload', 'specialization', 'area_familiarity',
            'emergency', 'relationship', 'performance',
            'availability', 'tender_linked', 'other'
        )
    )
);

COMMENT ON TABLE workflow_step_instances IS
    'Running step per workflow. Steps unlock only when all prerequisite steps complete.
     fn_is_step_constraint_blocked() checked before every unlock.
     override_reason_code: constrained dropdown; "other" requires override_notes.
     High override rate per official is flagged on KPI dashboard.';


-- ============================================================
-- 7. TASKS
-- ============================================================

CREATE TABLE tasks (
    id                          UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    task_number                 VARCHAR(30)  NOT NULL UNIQUE,  -- TASK-DEL-2025-001234
    workflow_step_instance_id   UUID         REFERENCES workflow_step_instances(id),
    complaint_id                UUID,        -- no FK: partitioned table; enforced at app layer
    department_id               UUID         NOT NULL REFERENCES departments(id),
    jurisdiction_id             UUID         REFERENCES jurisdictions(id),

    assigned_official_id        UUID         REFERENCES users(id),
    assigned_worker_id          UUID         REFERENCES workers(id),
    assigned_contractor_id      UUID         REFERENCES contractors(id),

    title                       VARCHAR(500) NOT NULL,
    description                 TEXT,
    status                      VARCHAR(30)  NOT NULL DEFAULT 'pending'
                                    CHECK (status IN (
                                        'pending', 'accepted', 'in_progress',
                                        'completed', 'rejected', 'reassigned', 'cancelled'
                                    )),
    priority                    VARCHAR(20)  NOT NULL DEFAULT 'normal'
                                    CHECK (priority IN (
                                        'low', 'normal', 'high', 'critical', 'emergency'
                                    )),

    -- Override
    override_reason_code        VARCHAR(30),
    override_notes              TEXT,
    override_by                 UUID         REFERENCES users(id),
    override_at                 TIMESTAMPTZ,
    previous_assignee           JSONB,
    CONSTRAINT chk_task_override_reason CHECK (
        override_reason_code IS NULL OR override_reason_code IN (
            'workload', 'specialization', 'area_familiarity',
            'emergency', 'relationship', 'performance',
            'availability', 'tender_linked', 'other'
        )
    ),

    -- Timing
    due_at                      TIMESTAMPTZ,
    started_at                  TIMESTAMPTZ,
    completed_at                TIMESTAMPTZ,

    -- Evidence (GCS URLs)
    before_photos               JSONB        NOT NULL DEFAULT '[]',
    after_photos                JSONB        NOT NULL DEFAULT '[]',
    progress_photos             JSONB        NOT NULL DEFAULT '[]',
    completion_notes            TEXT,
    completion_location         GEOMETRY(POINT, 4326),

    agent_summary               TEXT,

    created_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE tasks IS
    'One task per workflow step instance per department.
     Worker/contractor uploads before_photos, progress_photos, after_photos to GCS;
     URLs stored in JSONB. override_reason_code is CHECK-constrained at DB level
     (same values as workflow_step_instances for consistency).
     "other" requires override_notes â€” enforced in API layer.';

-- â”€â”€ 7.1 Task Status History (range-partitioned â€” Layer 17) â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE task_status_history (
    id          UUID         NOT NULL DEFAULT uuid_generate_v4(),
    task_id     UUID         NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
    old_status  VARCHAR(30),
    new_status  VARCHAR(30)  NOT NULL,
    changed_by  UUID         REFERENCES users(id),
    reason      TEXT,
    metadata    JSONB        NOT NULL DEFAULT '{}',
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id, created_at)
) PARTITION BY RANGE (created_at);


-- ============================================================
-- 8. EMERGENCY POST-HOC TASKS
-- ============================================================

CREATE TABLE emergency_posthoc_tasks (
    id                          UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    workflow_instance_id        UUID         NOT NULL
                                    REFERENCES workflow_instances(id) ON DELETE CASCADE,
    complaint_id                UUID         NOT NULL,  -- app-layer enforced
    original_template_step_id  UUID         NOT NULL
                                    REFERENCES workflow_template_steps(id),
    step_number                 INTEGER      NOT NULL,
    step_name                   VARCHAR(300) NOT NULL,
    department_id               UUID         NOT NULL REFERENCES departments(id),
    assigned_official_id        UUID         REFERENCES users(id),

    documentation_type          VARCHAR(50)  NOT NULL
                                    CHECK (documentation_type IN (
                                        'site_photos',
                                        'inspection_report',
                                        'safety_clearance',
                                        'material_certificate',
                                        'noc',
                                        'completion_report',
                                        'other'
                                    )),
    instructions                TEXT         NOT NULL,
    is_mandatory                BOOLEAN      NOT NULL DEFAULT TRUE,

    status                      VARCHAR(30)  NOT NULL DEFAULT 'pending'
                                    CHECK (status IN (
                                        'pending',
                                        'in_progress',
                                        'completed',
                                        'waived'     -- super_admin only, reason mandatory
                                    )),
    waived_by                   UUID         REFERENCES users(id),
    waived_reason               TEXT,

    -- [{url, gcs_path, mime_type, uploaded_by, uploaded_at, description}]
    uploaded_documents          JSONB        NOT NULL DEFAULT '[]',
    completion_notes            TEXT,

    due_within_hours            INTEGER      NOT NULL DEFAULT 48,
    emergency_bypass_at         TIMESTAMPTZ  NOT NULL,
    -- Set at INSERT time by the bypass handler:
    --   due_at = emergency_bypass_at + (due_within_hours * interval '1 hour')
    -- Cannot be GENERATED: PostgreSQL rejects interval arithmetic on column
    -- references as non-immutable in generated column expressions.
    due_at                      TIMESTAMPTZ  NOT NULL,
    completed_at                TIMESTAMPTZ,

    created_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE emergency_posthoc_tasks IS
    'Auto-generated when emergency bypass fires on a workflow_instance.
     One row per bypassed non-optional step.
     due_at set at INSERT time by bypass handler:
       due_at = emergency_bypass_at + (due_within_hours * interval ''1 hour'')
     Cannot be a GENERATED column: PostgreSQL disallows interval arithmetic
     on other column references in generated expressions (not immutable).
     Complaint cannot be fully closed until all non-waived posthoc tasks complete.
     Only super_admin can waive; waived_reason is mandatory.
     Cloud Tasks job (CHECK_POSTHOC_DEADLINE) monitors overdue rows
     and escalates to super_admin via Pub/Sub event.';


-- ============================================================
-- 9. TENDERS
-- ============================================================

CREATE TABLE tenders (
    id                          UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    tender_number               VARCHAR(30)   NOT NULL UNIQUE,  -- TND-DEL-2025-000123
    department_id               UUID          NOT NULL REFERENCES departments(id),
    workflow_step_instance_id   UUID          REFERENCES workflow_step_instances(id),
    complaint_id                UUID,         -- app-layer enforced (partitioned)
    requested_by                UUID          NOT NULL REFERENCES users(id),
    title                       VARCHAR(500)  NOT NULL,
    description                 TEXT,
    scope_of_work               TEXT,
    estimated_cost              NUMERIC(15,2),
    final_cost                  NUMERIC(15,2),
    status                      VARCHAR(30)   NOT NULL DEFAULT 'draft'
                                    CHECK (status IN (
                                        'draft', 'submitted', 'under_review',
                                        'approved', 'rejected', 'awarded',
                                        'in_progress', 'completed', 'cancelled'
                                    )),
    approved_by                 UUID          REFERENCES users(id),
    rejected_by                 UUID          REFERENCES users(id),
    awarded_to_contractor_id    UUID          REFERENCES contractors(id),
    -- [{name, url, gcs_path, uploaded_at, uploaded_by}]
    documents                   JSONB         NOT NULL DEFAULT '[]',
    approval_notes              TEXT,
    rejection_reason            TEXT,
    submitted_at                TIMESTAMPTZ,
    approved_at                 TIMESTAMPTZ,
    awarded_at                  TIMESTAMPTZ,
    due_date                    DATE,
    created_at                  TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE tenders IS
    'Full tender lifecycle: draft â†’ submitted â†’ super_admin approval â†’ awarded.
     Step is blocked until tender status = awarded.
     Documents stored in GCS (Cloud Storage); URLs in JSONB.';


-- ============================================================
-- 10. SURVEYS
-- ============================================================

CREATE TABLE survey_templates (
    id                  UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    name                VARCHAR(300) NOT NULL,
    survey_type         VARCHAR(30)  NOT NULL
                            CHECK (survey_type IN (
                                'midway',           -- auto at ~50% workflow steps
                                'completion',       -- auto at workflow resolved
                                'worker_feedback'   -- to worker about the job
                            )),
    -- Trigger midway survey when this % of steps are complete
    trigger_at_step_pct SMALLINT     DEFAULT 50
                            CHECK (trigger_at_step_pct BETWEEN 1 AND 99),
    -- [{id, text, type: 'rating'|'text'|'boolean', required: true|false}]
    questions           JSONB        NOT NULL,
    is_active           BOOLEAN      NOT NULL DEFAULT TRUE,
    created_by          UUID         REFERENCES users(id),
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE survey_templates IS
    'Survey config. Agent autonomously triggers:
     - midway: to citizens when workflow reaches trigger_at_step_pct
     - completion: to citizens after workflow resolves
     - worker_feedback: to workers/contractors after their task completes
     Dispatch goes through Cloud Tasks queue (scheduled) â†’ Cloud Run â†’ Twilio/email.';

CREATE TABLE survey_instances (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    template_id             UUID         NOT NULL REFERENCES survey_templates(id),
    workflow_instance_id    UUID         REFERENCES workflow_instances(id),
    complaint_id            UUID,        -- app-layer enforced
    survey_type             VARCHAR(30)  NOT NULL,
    target_user_id          UUID         NOT NULL REFERENCES users(id),
    target_role             VARCHAR(30)  NOT NULL,
    status                  VARCHAR(20)  NOT NULL DEFAULT 'pending'
                                CHECK (status IN (
                                    'pending', 'sent', 'opened', 'completed', 'expired'
                                )),
    triggered_by            VARCHAR(20)  NOT NULL DEFAULT 'agent',
    channel                 VARCHAR(20)  NOT NULL DEFAULT 'whatsapp'
                                CHECK (channel IN ('whatsapp', 'email', 'portal', 'sms')),
    triggered_at            TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    sent_at                 TIMESTAMPTZ,
    opened_at               TIMESTAMPTZ,
    completed_at            TIMESTAMPTZ,
    expires_at              TIMESTAMPTZ,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE survey_responses (
    id                  UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    survey_instance_id  UUID         NOT NULL REFERENCES survey_instances(id),
    respondent_id       UUID         NOT NULL REFERENCES users(id),
    -- [{question_id, answer}]
    answers             JSONB        NOT NULL,
    -- Extracted from answers for fast KPI aggregation
    overall_rating      NUMERIC(3,1) CHECK (overall_rating BETWEEN 1 AND 5),
    feedback_text       TEXT,
    submitted_at        TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE survey_responses IS
    'overall_rating extracted from answers and stored flat.
     Feeds directly into official_performance_snapshots and
     contractor_performance_snapshots (computed nightly by Cloud Scheduler).';


-- ============================================================
-- 11. NOTIFICATIONS
-- ============================================================

-- â”€â”€ 11.1 Notification Templates â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE notification_templates (
    id              UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    name            VARCHAR(300) NOT NULL,
    event_type      VARCHAR(100) NOT NULL,
    -- Event types: COMPLAINT_RECEIVED | COMPLAINT_CLUSTERED | WORKFLOW_STARTED |
    --   TASK_ASSIGNED | TASK_STARTED | TASK_COMPLETED | STEP_CONSTRAINT_BLOCKED |
    --   DELAY_ALERT | SURVEY_MIDWAY | SURVEY_END | EMERGENCY_BYPASS |
    --   TENDER_APPROVED | TENDER_REJECTED | REPEAT_COMPLAINT_ESCALATED
    channel         VARCHAR(30)  NOT NULL
                        CHECK (channel IN ('email', 'twilio_sms', 'twilio_whatsapp')),
    language        VARCHAR(10)  NOT NULL DEFAULT 'hi',
    subject_template TEXT,                        -- email only; {{variable}} syntax
    body_template   TEXT         NOT NULL,        -- {{complaint_number}}, {{status}}, etc.
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    UNIQUE (event_type, channel, language)
);

COMMENT ON TABLE notification_templates IS
    'Config store for all notification content.
     Dispatcher resolves: event_type + channel + user.preferred_language â†’ template.
     Falls back to English if no language match.
     Channels: Twilio (WhatsApp + SMS) + email (SendGrid or GCP Cloud SMTP).';

-- â”€â”€ 11.2 Notification Logs (range-partitioned â€” Layer 17) â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE notification_logs (
    id                      UUID         NOT NULL DEFAULT uuid_generate_v4(),
    template_id             UUID         REFERENCES notification_templates(id),
    recipient_user_id       UUID         NOT NULL REFERENCES users(id),
    recipient_contact       VARCHAR(255) NOT NULL,
    channel                 VARCHAR(30)  NOT NULL,
    event_type              VARCHAR(100) NOT NULL,
    complaint_id            UUID,
    task_id                 UUID         REFERENCES tasks(id),
    survey_instance_id      UUID         REFERENCES survey_instances(id),
    payload                 JSONB        NOT NULL DEFAULT '{}',
    status                  VARCHAR(20)  NOT NULL DEFAULT 'pending'
                                CHECK (status IN (
                                    'pending', 'sent', 'delivered', 'failed', 'bounced'
                                )),
    -- Twilio MessageSID or email provider message ID
    external_message_id     VARCHAR(255),
    error_message           TEXT,
    sent_at                 TIMESTAMPTZ,
    delivered_at            TIMESTAMPTZ,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id, created_at)
) PARTITION BY RANGE (created_at);

COMMENT ON TABLE notification_logs IS
    'Delivery receipt store. Append-only.
     Twilio webhook â†’ Cloud Run handler â†’ UPDATE status + delivered_at.
     email bounces handled via SendGrid webhook â†’ same handler.
     Partitioned monthly â€” keeps query performance stable over years.';

-- â”€â”€ 11.3 Area Notification Subscriptions â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE area_notification_subscriptions (
    id                  UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id             UUID          NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    location            GEOMETRY(POINT, 4326) NOT NULL,
    radius_meters       INTEGER       NOT NULL DEFAULT 5000,
    preferred_channels  TEXT[]        NOT NULL DEFAULT ARRAY['email','twilio_whatsapp'],
    is_active           BOOLEAN       NOT NULL DEFAULT TRUE,
    created_at          TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE area_notification_subscriptions IS
    'Citizen opt-in for area-wide alerts within radius_meters of their location.
     fn_get_area_subscribers(point, radius) queries this via ST_DWithin GIST index.
     Called by notification dispatcher after any workflow status change.
     Respects user.twilio_opt_in and user.email_opt_in (app layer).';


-- ============================================================
-- 12. GCP INTEGRATION
-- ============================================================

-- â”€â”€ 12.1 Pub/Sub Event Log â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Durable receipt for every event published to GCP Pub/Sub.
-- The DB is not the message broker â€” Pub/Sub is. This table is the audit log.
CREATE TABLE pubsub_event_log (
    id                      UUID         NOT NULL DEFAULT uuid_generate_v4(),
    event_type              VARCHAR(100) NOT NULL,
    -- GCP Pub/Sub metadata
    pubsub_topic            VARCHAR(300),  -- projects/{proj}/topics/{topic}
    pubsub_message_id       VARCHAR(200),  -- GCP-assigned message ID
    published_at            TIMESTAMPTZ,
    ack_at                  TIMESTAMPTZ,
    -- Full event payload as published
    payload                 JSONB        NOT NULL DEFAULT '{}',
    -- Entity references for DB-side queries
    city_id                 UUID         REFERENCES cities(id),
    complaint_id            UUID,         -- no FK: partitioned table
    workflow_instance_id    UUID         REFERENCES workflow_instances(id),
    task_id                 UUID         REFERENCES tasks(id),
    user_id                 UUID         REFERENCES users(id),
    -- Processing
    processed_by            VARCHAR(200), -- Cloud Run service name
    processing_status       VARCHAR(20)  NOT NULL DEFAULT 'published'
                                CHECK (processing_status IN (
                                    'published', 'processing',
                                    'processed', 'failed', 'dead_lettered'
                                )),
    retry_count             SMALLINT     NOT NULL DEFAULT 0,
    error_message           TEXT,
    processed_at            TIMESTAMPTZ,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id, created_at)
) PARTITION BY RANGE (created_at);

COMMENT ON TABLE pubsub_event_log IS
    'GCP Pub/Sub architecture:
     1. Domain Cloud Run service writes to domain table
     2. Same service publishes event to Pub/Sub topic
     3. pubsub_event_log row written as durable receipt
     4. Downstream consumers subscribe independently:
          notification-service â†’ ps-crm-notifications topic
          agent-service        â†’ ps-crm-agent topic
          workflow-engine      â†’ ps-crm-workflow topic
          kpi-service          â†’ ps-crm-kpi topic

     Suggested topics:
       ps-crm-complaints     complaint lifecycle
       ps-crm-workflow       workflow + step events
       ps-crm-tasks          task events
       ps-crm-surveys        survey trigger / response
       ps-crm-notifications  notification dispatch requests
       ps-crm-agent          agent input / output

     dead_lettered rows â†’ GCP dead-letter topic â†’ Cloud Monitoring alert.
     This table enables full event replay for debugging and ops audit.';

-- â”€â”€ 12.2 Cloud Tasks Schedule â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Registry of every GCP Cloud Tasks job created.
-- Cloud Tasks has no native "list all pending tasks" API â€” this fills that gap.
CREATE TABLE cloud_task_schedule (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    -- projects/{proj}/locations/{region}/queues/{queue}/tasks/{name}
    cloud_task_name         VARCHAR(500) NOT NULL UNIQUE,
    queue_name              VARCHAR(200) NOT NULL,
    -- Queues:
    --   ps-crm-notifications    Twilio + email dispatch
    --   ps-crm-surveys          survey sends (delayed after step complete)
    --   ps-crm-kpi              nightly snapshot jobs
    --   ps-crm-overdue-checks   scan overdue tasks / posthoc tasks
    --   ps-crm-escalations      auto-escalation after SLA breach
    task_type               VARCHAR(100) NOT NULL,
    -- Task types:
    --   SEND_NOTIFICATION | TRIGGER_SURVEY | COMPUTE_KPI_SNAPSHOT |
    --   CHECK_OVERDUE_TASKS | ESCALATE_COMPLAINT | SEND_DELAY_ALERT |
    --   EXPIRE_SURVEY | CHECK_POSTHOC_DEADLINE | CREATE_NEXT_PARTITION
    complaint_id            UUID,
    workflow_instance_id    UUID         REFERENCES workflow_instances(id),
    task_id                 UUID         REFERENCES tasks(id),
    survey_instance_id      UUID         REFERENCES survey_instances(id),
    target_user_id          UUID         REFERENCES users(id),
    payload                 JSONB        NOT NULL DEFAULT '{}',
    scheduled_for           TIMESTAMPTZ  NOT NULL,
    schedule_delay_seconds  INTEGER      NOT NULL DEFAULT 0,
    status                  VARCHAR(20)  NOT NULL DEFAULT 'scheduled'
                                CHECK (status IN (
                                    'scheduled', 'executing',
                                    'completed', 'failed', 'cancelled'
                                )),
    retry_count             SMALLINT     NOT NULL DEFAULT 0,
    error_message           TEXT,
    executed_at             TIMESTAMPTZ,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE cloud_task_schedule IS
    'Registry of every GCP Cloud Tasks job we create.
     Usage patterns:
       Survey 24h after workflow midpoint:
         task_type = TRIGGER_SURVEY, schedule_delay_seconds = 86400
       Overdue check 2h after task.due_at:
         task_type = CHECK_OVERDUE_TASKS, scheduled_for = task.due_at + 2h
       Delay alert if step not started within expected_duration_hours:
         task_type = SEND_DELAY_ALERT, target_user_id = citizens in 5km
       Nightly KPI snapshot:
         task_type = COMPUTE_KPI_SNAPSHOT, scheduled_for = next midnight
       Posthoc deadline check:
         task_type = CHECK_POSTHOC_DEADLINE, scheduled_for = posthoc_task.due_at
       Monthly partition creation:
         task_type = CREATE_NEXT_PARTITION, scheduled_for = 25th of month';


-- ============================================================
-- 13. AGENT LOGS
-- ============================================================

CREATE TABLE agent_logs (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    agent_type              VARCHAR(60)  NOT NULL
                                CHECK (agent_type IN (
                                    'INGESTION',
                                    'CLUSTERING',
                                    'DEPT_MAPPER',
                                    'WORKFLOW_ENGINE',
                                    'SURVEY_TRIGGER',
                                    'SUMMARY_GENERATOR',
                                    'PRIORITY_SCORER',
                                    'NOTIFICATION_DISPATCHER',
                                    'ESCALATION_DETECTOR',
                                    'REPEAT_CHECKER'
                                )),
    complaint_id            UUID,
    workflow_instance_id    UUID         REFERENCES workflow_instances(id),
    task_id                 UUID         REFERENCES tasks(id),
    input_data              JSONB        NOT NULL DEFAULT '{}',
    output_data             JSONB        NOT NULL DEFAULT '{}',
    action_taken            VARCHAR(300),
    confidence_score        NUMERIC(5,4) CHECK (confidence_score BETWEEN 0 AND 1),
    human_overridden        BOOLEAN      NOT NULL DEFAULT FALSE,
    override_by             UUID         REFERENCES users(id),
    override_reason         TEXT,
    latency_ms              INTEGER,
    model_used              VARCHAR(100),
    tokens_used             INTEGER,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE agent_logs IS
    'Append-only log of every agentic action. Enables model performance tracking,
     override pattern analysis, and full explainability audit trail.
     REPEAT_CHECKER agent type added for fn_check_repeat_complaint() calls.
     human_overridden = TRUE flags cases where official rejected agent suggestion.';


-- ============================================================
-- 14. PUBLIC DASHBOARD & ANNOUNCEMENTS
-- ============================================================

CREATE TABLE public_announcements (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id                 UUID         NOT NULL REFERENCES cities(id),
    jurisdiction_id         UUID         REFERENCES jurisdictions(id),
    infra_node_id           UUID         REFERENCES infra_nodes(id),
    workflow_instance_id    UUID         REFERENCES workflow_instances(id),
    title                   VARCHAR(500) NOT NULL,
    content                 TEXT         NOT NULL,
    work_type               VARCHAR(100),
    affected_area           GEOMETRY(POLYGON, 4326),
    status                  VARCHAR(30)  NOT NULL,
    expected_start_date     DATE,
    expected_end_date       DATE,
    actual_end_date         DATE,
    is_published            BOOLEAN      NOT NULL DEFAULT FALSE,
    published_at            TIMESTAMPTZ,
    expires_at              TIMESTAMPTZ,
    created_by              UUID         REFERENCES users(id),
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE public_announcements IS
    'Public-facing work announcements on the citizen map.
     Auto-draft created by agent when workflow starts; admin publishes.
     affected_area polygon enables "show work near me" on the public portal.
     Expired or completed announcements filtered out by v_public_complaint_map.';


-- ============================================================
-- 15. KPI SNAPSHOTS
-- ============================================================

-- Written nightly by Cloud Scheduler â†’ Cloud Run kpi-service
CREATE TABLE official_performance_snapshots (
    id                      UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    official_id             UUID          NOT NULL REFERENCES users(id),
    department_id           UUID          REFERENCES departments(id),
    snapshot_date           DATE          NOT NULL,
    tasks_assigned          INTEGER       NOT NULL DEFAULT 0,
    tasks_completed         INTEGER       NOT NULL DEFAULT 0,
    tasks_overdue           INTEGER       NOT NULL DEFAULT 0,
    avg_resolution_hours    NUMERIC(8,2),
    avg_survey_rating       NUMERIC(4,2),
    override_count          INTEGER       NOT NULL DEFAULT 0,
    -- Breakdown by reason_code for analytics
    override_reason_breakdown JSONB       NOT NULL DEFAULT '{}',
    complaints_handled      INTEGER       NOT NULL DEFAULT 0,
    emergency_bypasses      INTEGER       NOT NULL DEFAULT 0,
    posthoc_tasks_pending   INTEGER       NOT NULL DEFAULT 0,
    created_at              TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    UNIQUE (official_id, snapshot_date)
);

CREATE TABLE contractor_performance_snapshots (
    id                      UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
    contractor_id           UUID          NOT NULL REFERENCES contractors(id),
    snapshot_date           DATE          NOT NULL,
    tasks_completed         INTEGER       NOT NULL DEFAULT 0,
    tasks_overdue           INTEGER       NOT NULL DEFAULT 0,
    avg_completion_hours    NUMERIC(8,2),
    avg_survey_rating       NUMERIC(4,2),
    tenders_won             INTEGER       NOT NULL DEFAULT 0,
    tenders_applied         INTEGER       NOT NULL DEFAULT 0,
    created_at              TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    UNIQUE (contractor_id, snapshot_date)
);

COMMENT ON TABLE official_performance_snapshots IS
    'Nightly materialized KPI per official.
     override_reason_breakdown: {"workload": 3, "relationship": 5, "other": 1}
     â€” surfaced as a bar chart on super_admin dashboard.
     High emergency_bypasses or "other"/"relationship" override rates trigger alerts.
     posthoc_tasks_pending: count of overdue posthoc tasks under this official.';


-- ============================================================
-- 16. DEFERRED FKs
-- ============================================================

-- complaints â†’ workflow_instances
ALTER TABLE complaints
    ADD CONSTRAINT fk_complaint_workflow_instance
    FOREIGN KEY (workflow_instance_id)
    REFERENCES workflow_instances(id)
    ON DELETE SET NULL
    NOT VALID;  -- NOT VALID: existing partitions validated async; new rows enforced

-- infra_nodes â†’ workflow_instances (last resolved)
ALTER TABLE infra_nodes
    ADD CONSTRAINT fk_infra_last_resolved_workflow
    FOREIGN KEY (last_resolved_workflow_id)
    REFERENCES workflow_instances(id)
    ON DELETE SET NULL;

COMMENT ON CONSTRAINT fk_infra_last_resolved_workflow ON infra_nodes IS
    'Updated by WORKFLOW_ENGINE on workflow completion.
     Drives fn_check_repeat_complaint() for the repeat escalation rule.';


-- ============================================================
-- 17. PARTITIONED CHILD TABLES (2025 + 2026 pre-created)
-- ============================================================
-- Cloud Tasks CREATE_NEXT_PARTITION job runs on the 25th of each month
-- to create the following month partition before it is needed.
-- Tables partitioned: complaints, complaint_status_history,
--                     task_status_history, notification_logs, pubsub_event_log

-- â”€â”€ complaints â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE complaints_2025_01 PARTITION OF complaints
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');
CREATE TABLE complaints_2025_02 PARTITION OF complaints
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');
CREATE TABLE complaints_2025_03 PARTITION OF complaints
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');
CREATE TABLE complaints_2025_04 PARTITION OF complaints
    FOR VALUES FROM ('2025-04-01') TO ('2025-05-01');
CREATE TABLE complaints_2025_05 PARTITION OF complaints
    FOR VALUES FROM ('2025-05-01') TO ('2025-06-01');
CREATE TABLE complaints_2025_06 PARTITION OF complaints
    FOR VALUES FROM ('2025-06-01') TO ('2025-07-01');
CREATE TABLE complaints_2025_07 PARTITION OF complaints
    FOR VALUES FROM ('2025-07-01') TO ('2025-08-01');
CREATE TABLE complaints_2025_08 PARTITION OF complaints
    FOR VALUES FROM ('2025-08-01') TO ('2025-09-01');
CREATE TABLE complaints_2025_09 PARTITION OF complaints
    FOR VALUES FROM ('2025-09-01') TO ('2025-10-01');
CREATE TABLE complaints_2025_10 PARTITION OF complaints
    FOR VALUES FROM ('2025-10-01') TO ('2025-11-01');
CREATE TABLE complaints_2025_11 PARTITION OF complaints
    FOR VALUES FROM ('2025-11-01') TO ('2025-12-01');
CREATE TABLE complaints_2025_12 PARTITION OF complaints
    FOR VALUES FROM ('2025-12-01') TO ('2026-01-01');
CREATE TABLE complaints_2026_01 PARTITION OF complaints
    FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');
CREATE TABLE complaints_2026_02 PARTITION OF complaints
    FOR VALUES FROM ('2026-02-01') TO ('2026-03-01');
CREATE TABLE complaints_2026_03 PARTITION OF complaints
    FOR VALUES FROM ('2026-03-01') TO ('2026-04-01');
CREATE TABLE complaints_2026_04 PARTITION OF complaints
    FOR VALUES FROM ('2026-04-01') TO ('2026-05-01');
CREATE TABLE complaints_2026_05 PARTITION OF complaints
    FOR VALUES FROM ('2026-05-01') TO ('2026-06-01');
CREATE TABLE complaints_2026_06 PARTITION OF complaints
    FOR VALUES FROM ('2026-06-01') TO ('2026-07-01');
CREATE TABLE complaints_2026_default PARTITION OF complaints DEFAULT;

-- â”€â”€ complaint_status_history â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE csh_2025 PARTITION OF complaint_status_history
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE csh_2026 PARTITION OF complaint_status_history
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');
CREATE TABLE csh_default PARTITION OF complaint_status_history DEFAULT;

-- â”€â”€ task_status_history â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE tsh_2025 PARTITION OF task_status_history
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE tsh_2026 PARTITION OF task_status_history
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');
CREATE TABLE tsh_default PARTITION OF task_status_history DEFAULT;

-- â”€â”€ notification_logs â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE nl_2025 PARTITION OF notification_logs
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE nl_2026 PARTITION OF notification_logs
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');
CREATE TABLE nl_default PARTITION OF notification_logs DEFAULT;

-- â”€â”€ pubsub_event_log â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE pel_2025 PARTITION OF pubsub_event_log
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE pel_2026 PARTITION OF pubsub_event_log
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');
CREATE TABLE pel_default PARTITION OF pubsub_event_log DEFAULT;


-- ============================================================
-- 18. INDEXES
-- ============================================================

-- â”€â”€ Jurisdictions â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_jurisdictions_boundary ON jurisdictions USING GIST(boundary);
CREATE INDEX idx_jurisdictions_city     ON jurisdictions(city_id);
CREATE INDEX idx_jurisdictions_parent   ON jurisdictions(parent_id);

-- â”€â”€ Workflow Constraints â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_wc_city_active ON workflow_constraints(city_id)
    WHERE is_active = TRUE;
CREATE INDEX idx_wc_jurisdiction ON workflow_constraints(jurisdiction_id);

-- â”€â”€ Users â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_users_role       ON users(role);
CREATE INDEX idx_users_city       ON users(city_id);
CREATE INDEX idx_users_department ON users(department_id);
CREATE INDEX idx_users_phone      ON users(phone);
CREATE INDEX idx_users_auth_uid   ON users(auth_uid) WHERE auth_uid IS NOT NULL;

-- â”€â”€ Contractors / Workers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_contractors_city      ON contractors(city_id);
CREATE INDEX idx_contractors_available ON contractors(city_id)
    WHERE is_blacklisted = FALSE;
CREATE INDEX idx_workers_department    ON workers(department_id);
CREATE INDEX idx_workers_available     ON workers(is_available)
    WHERE is_available = TRUE;

-- â”€â”€ Infra Nodes â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_infra_nodes_location       ON infra_nodes USING GIST(location);
CREATE INDEX idx_infra_nodes_city           ON infra_nodes(city_id);
CREATE INDEX idx_infra_nodes_type           ON infra_nodes(infra_type_id);
CREATE INDEX idx_infra_nodes_last_resolved  ON infra_nodes(last_resolved_at)
    WHERE last_resolved_at IS NOT NULL;
-- Composite for repeat-complaint check (one index scan at ingestion)
CREATE INDEX idx_infra_nodes_repeat_check   ON infra_nodes(infra_type_id, last_resolved_at)
    WHERE last_resolved_at IS NOT NULL;

-- â”€â”€ Asset Health Logs â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- BRIN: append-only table, no random updates
CREATE INDEX idx_ahl_node_time ON asset_health_logs
    USING BRIN(infra_node_id, computed_at);

-- â”€â”€ Complaints (parent â€” indexes propagate to partitions) â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_complaints_location     ON complaints USING GIST(location);
CREATE INDEX idx_complaints_citizen      ON complaints(citizen_id);
CREATE INDEX idx_complaints_status       ON complaints(status);
CREATE INDEX idx_complaints_infra_node   ON complaints(infra_node_id);
CREATE INDEX idx_complaints_jurisdiction ON complaints(jurisdiction_id);
CREATE INDEX idx_complaints_priority     ON complaints(priority)
    WHERE priority IN ('critical','emergency');
-- Partial index: repeat complaints (small, fast)
CREATE INDEX idx_complaints_is_repeat    ON complaints(infra_node_id, created_at)
    WHERE is_repeat_complaint = TRUE;
-- Partial index: emergencies
CREATE INDEX idx_complaints_emergency    ON complaints(city_id, created_at)
    WHERE is_emergency = TRUE;
-- IVFFlat for Nomic vector similarity (semantic dedup + clustering)
CREATE INDEX idx_complaints_text_embed   ON complaints
    USING ivfflat(text_embedding vector_cosine_ops) WITH (lists = 100);
CREATE INDEX idx_complaints_image_embed  ON complaints
    USING ivfflat(image_embedding vector_cosine_ops) WITH (lists = 100);
-- BRIN on created_at (partition boundary scans)
CREATE INDEX idx_complaints_created_brin ON complaints USING BRIN(created_at);

-- â”€â”€ Complaint Clusters â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_clusters_infra_node ON complaint_clusters(infra_node_id);
CREATE INDEX idx_ccm_complaint       ON complaint_cluster_members(complaint_id);

-- â”€â”€ Workflow Templates / Versions â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_wtv_template         ON workflow_template_versions(template_id);
CREATE INDEX idx_wtv_latest           ON workflow_template_versions(city_id, infra_type_id)
    WHERE is_latest_version = TRUE AND is_active = TRUE;
CREATE INDEX idx_wtv_jurisdiction     ON workflow_template_versions(jurisdiction_id);
CREATE INDEX idx_wts_version          ON workflow_template_steps(version_id);

-- â”€â”€ Workflow Instances â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_wi_infra_node   ON workflow_instances(infra_node_id);
CREATE INDEX idx_wi_status       ON workflow_instances(status)
    WHERE status = 'active';
CREATE INDEX idx_wi_version      ON workflow_instances(version_id);

-- â”€â”€ Workflow Step Instances â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_wsi_workflow    ON workflow_step_instances(workflow_instance_id);
CREATE INDEX idx_wsi_status      ON workflow_step_instances(status);
CREATE INDEX idx_wsi_official    ON workflow_step_instances(assigned_official_id);
CREATE INDEX idx_wsi_dept        ON workflow_step_instances(department_id);
CREATE INDEX idx_wsi_unlocked    ON workflow_step_instances(workflow_instance_id)
    WHERE status = 'unlocked';

-- â”€â”€ Tasks â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_tasks_worker      ON tasks(assigned_worker_id);
CREATE INDEX idx_tasks_contractor  ON tasks(assigned_contractor_id);
CREATE INDEX idx_tasks_official    ON tasks(assigned_official_id);
CREATE INDEX idx_tasks_status      ON tasks(status);
CREATE INDEX idx_tasks_department  ON tasks(department_id);
CREATE INDEX idx_tasks_due         ON tasks(due_at)
    WHERE status NOT IN ('completed','cancelled');
CREATE INDEX idx_tasks_priority    ON tasks(priority)
    WHERE priority IN ('critical','emergency');

-- â”€â”€ Emergency Posthoc Tasks â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_ept_workflow   ON emergency_posthoc_tasks(workflow_instance_id);
CREATE INDEX idx_ept_official   ON emergency_posthoc_tasks(assigned_official_id);
CREATE INDEX idx_ept_pending    ON emergency_posthoc_tasks(due_at)
    WHERE status = 'pending';

-- â”€â”€ Tenders â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_tenders_department ON tenders(department_id);
CREATE INDEX idx_tenders_status     ON tenders(status);
CREATE INDEX idx_tenders_contractor ON tenders(awarded_to_contractor_id);

-- â”€â”€ Surveys â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_si_workflow    ON survey_instances(workflow_instance_id);
CREATE INDEX idx_si_user        ON survey_instances(target_user_id);
CREATE INDEX idx_si_pending     ON survey_instances(triggered_at)
    WHERE status = 'pending';
CREATE INDEX idx_sr_instance    ON survey_responses(survey_instance_id);

-- â”€â”€ Notifications â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_nt_event_channel_lang
    ON notification_templates(event_type, channel, language);
CREATE INDEX idx_nl_recipient   ON notification_logs(recipient_user_id);
CREATE INDEX idx_nl_status      ON notification_logs(status)
    WHERE status IN ('pending','failed');
-- BRIN for append-only time queries
CREATE INDEX idx_nl_created_brin ON notification_logs USING BRIN(created_at);
CREATE INDEX idx_ans_location    ON area_notification_subscriptions USING GIST(location);
CREATE INDEX idx_ans_user        ON area_notification_subscriptions(user_id);
CREATE INDEX idx_ans_active      ON area_notification_subscriptions(is_active)
    WHERE is_active = TRUE;

-- â”€â”€ Pub/Sub Event Log â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_pel_event_type  ON pubsub_event_log(event_type);
CREATE INDEX idx_pel_workflow    ON pubsub_event_log(workflow_instance_id);
CREATE INDEX idx_pel_status      ON pubsub_event_log(processing_status)
    WHERE processing_status IN ('published','failed');
CREATE INDEX idx_pel_created_brin ON pubsub_event_log USING BRIN(created_at);

-- â”€â”€ Cloud Tasks â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_cts_scheduled   ON cloud_task_schedule(scheduled_for)
    WHERE status = 'scheduled';
CREATE INDEX idx_cts_task_type   ON cloud_task_schedule(task_type);

-- â”€â”€ Agent Logs â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_al_type         ON agent_logs(agent_type);
CREATE INDEX idx_al_created_brin ON agent_logs USING BRIN(created_at);
CREATE INDEX idx_al_overridden   ON agent_logs(agent_type, created_at)
    WHERE human_overridden = TRUE;

-- â”€â”€ Public Announcements â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_pa_affected_area ON public_announcements USING GIST(affected_area);
CREATE INDEX idx_pa_published     ON public_announcements(city_id, is_published, expires_at);

-- â”€â”€ KPI Snapshots â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_ops_official     ON official_performance_snapshots(official_id);
CREATE INDEX idx_ops_dept_date    ON official_performance_snapshots(department_id, snapshot_date DESC);
CREATE INDEX idx_cps_contractor   ON contractor_performance_snapshots(contractor_id);


-- ============================================================
-- 19. TRIGGERS (updated_at)
-- ============================================================

CREATE OR REPLACE FUNCTION fn_set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;

DO $$
DECLARE tbl TEXT;
BEGIN
    FOREACH tbl IN ARRAY ARRAY[
        'cities', 'jurisdictions', 'workflow_constraints',
        'departments', 'users', 'contractors', 'workers',
        'infra_nodes', 'complaint_clusters',
        'workflow_instances', 'workflow_step_instances',
        'tasks', 'tenders', 'area_notification_subscriptions',
        'public_announcements', 'emergency_posthoc_tasks'
    ] LOOP
        EXECUTE format(
            'CREATE TRIGGER trg_%1$s_updated_at
             BEFORE UPDATE ON %1$s
             FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at()',
            tbl
        );
    END LOOP;
END;
$$;

-- â”€â”€ Worker task count trigger â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_update_worker_task_count()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    -- Increment on assignment
    IF TG_OP = 'UPDATE'
       AND NEW.assigned_worker_id IS NOT NULL
       AND (OLD.assigned_worker_id IS DISTINCT FROM NEW.assigned_worker_id
            OR OLD.status = 'pending') THEN
        UPDATE workers
           SET current_task_count = current_task_count + 1
         WHERE id = NEW.assigned_worker_id;
    END IF;
    -- Decrement on completion/cancellation
    IF TG_OP = 'UPDATE'
       AND OLD.assigned_worker_id IS NOT NULL
       AND NEW.status IN ('completed','cancelled','rejected') THEN
        UPDATE workers
           SET current_task_count = GREATEST(0, current_task_count - 1)
         WHERE id = OLD.assigned_worker_id;
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_task_worker_count
    AFTER UPDATE ON tasks
    FOR EACH ROW EXECUTE FUNCTION fn_update_worker_task_count();

-- â”€â”€ Update infra_node on workflow completion â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Sets last_resolved_at and increments total_resolved_count
CREATE OR REPLACE FUNCTION fn_update_infra_on_workflow_complete()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF NEW.status = 'completed' AND OLD.status != 'completed' THEN
        UPDATE infra_nodes
           SET last_resolved_at        = NOW(),
               last_resolved_workflow_id = NEW.id,
               total_resolved_count    = total_resolved_count + 1,
               status                  = 'operational'
         WHERE id = NEW.infra_node_id;
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_workflow_complete_infra
    AFTER UPDATE ON workflow_instances
    FOR EACH ROW EXECUTE FUNCTION fn_update_infra_on_workflow_complete();

COMMENT ON FUNCTION fn_update_infra_on_workflow_complete IS
    'Fires when workflow_instances.status â†’ completed.
     Updates infra_nodes.last_resolved_at â€” this is the value that
     fn_check_repeat_complaint() reads at the next complaint ingestion.
     This keeps the repeat detection accurate without any app-layer code.';


-- ============================================================
-- 20. HELPER FUNCTIONS
-- ============================================================

-- â”€â”€ Sequences for serial numbers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE SEQUENCE IF NOT EXISTS seq_complaint_number START 1 INCREMENT 1;
CREATE SEQUENCE IF NOT EXISTS seq_task_number      START 1 INCREMENT 1;
CREATE SEQUENCE IF NOT EXISTS seq_tender_number    START 1 INCREMENT 1;

-- â”€â”€ Generate complaint number: CRM-DEL-2025-001234 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_generate_complaint_number(
    p_city_code VARCHAR,
    p_year      INTEGER DEFAULT EXTRACT(YEAR FROM NOW())::INTEGER
)
RETURNS VARCHAR LANGUAGE sql AS $$
    SELECT 'CRM-' || UPPER(p_city_code) || '-' || p_year || '-'
           || LPAD(NEXTVAL('seq_complaint_number')::TEXT, 6, '0');
$$;

CREATE OR REPLACE FUNCTION fn_generate_task_number(
    p_city_code VARCHAR,
    p_year      INTEGER DEFAULT EXTRACT(YEAR FROM NOW())::INTEGER
)
RETURNS VARCHAR LANGUAGE sql AS $$
    SELECT 'TASK-' || UPPER(p_city_code) || '-' || p_year || '-'
           || LPAD(NEXTVAL('seq_task_number')::TEXT, 6, '0');
$$;

CREATE OR REPLACE FUNCTION fn_generate_tender_number(
    p_city_code VARCHAR,
    p_year      INTEGER DEFAULT EXTRACT(YEAR FROM NOW())::INTEGER
)
RETURNS VARCHAR LANGUAGE sql AS $$
    SELECT 'TND-' || UPPER(p_city_code) || '-' || p_year || '-'
           || LPAD(NEXTVAL('seq_tender_number')::TEXT, 6, '0');
$$;

-- â”€â”€ Resolve jurisdiction from PostGIS point â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Returns the most specific (smallest area) jurisdiction containing the point
CREATE OR REPLACE FUNCTION fn_resolve_jurisdiction(
    p_point   GEOMETRY(POINT, 4326),
    p_city_id UUID
)
RETURNS UUID LANGUAGE sql STABLE AS $$
    SELECT id
    FROM   jurisdictions
    WHERE  city_id = p_city_id
      AND  ST_Contains(boundary, p_point)
    ORDER  BY ST_Area(boundary::geography) ASC
    LIMIT  1;
$$;

COMMENT ON FUNCTION fn_resolve_jurisdiction IS
    'Called at complaint ingestion. Returns the most specific jurisdiction.
     A complaint in Lutyens Delhi (NDMC area) â†’ NDMC jurisdiction_id.
     Same complaint type 2km north (MCD area) â†’ MCD jurisdiction_id.
     Workflow template version is then selected by (infra_type + jurisdiction).';

-- â”€â”€ Find existing infra node for clustering â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_find_infra_node_for_cluster(
    p_point         GEOMETRY(POINT, 4326),
    p_infra_type_id UUID,
    p_city_id       UUID
)
RETURNS TABLE(infra_node_id UUID, distance_meters FLOAT) LANGUAGE sql STABLE AS $$
    SELECT  n.id,
            ST_Distance(n.location::geography, p_point::geography) AS distance_meters
    FROM    infra_nodes n
    JOIN    infra_types t ON t.id = n.infra_type_id
    WHERE   n.infra_type_id = p_infra_type_id
      AND   n.city_id       = p_city_id
      AND   n.status        != 'decommissioned'
      AND   ST_DWithin(n.location::geography, p_point::geography, t.cluster_radius_meters)
    ORDER   BY distance_meters ASC
    LIMIT   1;
$$;

COMMENT ON FUNCTION fn_find_infra_node_for_cluster IS
    'Called at ingestion. If result returned â†’ attach complaint to existing node.
     If no result â†’ create new infra_node then attach.
     cluster_radius_meters is per infra_type (road = larger, pole = smaller).';

-- â”€â”€ Repeat complaint check (core escalation logic) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_check_repeat_complaint(
    p_infra_node_id UUID
)
RETURNS TABLE(
    is_repeat               BOOLEAN,
    previous_resolved_at    TIMESTAMPTZ,
    gap_days                INTEGER,
    last_resolved_workflow_id UUID
) LANGUAGE sql STABLE AS $$
    SELECT
        CASE
            WHEN n.last_resolved_at IS NOT NULL
             AND NOW() - n.last_resolved_at
                 < (t.repeat_alert_years || ' years')::INTERVAL
            THEN TRUE
            ELSE FALSE
        END                             AS is_repeat,
        n.last_resolved_at              AS previous_resolved_at,
        CASE
            WHEN n.last_resolved_at IS NOT NULL
            THEN EXTRACT(DAY FROM NOW() - n.last_resolved_at)::INTEGER
            ELSE NULL
        END                             AS gap_days,
        n.last_resolved_workflow_id
    FROM    infra_nodes  n
    JOIN    infra_types  t ON t.id = n.infra_type_id
    WHERE   n.id = p_infra_node_id;
$$;

COMMENT ON FUNCTION fn_check_repeat_complaint IS
    'Called by INGESTION agent after infra_node is identified.
     If is_repeat = TRUE:
       SET complaints.priority               = ''critical''
       SET complaints.is_repeat_complaint    = TRUE
       SET complaints.repeat_previous_resolved_at = previous_resolved_at
       (repeat_gap_days is GENERATED STORED automatically)
       SET agent_priority_reason = "Same infrastructure reported again after
         X days. Previous resolution on [date]."
     Publish REPEAT_COMPLAINT_ESCALATED event to ps-crm-complaints Pub/Sub topic.
     Threshold comes from infra_types.repeat_alert_years (default 3 years).';

-- â”€â”€ Resolve best workflow template version â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_resolve_workflow_version(
    p_infra_type_id  UUID,
    p_jurisdiction_id UUID,
    p_city_id        UUID
)
RETURNS UUID LANGUAGE sql STABLE AS $$
    -- Priority: most specific (type + jurisdiction) â†’ type only â†’ city-wide
    SELECT  v.id
    FROM    workflow_template_versions v
    WHERE   v.city_id          = p_city_id
      AND   v.is_latest_version = TRUE
      AND   v.is_active         = TRUE
      AND   (v.infra_type_id   = p_infra_type_id   OR v.infra_type_id   IS NULL)
      AND   (v.jurisdiction_id = p_jurisdiction_id  OR v.jurisdiction_id IS NULL)
    ORDER BY
        -- Prefer exact type + exact jurisdiction match
        (v.infra_type_id   = p_infra_type_id)::INT   DESC,
        (v.jurisdiction_id = p_jurisdiction_id)::INT  DESC
    LIMIT 1;
$$;

COMMENT ON FUNCTION fn_resolve_workflow_version IS
    'Picks the most specific active workflow version for a new complaint.
     Road complaint in NDMC â†’ version with infra_type=ROAD + jurisdiction=NDMC.
     Road complaint in area with no specific version â†’ falls back to city-wide ROAD version.
     Called by WORKFLOW_ENGINE agent at workflow_instance creation.';

-- â”€â”€ Check if a step is blocked by active workflow constraints â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_is_step_constraint_blocked(
    p_work_type_codes   TEXT[],
    p_dept_code         VARCHAR,
    p_city_id           UUID,
    p_jurisdiction_id   UUID,
    p_check_date        DATE DEFAULT CURRENT_DATE
)
RETURNS TABLE(
    is_blocked      BOOLEAN,
    constraint_id   UUID,
    blocked_until   DATE,
    block_message   TEXT
) LANGUAGE sql STABLE AS $$
    SELECT
        TRUE,
        wc.id,
        CASE
            WHEN wc.is_recurring_annual THEN
                (DATE_TRUNC('year', p_check_date::TIMESTAMPTZ)
                 + MAKE_INTERVAL(
                     months => wc.end_month - 1,
                     days   => wc.end_day   - 1
                   ))::DATE
            ELSE wc.active_until
        END             AS blocked_until,
        wc.block_message
    FROM   workflow_constraints wc
    WHERE  wc.city_id   = p_city_id
      AND  wc.is_active = TRUE
      AND  (wc.jurisdiction_id IS NULL OR wc.jurisdiction_id = p_jurisdiction_id)
      AND  (wc.affected_dept_codes = '{}'
            OR p_dept_code = ANY(wc.affected_dept_codes))
      AND  (wc.affected_work_type_codes = '{}'
            OR p_work_type_codes && wc.affected_work_type_codes)
      AND  (
              (wc.is_recurring_annual = TRUE
               AND (EXTRACT(MONTH FROM p_check_date) > wc.start_month
                    OR (EXTRACT(MONTH FROM p_check_date) = wc.start_month
                        AND EXTRACT(DAY FROM p_check_date) >= wc.start_day))
               AND (EXTRACT(MONTH FROM p_check_date) < wc.end_month
                    OR (EXTRACT(MONTH FROM p_check_date) = wc.end_month
                        AND EXTRACT(DAY FROM p_check_date) <= wc.end_day))
              )
              OR
              (wc.is_recurring_annual = FALSE
               AND p_check_date BETWEEN wc.active_from AND wc.active_until)
           )
    ORDER BY wc.constraint_type
    LIMIT 1;
$$;

COMMENT ON FUNCTION fn_is_step_constraint_blocked IS
    'Called by WORKFLOW_ENGINE before unlocking any step.
     If is_blocked = TRUE:
       SET workflow_step_instances.status = ''constraint_blocked''
       SET constraint_block_id            = constraint_id
       SET legally_blocked_until          = blocked_until
       Publish STEP_CONSTRAINT_BLOCKED event to ps-crm-workflow topic
     block_message shown verbatim to officials and citizens in portal.';

-- â”€â”€ Get area notification subscribers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_get_area_subscribers(
    p_point         GEOMETRY(POINT, 4326),
    p_radius_meters INTEGER DEFAULT 5000
)
RETURNS TABLE(user_id UUID, preferred_channels TEXT[]) LANGUAGE sql STABLE AS $$
    SELECT  s.user_id, s.preferred_channels
    FROM    area_notification_subscriptions s
    JOIN    users u ON u.id = s.user_id
    WHERE   s.is_active  = TRUE
      AND   u.is_active  = TRUE
      AND   ST_DWithin(s.location::geography, p_point::geography, p_radius_meters);
$$;

-- â”€â”€ Create next monthly partition (called by Cloud Tasks) â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE FUNCTION fn_create_next_month_partitions(
    p_target_year  INTEGER,
    p_target_month INTEGER
)
RETURNS VOID LANGUAGE plpgsql AS $$
DECLARE
    v_start DATE;
    v_end   DATE;
    v_ym    TEXT;
BEGIN
    v_start := MAKE_DATE(p_target_year, p_target_month, 1);
    v_end   := v_start + INTERVAL '1 month';
    v_ym    := TO_CHAR(v_start, 'YYYY_MM');

    -- complaints
    EXECUTE format(
        'CREATE TABLE IF NOT EXISTS complaints_%s
         PARTITION OF complaints
         FOR VALUES FROM (%L) TO (%L)',
        v_ym, v_start, v_end
    );
    -- complaint_status_history (annual partitions are enough but monthly available)
    -- notification_logs
    EXECUTE format(
        'CREATE TABLE IF NOT EXISTS nl_%s
         PARTITION OF notification_logs
         FOR VALUES FROM (%L) TO (%L)',
        v_ym, v_start, v_end
    );
    -- pubsub_event_log
    EXECUTE format(
        'CREATE TABLE IF NOT EXISTS pel_%s
         PARTITION OF pubsub_event_log
         FOR VALUES FROM (%L) TO (%L)',
        v_ym, v_start, v_end
    );

    RAISE NOTICE 'Created partitions for %', v_ym;
END;
$$;

COMMENT ON FUNCTION fn_create_next_month_partitions IS
    'Called by Cloud Tasks CREATE_NEXT_PARTITION job on the 25th of each month.
     Creates the child partition for the following month across all partitioned tables.
     Idempotent (IF NOT EXISTS). Logs a NOTICE for Cloud Run log ingestion.';


-- ============================================================
-- 21. VIEWS
-- ============================================================
-- DROP first so CREATE OR REPLACE can freely change column layout.
-- CASCADE automatically drops any dependent views.
DROP VIEW IF EXISTS v_missing_embeddings            CASCADE;
DROP VIEW IF EXISTS v_posthoc_task_monitor          CASCADE;
DROP VIEW IF EXISTS v_repeat_complaint_alerts        CASCADE;
DROP VIEW IF EXISTS v_infra_hotspots                CASCADE;
DROP VIEW IF EXISTS v_override_reason_analytics     CASCADE;
DROP VIEW IF EXISTS v_workflow_version_activity     CASCADE;
DROP VIEW IF EXISTS v_active_workflow_constraints   CASCADE;
DROP VIEW IF EXISTS v_pending_surveys               CASCADE;
DROP VIEW IF EXISTS v_contractor_kpi                CASCADE;
DROP VIEW IF EXISTS v_admin_kpi_dashboard           CASCADE;
DROP VIEW IF EXISTS v_official_task_dashboard       CASCADE;
DROP VIEW IF EXISTS v_citizen_complaint_detail      CASCADE;
DROP VIEW IF EXISTS v_public_complaint_map          CASCADE;

-- â”€â”€ 21.1 Public Complaint Map â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Citizen portal + public dashboard map. No PII.
CREATE OR REPLACE VIEW v_public_complaint_map AS
SELECT
    c.id,
    c.complaint_number,
    c.title,
    c.status,
    c.priority,
    c.is_repeat_complaint,
    c.repeat_gap_days,
    ST_AsGeoJSON(c.location)::JSONB                    AS location_geojson,
    c.address_text,
    c.created_at,
    c.resolved_at,
    it.name                                            AS infra_type,
    it.code                                            AS infra_type_code,
    it.icon_url,
    j.name                                             AS jurisdiction_name,
    j.jurisdiction_type,
    wi.current_step_number,
    wi.total_steps,
    CASE WHEN wi.total_steps > 0
         THEN ROUND(wi.current_step_number::NUMERIC / wi.total_steps * 100, 1)
         ELSE 0
    END                                                AS progress_pct,
    wi.status                                          AS workflow_status,
    wi.blocked_until,
    cc.complaint_count                                 AS cluster_complaint_count
FROM        complaints            c
LEFT JOIN   infra_nodes           n   ON n.id  = c.infra_node_id
LEFT JOIN   infra_types           it  ON it.id = n.infra_type_id
LEFT JOIN   jurisdictions         j   ON j.id  = c.jurisdiction_id
LEFT JOIN   workflow_instances    wi  ON wi.id = c.workflow_instance_id
LEFT JOIN   complaint_clusters    cc  ON cc.infra_node_id = c.infra_node_id
WHERE  c.status NOT IN ('rejected', 'closed');

COMMENT ON VIEW v_public_complaint_map IS
    'Read-only, no PII. Powers the public map on the citizen portal.
     is_repeat_complaint + repeat_gap_days surfaced as a badge:
     "âš  Same issue reported again after X days."
     Filter by geography at app layer: WHERE ST_DWithin(location, :user_point, 5000).';

-- â”€â”€ 21.2 Citizen Complaint Detail â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_citizen_complaint_detail AS
SELECT
    c.id,
    c.complaint_number,
    c.citizen_id,
    c.title,
    c.description,
    c.status,
    c.priority,
    c.images,
    c.voice_recording_url,
    ST_AsGeoJSON(c.location)::JSONB                    AS location_geojson,
    c.address_text,
    c.agent_summary,
    c.is_repeat_complaint,
    c.repeat_gap_days,
    c.repeat_previous_resolved_at,
    c.is_recomplaint,
    c.parent_complaint_id,
    c.created_at,
    c.resolved_at,
    cc.complaint_count                                 AS cluster_complaint_count,
    wi.status                                          AS workflow_status,
    wi.current_step_number,
    wi.total_steps,
    CASE WHEN wi.total_steps > 0
         THEN ROUND(wi.current_step_number::NUMERIC / wi.total_steps * 100, 1)
         ELSE 0
    END                                                AS progress_pct,
    wi.blocked_until,
    it.name                                            AS infra_type,
    d_step.name                                        AS current_dept_name,
    -- Constraint block message (shown to citizen if step is blocked)
    wc.block_message                                   AS current_block_message,
    latest_task.assigned_worker_name,
    latest_task.assigned_contractor_name,
    latest_task.task_status
FROM        complaints            c
LEFT JOIN   complaint_cluster_members ccm ON ccm.complaint_id = c.id
LEFT JOIN   complaint_clusters        cc  ON cc.id = ccm.cluster_id
LEFT JOIN   workflow_instances        wi  ON wi.id = c.workflow_instance_id
LEFT JOIN   workflow_step_instances   wsi ON wsi.workflow_instance_id = wi.id
                                         AND wsi.step_number = wi.current_step_number
LEFT JOIN   departments               d_step ON d_step.id = wsi.department_id
LEFT JOIN   workflow_constraints      wc  ON wc.id = wsi.constraint_block_id
LEFT JOIN   infra_nodes               n   ON n.id  = c.infra_node_id
LEFT JOIN   infra_types               it  ON it.id = n.infra_type_id
LEFT JOIN LATERAL (
    SELECT
        wu.full_name     AS assigned_worker_name,
        ctr.company_name AS assigned_contractor_name,
        t.status         AS task_status
    FROM   tasks   t
    LEFT JOIN workers     w   ON w.id  = t.assigned_worker_id
    LEFT JOIN users       wu  ON wu.id = w.user_id
    LEFT JOIN contractors ctr ON ctr.id = t.assigned_contractor_id
    WHERE  t.complaint_id = c.id
    ORDER  BY t.created_at DESC
    LIMIT  1
) latest_task ON TRUE;

-- â”€â”€ 21.3 Official Task Dashboard â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_official_task_dashboard AS
SELECT
    t.id                                               AS task_id,
    t.task_number,
    t.title                                            AS task_title,
    t.status                                           AS task_status,
    t.priority,
    t.due_at,
    t.started_at,
    t.completed_at,
    t.agent_summary,
    t.before_photos,
    t.after_photos,
    t.progress_photos,
    -- Complaint context
    c.complaint_number,
    c.description                                      AS complaint_description,
    ST_AsGeoJSON(c.location)::JSONB                    AS location_geojson,
    c.address_text,
    c.agent_summary                                    AS complaint_agent_summary,
    c.agent_priority_reason,
    c.status                                           AS complaint_status,
    c.is_repeat_complaint,
    c.repeat_gap_days,
    -- Department
    d.name                                             AS department_name,
    d.code                                             AS department_code,
    -- Assignment
    t.assigned_official_id,
    wu.full_name                                       AS worker_name,
    ctr.company_name                                   AS contractor_name,
    -- Override
    t.override_reason_code,
    t.override_notes,
    t.override_at,
    -- Workflow position
    wsi.step_number,
    wi.total_steps,
    wsi.status                                         AS step_status,
    wsi.expected_completion_at,
    wsi.legally_blocked_until,
    wc_block.block_message                             AS step_block_message
FROM        tasks                 t
LEFT JOIN   complaints            c   ON c.id   = t.complaint_id
JOIN        departments           d   ON d.id   = t.department_id
LEFT JOIN   workers               w   ON w.id   = t.assigned_worker_id
LEFT JOIN   users                 wu  ON wu.id  = w.user_id
LEFT JOIN   contractors           ctr ON ctr.id = t.assigned_contractor_id
LEFT JOIN   workflow_step_instances wsi ON wsi.id = t.workflow_step_instance_id
LEFT JOIN   workflow_instances    wi  ON wi.id  = wsi.workflow_instance_id
LEFT JOIN   workflow_constraints  wc_block ON wc_block.id = wsi.constraint_block_id;

-- â”€â”€ 21.4 Admin KPI Dashboard â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_admin_kpi_dashboard AS
SELECT
    ops.snapshot_date,
    ops.official_id,
    u.full_name                                        AS official_name,
    d.name                                             AS department_name,
    d.code                                             AS department_code,
    j.name                                             AS jurisdiction_name,
    ops.tasks_assigned,
    ops.tasks_completed,
    ops.tasks_overdue,
    ops.avg_resolution_hours,
    ops.avg_survey_rating,
    ops.override_count,
    ops.override_reason_breakdown,
    ops.complaints_handled,
    ops.emergency_bypasses,
    ops.posthoc_tasks_pending,
    CASE WHEN ops.tasks_assigned > 0
         THEN ROUND(ops.tasks_completed::NUMERIC / ops.tasks_assigned * 100, 1)
         ELSE 0
    END                                                AS completion_rate_pct
FROM        official_performance_snapshots ops
JOIN        users        u ON u.id  = ops.official_id
LEFT JOIN   departments  d ON d.id  = ops.department_id
LEFT JOIN   jurisdictions j ON j.id = u.jurisdiction_id;

-- â”€â”€ 21.5 Contractor KPI â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_contractor_kpi AS
SELECT
    cps.snapshot_date,
    cps.contractor_id,
    ctr.company_name,
    ctr.registration_number,
    ctr.performance_score                              AS lifetime_score,
    ctr.is_blacklisted,
    cps.tasks_completed,
    cps.tasks_overdue,
    cps.avg_completion_hours,
    cps.avg_survey_rating,
    cps.tenders_won,
    cps.tenders_applied,
    CASE WHEN cps.tenders_applied > 0
         THEN ROUND(cps.tenders_won::NUMERIC / cps.tenders_applied * 100, 1)
         ELSE 0
    END                                                AS tender_win_rate_pct
FROM   contractor_performance_snapshots cps
JOIN   contractors                      ctr ON ctr.id = cps.contractor_id;

-- â”€â”€ 21.6 Pending Surveys (agent poll) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_pending_surveys AS
SELECT
    si.id,
    si.survey_type,
    si.target_user_id,
    si.target_role,
    si.channel,
    si.triggered_at,
    si.expires_at,
    c.complaint_number,
    u.full_name     AS recipient_name,
    u.email,
    u.phone,
    u.preferred_language,
    u.twilio_opt_in,
    u.email_opt_in
FROM        survey_instances si
LEFT JOIN   complaints        c  ON c.id  = si.complaint_id
JOIN        users             u  ON u.id  = si.target_user_id
WHERE  si.status = 'pending'
  AND  (si.expires_at IS NULL OR si.expires_at > NOW());

-- â”€â”€ 21.7 Active Workflow Constraints â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_active_workflow_constraints AS
SELECT
    wc.id,
    wc.city_id,
    ci.name                                            AS city_name,
    wc.jurisdiction_id,
    j.name                                             AS jurisdiction_name,
    wc.name                                            AS constraint_name,
    wc.constraint_type,
    wc.affected_dept_codes,
    wc.affected_work_type_codes,
    wc.block_message,
    wc.legal_reference,
    CASE
        WHEN wc.is_recurring_annual THEN
            (DATE_TRUNC('year', NOW())
             + MAKE_INTERVAL(months => wc.end_month - 1, days => wc.end_day - 1)
            )::DATE
        ELSE wc.active_until
    END                                                AS active_until
FROM        workflow_constraints wc
JOIN        cities               ci ON ci.id = wc.city_id
LEFT JOIN   jurisdictions        j  ON j.id  = wc.jurisdiction_id
WHERE  wc.is_active = TRUE
  AND  (
          (wc.is_recurring_annual = TRUE
           AND (EXTRACT(MONTH FROM NOW()) > wc.start_month
                OR (EXTRACT(MONTH FROM NOW()) = wc.start_month
                    AND EXTRACT(DAY FROM NOW()) >= wc.start_day))
           AND (EXTRACT(MONTH FROM NOW()) < wc.end_month
                OR (EXTRACT(MONTH FROM NOW()) = wc.end_month
                    AND EXTRACT(DAY FROM NOW()) <= wc.end_day))
          )
          OR
          (wc.is_recurring_annual = FALSE
           AND CURRENT_DATE BETWEEN wc.active_from AND wc.active_until)
       );

-- â”€â”€ 21.8 Workflow Version Activity â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_workflow_version_activity AS
SELECT
    wt.id                                              AS template_id,
    wt.name                                            AS template_name,
    v.id                                               AS version_id,
    v.version,
    v.is_latest_version,
    v.is_active,
    v.created_at                                       AS version_created_at,
    it.name                                            AS infra_type,
    j.name                                             AS jurisdiction_name,
    COUNT(wi.id)                                       AS total_instances,
    COUNT(wi.id) FILTER (WHERE wi.status = 'active')           AS active_instances,
    COUNT(wi.id) FILTER (WHERE wi.status = 'completed')        AS completed_instances,
    COUNT(wi.id) FILTER (WHERE wi.status = 'constraint_blocked') AS blocked_instances,
    CASE WHEN COUNT(wi.id) FILTER (WHERE wi.status = 'active') = 0
         THEN TRUE ELSE FALSE
    END                                                AS safe_to_archive
FROM        workflow_template_versions v
JOIN        workflow_templates         wt ON wt.id = v.template_id
LEFT JOIN   infra_types                it ON it.id = v.infra_type_id
LEFT JOIN   jurisdictions              j  ON j.id  = v.jurisdiction_id
LEFT JOIN   workflow_instances         wi ON wi.version_id = v.id
GROUP BY    wt.id, wt.name, v.id, v.version, v.is_latest_version,
            v.is_active, v.created_at, it.name, j.name
ORDER BY    wt.name, v.version DESC;

-- â”€â”€ 21.9 Override Reason Analytics â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_override_reason_analytics AS
SELECT
    t.assigned_official_id                             AS official_id,
    u.full_name                                        AS official_name,
    d.name                                             AS department_name,
    t.override_reason_code,
    COUNT(*)                                           AS override_count,
    DATE_TRUNC('month', t.override_at)                 AS month
FROM   tasks  t
JOIN   users       u ON u.id = t.assigned_official_id
JOIN   departments d ON d.id = t.department_id
WHERE  t.override_reason_code IS NOT NULL
  AND  t.override_at IS NOT NULL
GROUP  BY t.assigned_official_id, u.full_name, d.name, t.override_reason_code, DATE_TRUNC('month', t.override_at)
ORDER  BY DATE_TRUNC('month', t.override_at) DESC, COUNT(*) DESC;

-- â”€â”€ 21.10 Infra Hotspots â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_infra_hotspots AS
SELECT
    n.id                                               AS infra_node_id,
    n.name                                             AS infra_name,
    n.city_id,
    ci.name                                            AS city_name,
    n.jurisdiction_id,
    j.name                                             AS jurisdiction_name,
    it.name                                            AS infra_type,
    ST_AsGeoJSON(n.location)::JSONB                    AS location_geojson,
    n.total_complaint_count,
    n.total_resolved_count,
    n.last_resolved_at,
    n.status                                           AS infra_status,
    -- Complaints in last 90 days (rolling window)
    COUNT(c.id) FILTER (
        WHERE c.created_at >= NOW() - INTERVAL '90 days'
    )                                                  AS complaints_last_90d,
    -- Repeat complaint flag
    CASE WHEN n.last_resolved_at IS NOT NULL
              AND NOW() - n.last_resolved_at
                  < (it.repeat_alert_years || ' years')::INTERVAL
         THEN TRUE ELSE FALSE
    END                                                AS is_in_repeat_window,
    -- Latest health score
    ahl.health_score                                   AS latest_health_score
FROM        infra_nodes   n
JOIN        cities        ci  ON ci.id = n.city_id
LEFT JOIN   jurisdictions j   ON j.id  = n.jurisdiction_id
JOIN        infra_types   it  ON it.id = n.infra_type_id
LEFT JOIN   complaints    c   ON c.infra_node_id = n.id
LEFT JOIN LATERAL (
    SELECT health_score FROM asset_health_logs
    WHERE  infra_node_id = n.id
    ORDER  BY computed_at DESC
    LIMIT  1
) ahl ON TRUE
GROUP BY n.id, n.name, n.city_id, ci.name, n.jurisdiction_id, j.name,
         it.name, it.repeat_alert_years, n.location, n.total_complaint_count,
         n.total_resolved_count, n.last_resolved_at, n.status, ahl.health_score
ORDER BY complaints_last_90d DESC;

COMMENT ON VIEW v_infra_hotspots IS
    'Super admin + public dashboard: infrastructure ranked by complaint density.
     complaints_last_90d: rolling window for live hotspot detection.
     is_in_repeat_window: TRUE means ANY new complaint on this node will be critical.
     Combine with ST_DWithin at app layer for "worst infra near me" map queries.';

-- â”€â”€ 21.11 Repeat Complaint Alerts â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_repeat_complaint_alerts AS
SELECT
    c.id                                               AS complaint_id,
    c.complaint_number,
    c.city_id,
    ci.name                                            AS city_name,
    c.jurisdiction_id,
    j.name                                             AS jurisdiction_name,
    c.priority,
    c.status,
    c.created_at,
    c.repeat_gap_days,
    c.repeat_previous_resolved_at,
    -- Who resolved it last time
    prev_wi.id                                         AS prev_workflow_id,
    prev_official.full_name                            AS prev_responsible_official,
    prev_dept.name                                     AS prev_department_name,
    it.name                                            AS infra_type,
    n.name                                             AS infra_name,
    ST_AsGeoJSON(c.location)::JSONB                    AS location_geojson
FROM        complaints            c
JOIN        cities                ci  ON ci.id = c.city_id
LEFT JOIN   jurisdictions         j   ON j.id  = c.jurisdiction_id
LEFT JOIN   infra_nodes           n   ON n.id  = c.infra_node_id
LEFT JOIN   infra_types           it  ON it.id = n.infra_type_id
LEFT JOIN   workflow_instances    prev_wi ON prev_wi.id = n.last_resolved_workflow_id
LEFT JOIN   workflow_step_instances prev_wsi
                ON prev_wsi.workflow_instance_id = prev_wi.id
               AND prev_wsi.status = 'completed'
               AND prev_wsi.step_number = prev_wi.total_steps
LEFT JOIN   users                 prev_official ON prev_official.id = prev_wsi.assigned_official_id
LEFT JOIN   departments           prev_dept     ON prev_dept.id = prev_wsi.department_id
WHERE  c.is_repeat_complaint = TRUE
  AND  c.status NOT IN ('resolved', 'closed', 'rejected')
ORDER BY c.repeat_gap_days ASC;

COMMENT ON VIEW v_repeat_complaint_alerts IS
    'Super admin and admin dashboard widget: "Active repeat complaints."
     Shows who was responsible for the previous resolution â€” accountability trail.
     Sorted by gap_days ASC: shortest gap = worst repeat offenders first.
     Feed this into the agent PRIORITY_SCORER for automated escalation.';

-- â”€â”€ 21.12 Emergency Posthoc Task Monitor â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE OR REPLACE VIEW v_posthoc_task_monitor AS
SELECT
    ept.id,
    ept.workflow_instance_id,
    ept.complaint_id,
    ept.step_name,
    ept.documentation_type,
    ept.instructions,
    ept.is_mandatory,
    ept.status,
    ept.due_at,
    ept.emergency_bypass_at,
    EXTRACT(EPOCH FROM (ept.due_at - NOW()))/3600      AS hours_until_due,
    ept.due_at < NOW() AND ept.status = 'pending'      AS is_overdue,
    ept.completed_at,
    -- Assigned official
    u.full_name                                        AS assigned_official_name,
    d.name                                             AS department_name,
    -- Bypass context
    wi.emergency_bypass_log
FROM        emergency_posthoc_tasks  ept
JOIN        workflow_instances       wi  ON wi.id  = ept.workflow_instance_id
JOIN        departments              d   ON d.id   = ept.department_id
LEFT JOIN   users                    u   ON u.id   = ept.assigned_official_id
WHERE  ept.status IN ('pending', 'in_progress')
ORDER BY ept.due_at ASC;

COMMENT ON VIEW v_posthoc_task_monitor IS
    'Super admin dashboard: all pending posthoc documentation tasks after emergency bypasses.
     is_overdue = TRUE triggers a Cloud Tasks escalation to super_admin.
     hours_until_due allows color-coded urgency indicators in the UI.';


-- ============================================================
-- END OF SCHEMA â€” PS-CRM v3
-- ============================================================
--
-- TABLE SUMMARY (31 tables + 12 views + 10 functions + 3 sequences):
--
-- Reference:     cities, jurisdictions, workflow_constraints, departments, infra_types
-- Users:         users, contractors, workers
-- Infra:         infra_nodes, asset_health_logs
-- Complaints:    complaints*, complaint_status_history*, complaint_clusters,
--                complaint_cluster_members
-- Workflow:      workflow_templates, workflow_template_versions,
--                workflow_template_steps, workflow_instances,
--                workflow_step_instances
-- Tasks:         tasks, task_status_history*
-- Emergency:     emergency_posthoc_tasks
-- Tenders:       tenders
-- Surveys:       survey_templates, survey_instances, survey_responses
-- Notifications: notification_templates, notification_logs*, area_notification_subscriptions
-- GCP:           pubsub_event_log*, cloud_task_schedule
-- Agent:         agent_logs
-- Public:        public_announcements
-- KPI:           official_performance_snapshots, contractor_performance_snapshots
--
-- (* = range-partitioned by created_at)
--
-- GCP SERVICES WIRED IN:
--   Cloud SQL (PostgreSQL 15)   â€” this schema
--   GCP Identity Platform       â€” users.auth_uid
--   Cloud Storage (GCS)         â€” media URLs in JSONB columns
--   Cloud Pub/Sub               â€” pubsub_event_log (durable receipt)
--   Cloud Tasks                 â€” cloud_task_schedule (registry)
--   Cloud Run                   â€” workflow-engine, notification-service, agent-service
--   Cloud Scheduler             â€” nightly KPI + monthly partition creation
--   Firebase Cloud Messaging    â€” users.fcm_token (push)
--   Twilio                      â€” SMS + WhatsApp (notification_logs.external_message_id)
--   pgvector (extension)        â€” Nomic 768d embeddings on complaints
--   PostGIS (extension)         â€” all geometry + geography + GIST indexes
-- ============================================================


-- ============================================================
-- PART 2: CRITICAL FIXES (v3.1)
-- ============================================================

-- ============================================================
--  PS-CRM  |  CRITICAL FIXES DELTA  v3 â†’ v3.1
--  Apply on top of ps_crm_schema_v3.sql
--
--  Fixes:
--   FIX 1.  workflow_complaints junction table
--   FIX 2.  infra_node race condition (location_hash)
--   FIX 3.  workflow_step_dependencies (normalized)
--   FIX 4.  remove assignment from workflow_step_instances
--   FIX 5.  complaint_embeddings (separate table)
--   FIX 6.  task_sla table
--   FIX 7.  domain_events table
--   IMP A.  soft delete (complaints, infra_nodes, tasks)
--   IMP B.  workflow_status_history
--   IMP C.  geo index for survey_instances
-- ============================================================


-- ============================================================
-- FIX 1 â€” WORKFLOW â†” COMPLAINT JUNCTION TABLE
-- Problem: workflow is cluster-level, not complaint-level.
--          complaints.workflow_instance_id is a denormalized cache â€”
--          it does NOT represent the true 1-cluster:N-complaints mapping.
--          Under concurrency + clustering this becomes inconsistent.
-- ============================================================

CREATE TABLE workflow_complaints (
    workflow_instance_id    UUID        NOT NULL
                                REFERENCES workflow_instances(id) ON DELETE CASCADE,
    complaint_id            UUID        NOT NULL,
    -- When this complaint was attached to the workflow
    -- (may differ from complaint.created_at if clustering happened post-ingestion)
    attached_at             TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    -- Which agent action attached this complaint
    attached_by_agent_log_id UUID       REFERENCES agent_logs(id),
    PRIMARY KEY (workflow_instance_id, complaint_id)
);

CREATE INDEX idx_wc_complaint_id ON workflow_complaints(complaint_id);

COMMENT ON TABLE workflow_complaints IS
    'TRUE mapping between complaints and workflow instances.
     One workflow_instance maps to N complaints (the cluster).
     One complaint maps to exactly one workflow_instance (enforced at app layer).

     complaints.workflow_instance_id is kept as a denormalized read cache ONLY.
     All writes go through this table first.
     Read path for citizen portal: SELECT workflow_instance_id FROM workflow_complaints
       WHERE complaint_id = :id   â€” single row, indexed.
     Write path at clustering: INSERT INTO workflow_complaints after cluster resolves.

     attached_by_agent_log_id traces which CLUSTERING agent action created the link
     for full explainability.';


-- ============================================================
-- FIX 2 â€” INFRA NODE RACE CONDITION (location_hash)
-- Problem: two parallel ingestion requests within cluster_radius_meters
--          of each other both do ST_DWithin â†’ find nothing â†’ both INSERT
--          â†’ duplicate infra_nodes for the same physical asset.
-- ============================================================

ALTER TABLE infra_nodes
    ADD COLUMN location_hash TEXT;

-- Backfill for any existing rows (safe to run on empty DB):
UPDATE infra_nodes
   SET location_hash = ROUND(ST_Y(location::geometry)::NUMERIC, 5)::TEXT
                    || '_'
                    || ROUND(ST_X(location::geometry)::NUMERIC, 5)::TEXT
 WHERE location_hash IS NULL;

-- Unique constraint: same type cannot have two nodes at the same rounded coordinate
CREATE UNIQUE INDEX idx_unique_infra_hash
    ON infra_nodes(infra_type_id, location_hash);

COMMENT ON COLUMN infra_nodes.location_hash IS
    'Spatial deduplication key: ROUND(lat,5) || "_" || ROUND(lng,5).
     At 5 decimal places, resolution â‰ˆ 1.1 metres â€” well within any
     cluster_radius_meters value (minimum 10m in practice).
     Generated at app layer before INSERT. If INSERT fails on this unique index,
     the ingestion service retries with the existing node.

     Why app-layer generation rather than a DB-generated column:
     PostgreSQL GENERATED columns cannot call PostGIS functions.
     The ingestion Cloud Run service computes:
       hash = round(lat, 5).toString() + "_" + round(lng, 5).toString()
     then passes it in the INSERT. ON CONFLICT on this index â†’ use existing node.

     Race condition resolved: first writer wins, second writer gets the existing node.';

-- ============================================================
-- FIX 3 â€” WORKFLOW STEP DEPENDENCIES (normalized)
-- Problem: prerequisite_step_ids UUID[] has no FK integrity,
--          is painful to query (ANY()), and cannot be validated
--          at the DB level. Agents doing dependency checks need proper joins.
-- ============================================================

-- Drop the array column from template steps
ALTER TABLE workflow_template_steps
    DROP COLUMN IF EXISTS prerequisite_step_ids;

CREATE TABLE workflow_step_dependencies (
    step_id             UUID    NOT NULL
                            REFERENCES workflow_template_steps(id) ON DELETE CASCADE,
    depends_on_step_id  UUID    NOT NULL
                            REFERENCES workflow_template_steps(id) ON DELETE CASCADE,
    PRIMARY KEY (step_id, depends_on_step_id),
    -- A step cannot depend on itself
    CONSTRAINT chk_no_self_dependency CHECK (step_id != depends_on_step_id)
);

CREATE INDEX idx_wsd_depends_on ON workflow_step_dependencies(depends_on_step_id);

COMMENT ON TABLE workflow_step_dependencies IS
    'Normalized step prerequisite graph. Replaces prerequisite_step_ids UUID[].

     To check if step X is unblocked:
       SELECT COUNT(*) = 0 AS is_ready
       FROM   workflow_step_dependencies d
       JOIN   workflow_step_instances    si
              ON si.template_step_id = d.depends_on_step_id
             AND si.workflow_instance_id = :workflow_instance_id
       WHERE  d.step_id = :template_step_id
         AND  si.status != ''completed'';

     To get all steps that become unlockable when step Y completes:
       SELECT step_id FROM workflow_step_dependencies
       WHERE  depends_on_step_id = :completed_step_id;

     idx_wsd_depends_on enables this reverse lookup efficiently â€”
     used by WORKFLOW_ENGINE after every step completion to find next unlockable steps.

     Cyclic dependency prevention: enforced at application layer during template creation
     (walk the graph; reject if cycle detected). DB enforces no-self-dependency only.';


-- ============================================================
-- FIX 4 â€” REMOVE ASSIGNMENT FROM workflow_step_instances
-- Problem: assignment lives in BOTH tasks and workflow_step_instances
--          â†’ two sources of truth â†’ guaranteed drift.
-- Rule: tasks is the single source of truth for assignment.
--       workflow_step_instances tracks step lifecycle, not who is doing the work.
-- ============================================================

ALTER TABLE workflow_step_instances
    DROP COLUMN IF EXISTS assigned_worker_id,
    DROP COLUMN IF EXISTS assigned_contractor_id,
    DROP COLUMN IF EXISTS override_reason_code,
    DROP COLUMN IF EXISTS override_notes,
    DROP COLUMN IF EXISTS override_by,
    DROP COLUMN IF EXISTS override_at,
    DROP COLUMN IF EXISTS override_original_assignee;

-- Keep assigned_official_id â€” the official owns the step (routing/accountability).
-- Worker + contractor live exclusively in tasks.

COMMENT ON COLUMN workflow_step_instances.assigned_official_id IS
    'The official responsible for this step (routing and accountability).
     Worker and contractor assignment is in tasks ONLY â€” single source of truth.
     Override tracking (reason_code, override_by, etc.) lives in tasks only.';


-- ============================================================
-- FIX 5 â€” COMPLAINT EMBEDDINGS (separate table)
-- Problem: 768-dim vectors inside the partitioned complaints table
--          bloat partition size, slow sequential scans on non-vector queries,
--          and make cold-partition archiving messy.
-- Fix: separate table, one row per complaint, joined only when needed.
-- ============================================================

-- Remove vector columns from complaints
ALTER TABLE complaints
    DROP COLUMN IF EXISTS text_embedding,
    DROP COLUMN IF EXISTS image_embedding;

CREATE TABLE complaint_embeddings (
    complaint_id        UUID         NOT NULL,
    -- Nomic text-embedding-3 (768d) of translated_description
    text_embedding      vector(768),
    -- Nomic vision embedding of the first/primary complaint image
    image_embedding     vector(768),
    -- Which Nomic model version generated these (for future re-embedding)
    model_version       VARCHAR(100) NOT NULL DEFAULT 'nomic-embed-text-v1.5',
    embedded_at         TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    PRIMARY KEY (complaint_id)
    -- No FK to complaints: complaints is partitioned; cross-partition FKs unsupported.
    -- Referential integrity enforced at app layer.
);

-- IVFFlat indexes (moved here from complaints)
CREATE INDEX idx_ce_text_embed  ON complaint_embeddings
    USING ivfflat(text_embedding  vector_cosine_ops) WITH (lists = 100);
CREATE INDEX idx_ce_image_embed ON complaint_embeddings
    USING ivfflat(image_embedding vector_cosine_ops) WITH (lists = 100);

COMMENT ON TABLE complaint_embeddings IS
    'Separate embedding store. Joined only when semantic search is needed.
     Main complaints table stays lean â€” partition scans stay fast.

     Usage patterns:
       1. Duplicate detection at ingestion:
            SELECT complaint_id,
                   1 - (text_embedding <=> :new_embedding) AS similarity
            FROM   complaint_embeddings
            WHERE  text_embedding <=> :new_embedding < 0.15
            ORDER  BY text_embedding <=> :new_embedding
            LIMIT  5;

       2. Semantic cluster summary (agent reads N similar complaints):
            SELECT ce.complaint_id
            FROM   complaint_embeddings ce
            WHERE  ce.text_embedding <=> :cluster_centroid_embedding < 0.25;

       model_version allows targeted re-embedding when Nomic releases a new model
       (UPDATE complaint_embeddings SET ... WHERE model_version = old_version).

     Note: complaint_id has no FK constraint because complaints is partitioned.
     App layer must INSERT into complaint_embeddings immediately after complaint INSERT.
     A nightly Cloud Function checks for complaints missing embeddings and backfills.';


-- ============================================================
-- FIX 6 â€” SLA TRACKING TABLE
-- Problem: expected_duration_hours on the template is a planning field.
--          There is no runtime SLA tracking, no breach detection,
--          no escalation trigger source. KPI "overdue" counts are guesses.
-- ============================================================

CREATE TABLE task_sla (
    task_id             UUID         PRIMARY KEY REFERENCES tasks(id) ON DELETE CASCADE,
    sla_hours           INTEGER      NOT NULL,
    -- Set when task status â†’ accepted/in_progress
    started_at          TIMESTAMPTZ,
    due_at              TIMESTAMPTZ  NOT NULL,
    -- Breach
    is_breached         BOOLEAN      NOT NULL DEFAULT FALSE,
    breached_at         TIMESTAMPTZ,
    -- Warning sent at 75% of SLA elapsed
    warning_sent_at     TIMESTAMPTZ,
    -- Escalation chain (who was notified and when)
    -- [{notified_user_id, role, notified_at, channel}]
    escalation_log      JSONB        NOT NULL DEFAULT '[]',
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_sla_due_active ON task_sla(due_at)
    WHERE is_breached = FALSE;
CREATE INDEX idx_sla_breached   ON task_sla(breached_at)
    WHERE is_breached = TRUE;

COMMENT ON TABLE task_sla IS
    'Runtime SLA tracking per task. Created by Cloud Tasks when task is assigned.
     sla_hours = workflow_template_steps.expected_duration_hours (copied at task creation).

     Cloud Tasks jobs scheduled off this table:
       75% elapsed  â†’ task_type = SEND_DELAY_ALERT
                    â†’ warn official + notify citizens in 5km
                    â†’ log to escalation_log
       100% elapsed â†’ task_type = CHECK_OVERDUE_TASKS
                    â†’ SET is_breached = TRUE, breached_at = NOW()
                    â†’ escalate to admin
                    â†’ Pub/Sub event: TASK_SLA_BREACHED
                    â†’ feeds official_performance_snapshots.tasks_overdue

     Without this table:
       KPI "overdue" counts are computed from (NOW() > due_at) at query time â€”
       no history of when breach happened, no escalation audit, no chain of custody.
     With this table:
       Breach timestamp is immutable, escalation_log is append-only,
       and the KPI snapshot job has a clean source to read from.

     updated_at trigger added below.';

CREATE TRIGGER trg_task_sla_updated_at
    BEFORE UPDATE ON task_sla
    FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();


-- ============================================================
-- FIX 7 â€” DOMAIN EVENTS TABLE
-- Problem: pubsub_event_log is infrastructure plumbing â€” it tracks
--          Pub/Sub delivery mechanics. Agents should NOT read it.
--          Agents need clean domain semantics: "what happened to complaint X".
-- Rule: agents read domain_events; pubsub_event_log is for ops/infra.
-- ============================================================

CREATE TABLE domain_events (
    id              UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_type      VARCHAR(100) NOT NULL,
    -- Domain event types:
    --   COMPLAINT_RECEIVED        COMPLAINT_CLUSTERED       COMPLAINT_REPEAT_ESCALATED
    --   COMPLAINT_MAPPED          WORKFLOW_STARTED          WORKFLOW_COMPLETED
    --   WORKFLOW_EMERGENCY_BYPASS STEP_UNLOCKED             STEP_CONSTRAINT_BLOCKED
    --   STEP_COMPLETED            TASK_ASSIGNED             TASK_STARTED
    --   TASK_COMPLETED            TASK_SLA_BREACHED         TASK_OVERRIDDEN
    --   TENDER_SUBMITTED          TENDER_APPROVED           TENDER_AWARDED
    --   SURVEY_TRIGGERED          SURVEY_COMPLETED          POSTHOC_TASK_CREATED
    --   POSTHOC_TASK_OVERDUE      CONTRACTOR_BLACKLISTED    WORKFLOW_VERSION_ARCHIVED
    entity_type     VARCHAR(60)  NOT NULL,
    -- e.g. complaint | workflow_instance | task | infra_node | tender | survey
    entity_id       UUID         NOT NULL,
    -- Actor who caused the event (NULL = system/agent)
    actor_id        UUID         REFERENCES users(id),
    actor_type      VARCHAR(30),  -- user | agent | system | scheduler
    -- Lightweight payload â€” just the diff, not the full object
    -- e.g. {"old_status": "pending", "new_status": "in_progress", "reason": "..."}
    payload         JSONB        NOT NULL DEFAULT '{}',
    -- Correlation IDs for agent context chaining
    complaint_id    UUID,        -- always set when event relates to a complaint
    workflow_instance_id UUID    REFERENCES workflow_instances(id),
    city_id         UUID         REFERENCES cities(id),
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- BRIN: append-only, time-ordered
CREATE INDEX idx_de_created_brin    ON domain_events USING BRIN(created_at);
-- B-tree for agent queries: "all events for complaint X"
CREATE INDEX idx_de_entity          ON domain_events(entity_type, entity_id);
CREATE INDEX idx_de_complaint       ON domain_events(complaint_id)
    WHERE complaint_id IS NOT NULL;
CREATE INDEX idx_de_workflow        ON domain_events(workflow_instance_id)
    WHERE workflow_instance_id IS NOT NULL;
CREATE INDEX idx_de_event_type      ON domain_events(event_type);

COMMENT ON TABLE domain_events IS
    'Clean domain event log for agent consumption.
     Separate from pubsub_event_log (infrastructure) and agent_logs (agent actions).

     Three tables, three concerns:
       domain_events    â€” WHAT happened in the domain (agent reads this)
       pubsub_event_log â€” HOW it was transported (ops reads this)
       agent_logs       â€” WHAT the agent did about it (explainability reads this)

     Agent query pattern â€” "Give me the full timeline for complaint X":
       SELECT event_type, actor_type, payload, created_at
       FROM   domain_events
       WHERE  complaint_id = :id
       ORDER  BY created_at ASC;

     Agent query pattern â€” "What changed in this workflow in the last hour":
       SELECT event_type, entity_id, payload, created_at
       FROM   domain_events
       WHERE  workflow_instance_id = :id
         AND  created_at > NOW() - INTERVAL ''1 hour''
       ORDER  BY created_at ASC;

     Payload is intentionally minimal (just the diff).
     Full object state is always reconstructed from the domain tables.
     This keeps domain_events fast to write and cheap to scan.';


-- ============================================================
-- IMPROVEMENT A â€” SOFT DELETE
-- Add is_deleted to complaints, infra_nodes, tasks.
-- Never hard-delete civic records â€” audit requirements.
-- ============================================================

ALTER TABLE complaints
    ADD COLUMN IF NOT EXISTS is_deleted         BOOLEAN      NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS deleted_at         TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS deleted_by         UUID         REFERENCES users(id),
    ADD COLUMN IF NOT EXISTS deletion_reason    TEXT;

ALTER TABLE infra_nodes
    ADD COLUMN IF NOT EXISTS is_deleted         BOOLEAN      NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS deleted_at         TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS deleted_by         UUID         REFERENCES users(id),
    ADD COLUMN IF NOT EXISTS deletion_reason    TEXT;

ALTER TABLE tasks
    ADD COLUMN IF NOT EXISTS is_deleted         BOOLEAN      NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS deleted_at         TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS deleted_by         UUID         REFERENCES users(id),
    ADD COLUMN IF NOT EXISTS deletion_reason    TEXT;

-- Partial indexes: active records (the 99% query path) never touch deleted rows
CREATE INDEX idx_complaints_active  ON complaints(city_id, status, created_at)
    WHERE is_deleted = FALSE;
CREATE INDEX idx_infra_nodes_active ON infra_nodes(city_id, infra_type_id)
    WHERE is_deleted = FALSE;
CREATE INDEX idx_tasks_active       ON tasks(assigned_official_id, status)
    WHERE is_deleted = FALSE;

COMMENT ON COLUMN complaints.is_deleted IS
    'Soft delete only. Hard deletes are prohibited â€” civic records are permanent.
     Deleted complaints are excluded from all views (WHERE is_deleted = FALSE).
     deleted_by + deletion_reason are mandatory at app layer for super_admin deletes.
     Only super_admin role can soft-delete. Regular users get status = rejected instead.';


-- ============================================================
-- IMPROVEMENT B â€” WORKFLOW STATUS HISTORY
-- Problem: step-level history exists but workflow-level transitions
--          (active â†’ paused â†’ emergency_bypassed â†’ completed) are invisible.
--          Super admin audit requires full workflow lifecycle trail.
-- ============================================================

CREATE TABLE workflow_status_history (
    id                      UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    workflow_instance_id    UUID         NOT NULL
                                REFERENCES workflow_instances(id) ON DELETE CASCADE,
    old_status              VARCHAR(30),
    new_status              VARCHAR(30)  NOT NULL,
    -- Who triggered this transition (NULL = system/agent)
    changed_by              UUID         REFERENCES users(id),
    change_source           VARCHAR(30)  NOT NULL DEFAULT 'system'
                                CHECK (change_source IN (
                                    'system',    -- automated workflow engine
                                    'agent',     -- AI agent action
                                    'official',  -- manual official action
                                    'admin',     -- admin override
                                    'super_admin'
                                )),
    reason                  TEXT,
    -- Snapshot of key state at transition time
    -- {current_step, mode, total_steps, active_constraint_id, bypass_reason}
    state_snapshot          JSONB        NOT NULL DEFAULT '{}',
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_wsh_workflow   ON workflow_status_history(workflow_instance_id);
CREATE INDEX idx_wsh_created    ON workflow_status_history USING BRIN(created_at);

COMMENT ON TABLE workflow_status_history IS
    'Immutable audit trail for workflow-level status transitions.
     Answers: "When did this workflow go into emergency mode, and who triggered it?"
     change_source distinguishes system automation from human decisions.
     state_snapshot captures current_step + mode at transition time
     so the audit is self-contained (no joins needed for historical reconstruction).

     Auto-populated by trigger fn_log_workflow_status_change() below.';

-- Trigger: auto-log every workflow status transition
CREATE OR REPLACE FUNCTION fn_log_workflow_status_change()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO workflow_status_history (
            workflow_instance_id,
            old_status,
            new_status,
            change_source,
            state_snapshot
        ) VALUES (
            NEW.id,
            OLD.status,
            NEW.status,
            'system',   -- app layer can UPDATE this row's change_source post-insert
            jsonb_build_object(
                'current_step', NEW.current_step_number,
                'total_steps',  NEW.total_steps,
                'mode',         NEW.mode,
                'is_emergency', NEW.is_emergency
            )
        );
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_workflow_status_history
    AFTER UPDATE ON workflow_instances
    FOR EACH ROW EXECUTE FUNCTION fn_log_workflow_status_change();

COMMENT ON TRIGGER trg_workflow_status_history ON workflow_instances IS
    'Fires on every status change. change_source defaults to "system".
     The app service should UPDATE workflow_status_history SET change_source = ''official'',
     changed_by = :user_id, reason = :reason WHERE id = lastval()
     immediately after the workflow UPDATE, within the same transaction.';


-- ============================================================
-- IMPROVEMENT C â€” GEO INDEX FOR SURVEY INSTANCES
-- Needed for: "send survey to all citizens within 5km who are
-- affected by this workflow" â€” a geo-fenced survey dispatch.
-- ============================================================

-- Add location column to survey_instances (point of the related complaint/infra_node)
ALTER TABLE survey_instances
    ADD COLUMN IF NOT EXISTS related_location GEOMETRY(POINT, 4326);

CREATE INDEX idx_si_location ON survey_instances USING GIST(related_location)
    WHERE related_location IS NOT NULL;

COMMENT ON COLUMN survey_instances.related_location IS
    'Location of the related infra_node/complaint. Copied at survey creation.
     Enables geo-fenced survey dispatch:
       SELECT si.id, si.target_user_id
       FROM   survey_instances si
       WHERE  ST_DWithin(si.related_location::geography, :area_center::geography, 5000)
         AND  si.status = ''pending'';
     Also used to show citizens a map pin: "This survey is about work near you."';


-- ============================================================
-- SUMMARY OF CHANGES
-- ============================================================
--
-- NEW TABLES:
--   workflow_complaints           FIX 1 â€” true N-complaint:1-workflow mapping
--   workflow_step_dependencies    FIX 3 â€” normalized step dependency graph
--   complaint_embeddings          FIX 5 â€” embeddings decoupled from complaint partitions
--   task_sla                      FIX 6 â€” runtime SLA tracking + breach detection
--   domain_events                 FIX 7 â€” clean event log for agent consumption
--   workflow_status_history       IMP B â€” workflow lifecycle audit trail
--
-- MODIFIED TABLES:
--   infra_nodes          +location_hash (FIX 2) +is_deleted/deleted_at/by/reason (IMP A)
--   workflow_template_steps  -prerequisite_step_ids (replaced by workflow_step_dependencies)
--   workflow_step_instances  -assigned_worker_id -assigned_contractor_id
--                            -override_reason_code -override_notes -override_by
--                            -override_at -override_original_assignee (FIX 4)
--   complaints           -text_embedding -image_embedding (FIX 5)
--                        +is_deleted/deleted_at/by/reason (IMP A)
--   tasks                +is_deleted/deleted_at/by/reason (IMP A)
--   survey_instances     +related_location GEOMETRY (IMP C)
--
-- NEW INDEXES:
--   idx_unique_infra_hash (UNIQUE â€” race condition prevention)
--   idx_wc_complaint_id
--   idx_wsd_depends_on
--   idx_ce_text_embed / idx_ce_image_embed (moved from complaints)
--   idx_sla_due_active / idx_sla_breached
--   idx_de_* (5 domain_events indexes)
--   idx_complaints_active / idx_infra_nodes_active / idx_tasks_active (partial, soft-delete)
--   idx_wsh_workflow / idx_wsh_created
--   idx_si_location (GIST â€” geo survey dispatch)
--
-- NEW TRIGGERS:
--   trg_task_sla_updated_at
--   trg_workflow_status_history
--
-- PATCHED VIEWS:
--   v_public_complaint_map     (uses workflow_complaints junction + is_deleted filter)
--   v_official_task_dashboard  (uses workflow_complaints + task_sla SLA columns + is_deleted)
-- ============================================================


-- ============================================================
-- PART 3: FINAL FIXES (v3.2)
-- ============================================================

-- ============================================================
--  PS-CRM  |  FINAL CRITICAL CHECKS DELTA  v3.1 â†’ v3.2
--  Apply on top of:
--    1. ps_crm_schema_v3.sql
--    2. ps_crm_critical_fixes_v3_1.sql
--
--  Changes:
--   FIX 1. UNIQUE on workflow_complaints(complaint_id)
--   FIX 2. location_hash â†’ geohash(precision=8)
--   FIX 3. Atomic ingestion transaction pattern (documented + enforced via function)
--   FIX 4. Embedding pipeline: guaranteed text + image embeddings per complaint
-- ============================================================


-- ============================================================
-- FIX 1 â€” UNIQUE CONSTRAINT: one complaint â†’ one workflow
-- Problem: "enforced at app layer" is not enough under concurrency.
--          Two parallel requests could both INSERT the same complaint_id
--          into workflow_complaints before either COMMITs.
-- ============================================================

-- This is a single-column unique index, not the composite PK.
-- The PK (workflow_instance_id, complaint_id) allows the same complaint
-- to appear under multiple workflows â€” which must NEVER happen.
-- This index closes that gap.
CREATE UNIQUE INDEX idx_unique_complaint_workflow
    ON workflow_complaints(complaint_id);

COMMENT ON INDEX idx_unique_complaint_workflow IS
    'Guarantees one complaint maps to exactly one workflow_instance.
     The composite PK alone does not prevent one complaint_id appearing
     under two different workflow_instance_ids.
     This index makes that impossible at the DB layer â€” no app-layer trust needed.
     ON CONFLICT on this index during clustering â†’ use existing workflow_instance_id.';


-- ============================================================
-- FIX 2 â€” location_hash â†’ geohash(precision=8)
-- Problem: ROUND(lat,5)_ROUND(lng,5) = ~1.1m resolution.
--          Two different physical assets legitimately 2m apart
--          but of the same infra_type get the same hash â†’ false collision.
--          geohash(precision=8) = ~38m Ã— 19m cell â€” large enough to
--          deduplicate the same asset, small enough not to collapse
--          distinct assets into one node.
--
-- Note: PostGIS provides ST_GeoHash() natively â€” no extension needed.
-- ============================================================

-- Drop the old index before changing the column semantics
DROP INDEX IF EXISTS idx_unique_infra_hash;

-- Recompute location_hash for all existing rows using ST_GeoHash
UPDATE infra_nodes
   SET location_hash = ST_GeoHash(location::geometry, 8)
 WHERE location IS NOT NULL;

-- Recreate the unique index on the new hash values
CREATE UNIQUE INDEX idx_unique_infra_hash
    ON infra_nodes(infra_type_id, location_hash);

COMMENT ON COLUMN infra_nodes.location_hash IS
    'ST_GeoHash(location, 8) â€” geohash at precision 8 = ~38m Ã— 19m cell.
     Why precision 8:
       precision 6 = ~1.2km Ã— 0.6km  (too coarse: collapses distinct assets)
       precision 7 = ~150m Ã— 150m    (borderline for cluster_radius_meters=50)
       precision 8 = ~38m Ã— 19m      (fits inside cluster_radius_meters; still deduplicates)
       precision 9 = ~5m Ã— 5m        (too fine: same asset GPS jitter = new node)

     Generated at app layer (Cloud Run ingestion service):
       import geohash  # Python: python-geohash
       hash = geohash.encode(lat, lng, precision=8)
     OR directly in SQL: ST_GeoHash(ST_SetSRID(ST_Point(lng,lat),4326), 8)

     ON CONFLICT on (infra_type_id, location_hash) â†’ use existing infra_node.
     Race condition fully resolved: first writer wins, concurrent writers
     get the existing node via the unique index conflict.';


-- ============================================================
-- FIX 3 â€” ATOMIC INGESTION TRANSACTION
-- The ingestion transaction is the most critical write path in the system.
-- A partial write leaves orphan complaints, broken cluster mappings,
-- and missing embeddings. ALL six steps must succeed or ALL roll back.
--
-- This function encapsulates the full ingestion contract.
-- The Cloud Run ingestion service calls ONLY this function â€” never
-- individual INSERTs â€” for new complaint creation.
-- ============================================================

CREATE OR REPLACE FUNCTION fn_ingest_complaint(
    -- â”€â”€ Citizen + City â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    p_citizen_id            UUID,
    p_city_id               UUID,
    p_city_code             VARCHAR,

    -- â”€â”€ Content â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    p_title                 VARCHAR(500),
    p_description           TEXT,
    p_original_language     VARCHAR(10),
    p_translated_description TEXT,

    -- â”€â”€ Location â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    p_lat                   DOUBLE PRECISION,
    p_lng                   DOUBLE PRECISION,
    p_address_text          TEXT,

    -- â”€â”€ Media â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    p_images                JSONB,          -- [{url, gcs_path, mime_type, ...}]
    p_voice_recording_url   TEXT,
    p_voice_transcript      TEXT,

    -- â”€â”€ Infrastructure â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    p_infra_type_id         UUID,
    p_infra_name            VARCHAR(400),   -- optional; agent-generated

    -- â”€â”€ Embeddings (computed by Cloud Run before calling this fn) â”€â”€
    p_text_embedding        vector(768),
    p_image_embedding       vector(768),    -- NULL if no image submitted
    p_embedding_model       VARCHAR(100)    DEFAULT 'nomic-embed-text-v1.5',

    -- â”€â”€ Priority / Agent â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    p_priority              VARCHAR(20)     DEFAULT 'normal',
    p_agent_summary         TEXT            DEFAULT NULL,
    p_agent_priority_reason TEXT            DEFAULT NULL,
    p_agent_suggested_dept_ids UUID[]       DEFAULT '{}'
)
RETURNS TABLE(
    complaint_id            UUID,
    complaint_number        VARCHAR,
    infra_node_id           UUID,
    workflow_instance_id    UUID,
    is_new_infra_node       BOOLEAN,
    is_repeat_complaint     BOOLEAN,
    repeat_gap_days         INTEGER,
    jurisdiction_id         UUID
)
LANGUAGE plpgsql AS $$
DECLARE
    v_complaint_id          UUID    := uuid_generate_v4();
    v_complaint_number      VARCHAR;
    v_point                 GEOMETRY(POINT, 4326);
    v_jurisdiction_id       UUID;
    v_infra_node_id         UUID;
    v_location_hash         TEXT;
    v_is_new_node           BOOLEAN := FALSE;
    v_workflow_instance_id  UUID;
    v_is_repeat             BOOLEAN := FALSE;
    v_prev_resolved_at      TIMESTAMPTZ;
    v_gap_days              INTEGER;
    v_last_wf_id            UUID;
    v_final_priority        VARCHAR(20);
    v_repeat_prev_complaint UUID;
BEGIN
    -- â”€â”€ STEP 0: build geometry â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    v_point := ST_SetSRID(ST_MakePoint(p_lng, p_lat), 4326);

    -- â”€â”€ STEP 1: resolve jurisdiction â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    v_jurisdiction_id := fn_resolve_jurisdiction(v_point, p_city_id);

    -- â”€â”€ STEP 2: find or create infra_node (race-safe) â”€â”€â”€â”€â”€â”€â”€â”€
    v_location_hash := ST_GeoHash(v_point, 8);

    -- Try to find existing node by geohash first (fastest path)
    SELECT id INTO v_infra_node_id
    FROM   infra_nodes
    WHERE  infra_type_id  = p_infra_type_id
      AND  location_hash  = v_location_hash
      AND  is_deleted     = FALSE
    LIMIT  1;

    -- If not found by hash, try spatial proximity
    IF v_infra_node_id IS NULL THEN
        SELECT infra_node_id INTO v_infra_node_id
        FROM   fn_find_infra_node_for_cluster(v_point, p_infra_type_id, p_city_id);
    END IF;

    -- If still not found, create a new node
    IF v_infra_node_id IS NULL THEN
        INSERT INTO infra_nodes (
            city_id, jurisdiction_id, infra_type_id,
            name, location, location_hash, status
        )
        VALUES (
            p_city_id, v_jurisdiction_id, p_infra_type_id,
            p_infra_name, v_point, v_location_hash, 'damaged'
        )
        ON CONFLICT (infra_type_id, location_hash)
            DO UPDATE SET updated_at = NOW()  -- no-op update to return id
        RETURNING id INTO v_infra_node_id;

        v_is_new_node := TRUE;

        -- Update total_complaint_count on new node
        UPDATE infra_nodes
           SET total_complaint_count = total_complaint_count + 1
         WHERE id = v_infra_node_id;
    ELSE
        -- Increment complaint count on existing node
        UPDATE infra_nodes
           SET total_complaint_count = total_complaint_count + 1,
               status = CASE WHEN status = 'operational' THEN 'damaged' ELSE status END
         WHERE id = v_infra_node_id;
    END IF;

    -- â”€â”€ STEP 3: repeat complaint check â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    SELECT
        rc.is_repeat,
        rc.previous_resolved_at,
        rc.gap_days,
        rc.last_resolved_workflow_id
    INTO
        v_is_repeat,
        v_prev_resolved_at,
        v_gap_days,
        v_last_wf_id
    FROM fn_check_repeat_complaint(v_infra_node_id) rc;

    -- If repeat: escalate priority to critical regardless of agent suggestion
    v_final_priority := CASE
        WHEN v_is_repeat         THEN 'critical'
        WHEN p_priority IS NULL  THEN 'normal'
        ELSE p_priority
    END;

    -- Find the last resolved complaint on this node for the backlink
    IF v_is_repeat THEN
        SELECT id INTO v_repeat_prev_complaint
        FROM   complaints
        WHERE  infra_node_id = v_infra_node_id
          AND  status        = 'resolved'
          AND  is_deleted    = FALSE
        ORDER  BY resolved_at DESC
        LIMIT  1;
    END IF;

    -- â”€â”€ STEP 4: generate complaint number â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    v_complaint_number := fn_generate_complaint_number(p_city_code);

    -- â”€â”€ STEP 5: insert complaint â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    INSERT INTO complaints (
        id, complaint_number,
        citizen_id, city_id, jurisdiction_id, infra_node_id,
        title, description, original_language, translated_description,
        location, address_text,
        images, voice_recording_url, voice_transcript,
        status, priority,
        is_repeat_complaint,
        repeat_previous_complaint_id,
        repeat_previous_resolved_at,
        repeat_gap_days,
        agent_summary, agent_priority_reason, agent_suggested_dept_ids,
        created_at
    ) VALUES (
        v_complaint_id, v_complaint_number,
        p_citizen_id, p_city_id, v_jurisdiction_id, v_infra_node_id,
        p_title, p_description, p_original_language, p_translated_description,
        v_point, p_address_text,
        COALESCE(p_images, '[]'::jsonb),
        p_voice_recording_url, p_voice_transcript,
        'received',
        v_final_priority,
        v_is_repeat,
        v_repeat_prev_complaint,
        v_prev_resolved_at,
        v_gap_days,           -- set once at filing time; never updated
        p_agent_summary, p_agent_priority_reason,
        COALESCE(p_agent_suggested_dept_ids, '{}'::UUID[]),
        NOW()
    );

    -- â”€â”€ STEP 6: insert embeddings â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    -- text_embedding is ALWAYS required (computed before calling this fn).
    -- image_embedding is NULL if no image was submitted â€” that is valid.
    -- The ingestion Cloud Run service must compute both BEFORE calling this fn:
    --   text:  Nomic nomic-embed-text-v1.5 on translated_description
    --   image: Nomic nomic-embed-vision-v1.5 on first image (if images != [])
    INSERT INTO complaint_embeddings (
        complaint_id,
        text_embedding,
        image_embedding,
        model_version,
        embedded_at
    ) VALUES (
        v_complaint_id,
        p_text_embedding,
        p_image_embedding,   -- NULL is valid (no image case)
        p_embedding_model,
        NOW()
    );

    -- â”€â”€ STEP 7: resolve workflow_instance â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    -- Check if an active workflow already exists for this infra_node
    SELECT id INTO v_workflow_instance_id
    FROM   workflow_instances
    WHERE  infra_node_id = v_infra_node_id
      AND  status        = 'active'
    LIMIT  1;

    -- If no active workflow: the WORKFLOW_ENGINE agent creates one.
    -- We leave workflow_instance_id NULL here â€” the agent fills it
    -- and then inserts the workflow_complaints row itself.
    -- This fn only inserts workflow_complaints if a workflow already exists.
    IF v_workflow_instance_id IS NOT NULL THEN
        INSERT INTO workflow_complaints (
            workflow_instance_id,
            complaint_id,
            attached_at
        ) VALUES (
            v_workflow_instance_id,
            v_complaint_id,
            NOW()
        )
        ON CONFLICT (complaint_id) DO NOTHING;  -- idempotent

        -- Update complaints cache column
        UPDATE complaints
           SET workflow_instance_id = v_workflow_instance_id
         WHERE id = v_complaint_id;
    END IF;

    -- â”€â”€ STEP 8: write domain event â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    INSERT INTO domain_events (
        event_type, entity_type, entity_id,
        actor_id, actor_type,
        payload,
        complaint_id, city_id
    ) VALUES (
        CASE WHEN v_is_repeat THEN 'COMPLAINT_REPEAT_ESCALATED' ELSE 'COMPLAINT_RECEIVED' END,
        'complaint',
        v_complaint_id,
        p_citizen_id,
        'user',
        jsonb_build_object(
            'complaint_number',     v_complaint_number,
            'priority',             v_final_priority,
            'infra_node_id',        v_infra_node_id,
            'is_new_infra_node',    v_is_new_node,
            'is_repeat',            v_is_repeat,
            'repeat_gap_days',      v_gap_days,
            'jurisdiction_id',      v_jurisdiction_id,
            'has_image_embedding',  (p_image_embedding IS NOT NULL)
        ),
        v_complaint_id,
        p_city_id
    );

    -- â”€â”€ RETURN â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    RETURN QUERY SELECT
        v_complaint_id,
        v_complaint_number,
        v_infra_node_id,
        v_workflow_instance_id,
        v_is_new_node,
        v_is_repeat,
        v_gap_days,
        v_jurisdiction_id;

END;
$$;

COMMENT ON FUNCTION fn_ingest_complaint IS
    'â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
     ATOMIC INGESTION CONTRACT â€” READ BEFORE CALLING
     â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

     This function is the ONLY entry point for new complaint creation.
     The Cloud Run ingestion service MUST NOT call individual INSERTs.

     WHAT THIS FUNCTION GUARANTEES (all-or-nothing):
       1. Jurisdiction auto-resolved from PostGIS point
       2. Infra node found-or-created (race-safe via geohash unique index)
       3. Repeat complaint detected â†’ priority auto-escalated to critical
       4. Complaint inserted with correct priority and repeat metadata
       5. Embeddings inserted (text always, image when available)
       6. Workflow mapped if active workflow already exists for this infra_node
       7. Domain event written (COMPLAINT_RECEIVED or COMPLAINT_REPEAT_ESCALATED)

     WHAT THE CALLER (Cloud Run) MUST DO BEFORE CALLING:
       A. Translate description to English (Google Cloud Translation API)
       B. Compute text embedding:
            Nomic nomic-embed-text-v1.5 on translated_description
            â†’ vector(768)
            REQUIRED â€” do not call this function without it.
       C. If images present: compute image embedding:
            Nomic nomic-embed-vision-v1.5 on first/primary image
            â†’ vector(768)
            Pass NULL if no images. NULL image_embedding is valid.
       D. Upload all media to GCS, get signed URLs, build p_images JSONB
       E. Upload voice recording to GCS if present

     WHAT HAPPENS AFTER THIS FUNCTION RETURNS:
       The return row tells the WORKFLOW_ENGINE agent:
         - workflow_instance_id: NULL â†’ create new workflow for this infra_node
         - is_new_infra_node: TRUE â†’ first complaint on this asset
         - is_repeat_complaint: TRUE â†’ flag for escalation notification
       WORKFLOW_ENGINE then:
         1. Calls fn_resolve_workflow_version(infra_type_id, jurisdiction_id, city_id)
         2. Creates workflow_instance
         3. Creates workflow_step_instances for each step
         4. Inserts workflow_complaints row
         5. Updates complaints.workflow_instance_id cache
         6. Creates Cloud Tasks jobs for SLA + survey triggers
         7. Publishes WORKFLOW_STARTED to ps-crm-workflow Pub/Sub topic

     TRANSACTION SCOPE:
       This function runs inside a single PG transaction.
       If ANY step fails â†’ entire transaction rolls back.
       No orphan complaints. No broken mappings. No missing embeddings.

     IDEMPOTENCY:
       ON CONFLICT on infra_node (geohash) â†’ use existing node
       ON CONFLICT on workflow_complaints(complaint_id) â†’ DO NOTHING
       Safe to retry on transient Cloud SQL connection failure.
     â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•';


-- ============================================================
-- FIX 4 â€” EMBEDDING PIPELINE GUARANTEES
-- Ensure complaint_embeddings always has a row for every complaint.
-- Three layers of enforcement:
--   A. fn_ingest_complaint always inserts both (text mandatory, image nullable)
--   B. Nightly Cloud Function detects and backfills missing embeddings
--   C. Monitoring view for ops team
-- ============================================================

-- â”€â”€ A: NOT NULL on text_embedding (text is always computable) â”€â”€â”€
-- image_embedding stays nullable â€” valid when no image was submitted.
ALTER TABLE complaint_embeddings
    ALTER COLUMN text_embedding SET NOT NULL;

COMMENT ON COLUMN complaint_embeddings.text_embedding IS
    'REQUIRED. Nomic nomic-embed-text-v1.5, 768 dimensions.
     Computed from complaints.translated_description (English).
     If original_language != English: translate first via Cloud Translation API.
     Never NULL â€” fn_ingest_complaint enforces this.
     Used for: semantic duplicate detection, cluster summarisation,
     agent context retrieval ("find similar past complaints").';

COMMENT ON COLUMN complaint_embeddings.image_embedding IS
    'NULLABLE. Nomic nomic-embed-vision-v1.5, 768 dimensions.
     Computed from the first image in complaints.images (if any).
     NULL when complaint was submitted with no images â€” this is valid.
     Used for: visual duplicate detection, damage severity inference,
     before/after comparison by the SUMMARY_GENERATOR agent.';

-- â”€â”€ B: Monitoring view â€” complaints missing embeddings â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Polled nightly by Cloud Scheduler â†’ Cloud Run embedding-backfill service.
CREATE OR REPLACE VIEW v_missing_embeddings AS
SELECT
    c.id                    AS complaint_id,
    c.complaint_number,
    c.city_id,
    c.original_language,
    c.translated_description IS NULL    AS needs_translation,
    ce.complaint_id IS NULL             AS missing_all_embeddings,
    ce.text_embedding IS NULL           AS missing_text_embedding,
    ce.image_embedding IS NULL
        AND jsonb_array_length(c.images) > 0
                                        AS missing_image_embedding,
    c.created_at
FROM        complaints         c
LEFT JOIN   complaint_embeddings ce ON ce.complaint_id = c.id
WHERE  c.is_deleted = FALSE
  AND  (
          ce.complaint_id  IS NULL          -- no embedding row at all
       OR ce.text_embedding IS NULL         -- text missing (should not happen post-fix)
       OR (ce.image_embedding IS NULL
           AND jsonb_array_length(c.images) > 0)  -- image present but not embedded
       )
ORDER BY c.created_at DESC;

COMMENT ON VIEW v_missing_embeddings IS
    'Ops monitoring view. Polled by nightly backfill Cloud Function.
     missing_all_embeddings: fn_ingest_complaint failed mid-transaction (should not occur).
     missing_text_embedding: pre-fix legacy data or translation API failure.
     missing_image_embedding: image present but Nomic vision call failed.

     Backfill Cloud Function flow:
       1. SELECT * FROM v_missing_embeddings LIMIT 100
       2. For each row:
          a. If needs_translation: call Cloud Translation API
          b. Call Nomic API for missing embedding(s)
          c. INSERT INTO complaint_embeddings ON CONFLICT (complaint_id)
             DO UPDATE SET text_embedding = ..., image_embedding = ...,
                           embedded_at = NOW()
       3. Write result to domain_events (event_type = EMBEDDINGS_BACKFILLED)';

-- â”€â”€ C: model_version index (for targeted re-embedding) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE INDEX idx_ce_model_version ON complaint_embeddings(model_version);

COMMENT ON INDEX idx_ce_model_version IS
    'Used when Nomic releases a new model version.
     Re-embedding query: SELECT complaint_id FROM complaint_embeddings
       WHERE model_version = ''nomic-embed-text-v1.5''
     Batch through the backfill Cloud Function, update to new model.';


-- ============================================================
-- SUMMARY OF v3.2 CHANGES
-- ============================================================
--
-- NEW INDEX:
--   idx_unique_complaint_workflow   UNIQUE ON workflow_complaints(complaint_id)
--                                   One complaint â†’ one workflow, DB-enforced
--
-- MODIFIED COLUMN:
--   infra_nodes.location_hash       ROUND(lat,5)_ROUND(lng,5)
--                                   â†’ ST_GeoHash(location, 8)  ~38m Ã— 19m cell
--
-- NEW FUNCTION:
--   fn_ingest_complaint(...)        Atomic 8-step ingestion transaction.
--                                   Single entry point for all complaint creation.
--                                   Handles: jurisdiction, infra node, repeat check,
--                                   complaint insert, embeddings, workflow mapping,
--                                   domain event. All-or-nothing.
--
-- MODIFIED CONSTRAINT:
--   complaint_embeddings.text_embedding   SET NOT NULL
--
-- NEW VIEW:
--   v_missing_embeddings            Ops monitoring: complaints missing text/image embeddings.
--                                   Polled by nightly backfill Cloud Function.
--
-- NEW INDEX:
--   idx_ce_model_version            Enables targeted re-embedding on model upgrade.
-- ============================================================

```

## 4. All Models / Schemas Full code of every model and pydantic schema defined, every single column and field, types, defaults, relationships, nothing skipped

#### backend/models.py
`$lang
# backend/models.py

import uuid
import enum
from sqlalchemy import (
    Column, String, Boolean, Integer, Text, Numeric,
    DateTime, Date, SmallInteger, ForeignKey, ARRAY,
    CheckConstraint, UniqueConstraint
)
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from geoalchemy2 import Geometry
from pgvector.sqlalchemy import Vector
from db import Base


# ============================================================
# LAYER 1 â€” REFERENCE / MASTER DATA
# ============================================================

class City(Base):
    __tablename__ = "cities"

    id           = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name         = Column(String(100), nullable=False)
    state        = Column(String(100))
    country_code = Column(String(2), nullable=False, default="IN")
    city_code    = Column(String(10), nullable=False, unique=True)
    timezone     = Column(String(50), nullable=False, default="Asia/Kolkata")
    extra_meta   = Column("metadata", JSONB, nullable=False, default=dict)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Jurisdiction(Base):
    __tablename__ = "jurisdictions"

    id                = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id           = Column(UUID(as_uuid=True), ForeignKey("cities.id", ondelete="RESTRICT"), nullable=False)
    parent_id         = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name              = Column(String(200), nullable=False)
    code              = Column(String(30), nullable=False)
    jurisdiction_type = Column(String(50), nullable=False)
    boundary          = Column(Geometry("MULTIPOLYGON", srid=4326))
    extra_meta        = Column("metadata", JSONB, nullable=False, default=dict)
    created_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "code"),)


class WorkflowConstraint(Base):
    __tablename__ = "workflow_constraints"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id                  = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id          = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name                     = Column(String(300), nullable=False)
    description              = Column(Text)
    constraint_type          = Column(String(30), nullable=False)
    affected_dept_codes      = Column(ARRAY(Text), nullable=False, default=list)
    affected_work_type_codes = Column(ARRAY(Text), nullable=False, default=list)
    is_recurring_annual      = Column(Boolean, nullable=False, default=False)
    start_month              = Column(SmallInteger)
    start_day                = Column(SmallInteger)
    end_month                = Column(SmallInteger)
    end_day                  = Column(SmallInteger)
    active_from              = Column(Date)
    active_until             = Column(Date)
    condition                = Column(JSONB, nullable=False, default=dict)
    block_message            = Column(Text, nullable=False)
    legal_reference          = Column(Text)
    is_active                = Column(Boolean, nullable=False, default=True)
    created_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    updated_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Department(Base):
    __tablename__ = "departments"

    id               = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id          = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id  = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    name             = Column(String(300), nullable=False)
    code             = Column(String(30), nullable=False)
    contact_email    = Column(String(255))
    contact_phone    = Column(String(20))
    head_official_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="SET NULL"))
    extra_meta       = Column("metadata", JSONB, nullable=False, default=dict)
    created_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "code"),)


class InfraType(Base):
    __tablename__ = "infra_types"

    id                    = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name                  = Column(String(100), nullable=False)
    code                  = Column(String(30), nullable=False, unique=True)
    default_dept_ids      = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    cluster_radius_meters = Column(Integer, nullable=False, default=50)
    repeat_alert_years    = Column(Integer, nullable=False, default=3)
    icon_url              = Column(Text)
    extra_meta            = Column("metadata", JSONB, nullable=False, default=dict)
    created_at            = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 2 â€” USERS & ACTORS
# ============================================================

class User(Base):
    __tablename__ = "users"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id            = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    department_id      = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    jurisdiction_id    = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    email              = Column(String(255), unique=True)
    phone              = Column(String(20), unique=True)
    full_name          = Column(String(300), nullable=False)
    preferred_language = Column(String(10), nullable=False, default="hi")
    role               = Column(String(20), nullable=False)
    is_active          = Column(Boolean, nullable=False, default=True)
    is_verified        = Column(Boolean, nullable=False, default=False)
    auth_uid           = Column(String(255), unique=True)
    auth_provider      = Column(String(30), nullable=False, default="phone_otp")
    fcm_token          = Column(Text)
    twilio_opt_in      = Column(Boolean, nullable=False, default=True)
    email_opt_in       = Column(Boolean, nullable=False, default=True)
    extra_meta         = Column("metadata", JSONB, nullable=False, default=dict)
    created_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        CheckConstraint("email IS NOT NULL OR phone IS NOT NULL", name="chk_user_contact"),
    )


class Contractor(Base):
    __tablename__ = "contractors"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id              = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    company_name         = Column(String(400), nullable=False)
    registration_number  = Column(String(100), nullable=False)
    registered_dept_ids  = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    license_expiry       = Column(Date)
    max_concurrent_tasks = Column(Integer, nullable=False, default=5)
    performance_score    = Column(Numeric(4, 2), nullable=False, default=5.0)
    is_blacklisted       = Column(Boolean, nullable=False, default=False)
    blacklist_reason     = Column(Text)
    blacklisted_at       = Column(DateTime(timezone=True))
    blacklisted_by       = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    extra_meta           = Column("metadata", JSONB, nullable=False, default=dict)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class Worker(Base):
    __tablename__ = "workers"

    id                = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id           = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    department_id     = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    contractor_id     = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    employee_id       = Column(String(100))
    skills            = Column(ARRAY(Text), nullable=False, default=list)
    is_available      = Column(Boolean, nullable=False, default=True)
    current_task_count = Column(Integer, nullable=False, default=0)
    performance_score = Column(Numeric(4, 2), nullable=False, default=5.0)
    extra_meta        = Column("metadata", JSONB, nullable=False, default=dict)
    created_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at        = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 3 â€” INFRASTRUCTURE
# ============================================================

class InfraNode(Base):
    __tablename__ = "infra_nodes"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id                   = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id           = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_type_id             = Column(UUID(as_uuid=True), ForeignKey("infra_types.id"), nullable=False)
    name                      = Column(String(400))
    location                  = Column(Geometry("GEOMETRY", srid=4326), nullable=False)
    location_hash             = Column(String, unique=False)
    status                    = Column(String(30), nullable=False, default="operational")
    attributes                = Column(JSONB, nullable=False, default=dict)
    last_resolved_at          = Column(DateTime(timezone=True))
    last_resolved_workflow_id = Column(UUID(as_uuid=True))
    total_complaint_count     = Column(Integer, nullable=False, default=0)
    total_resolved_count      = Column(Integer, nullable=False, default=0)
    is_deleted                = Column(Boolean, nullable=False, default=False)
    deleted_at                = Column(DateTime(timezone=True))
    deleted_by                = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason           = Column(Text)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class AssetHealthLog(Base):
    __tablename__ = "asset_health_logs"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id            = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id", ondelete="CASCADE"), nullable=False)
    health_score             = Column(Numeric(4, 2))
    open_complaint_count     = Column(Integer, nullable=False, default=0)
    resolved_complaint_count = Column(Integer, nullable=False, default=0)
    avg_resolution_days      = Column(Numeric(8, 2))
    last_complaint_at        = Column(DateTime(timezone=True))
    computed_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 4 â€” COMPLAINTS
# ============================================================

class Complaint(Base):
    __tablename__ = "complaints"

    id           = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    complaint_number             = Column(String(30), nullable=False)
    citizen_id                   = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False)
    city_id                      = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id              = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_node_id                = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"))
    workflow_instance_id         = Column(UUID(as_uuid=True))
    title                        = Column(String(500), nullable=False)
    description                  = Column(Text, nullable=False)
    original_language            = Column(String(10), nullable=False, default="hi")
    translated_description       = Column(Text)
    location                     = Column(Geometry("POINT", srid=4326), nullable=False)
    address_text                 = Column(Text)
    images                       = Column(JSONB, nullable=False, default=list)
    voice_recording_url          = Column(Text)
    voice_transcript             = Column(Text)
    voice_transcript_language    = Column(String(10))
    status                       = Column(String(30), nullable=False, default="received")
    priority                     = Column(String(20), nullable=False, default="normal")
    is_repeat_complaint          = Column(Boolean, nullable=False, default=False)
    repeat_previous_complaint_id = Column(UUID(as_uuid=True))
    repeat_previous_resolved_at  = Column(DateTime(timezone=True))
    repeat_gap_days              = Column(Integer)
    is_emergency                 = Column(Boolean, nullable=False, default=False)
    emergency_bypass_at          = Column(DateTime(timezone=True))
    emergency_bypass_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    emergency_bypass_reason      = Column(Text)
    emergency_audit_trail        = Column(JSONB, nullable=False, default=dict)
    is_cluster_primary           = Column(Boolean, nullable=False, default=False)
    agent_summary                = Column(Text)
    agent_priority_reason        = Column(Text)
    agent_suggested_dept_ids     = Column(ARRAY(UUID(as_uuid=True)), nullable=False, default=list)
    is_recomplaint               = Column(Boolean, nullable=False, default=False)
    parent_complaint_id          = Column(UUID(as_uuid=True))
    resolved_at                  = Column(DateTime(timezone=True))
    rejected_reason              = Column(Text)
    is_deleted                   = Column(Boolean, nullable=False, default=False)
    deleted_at                   = Column(DateTime(timezone=True))
    deleted_by                   = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason              = Column(Text)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now(), primary_key=True)
    updated_at                   = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class ComplaintStatusHistory(Base):
    __tablename__ = "complaint_status_history"

    id           = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    complaint_id = Column(UUID(as_uuid=True), nullable=False)
    old_status   = Column(String(30))
    new_status   = Column(String(30), nullable=False)
    changed_by   = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    reason       = Column(Text)
    extra_meta   = Column("metadata", JSONB, nullable=False, default=dict)
    created_at   = Column(DateTime(timezone=True), nullable=False, server_default=func.now(), primary_key=True)


    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class ComplaintCluster(Base):
    __tablename__ = "complaint_clusters"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"), nullable=False)
    primary_complaint_id = Column(UUID(as_uuid=True), nullable=False)
    complaint_count      = Column(Integer, nullable=False, default=1)
    cluster_summary      = Column(Text)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class ComplaintClusterMember(Base):
    __tablename__ = "complaint_cluster_members"

    cluster_id   = Column(UUID(as_uuid=True), ForeignKey("complaint_clusters.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    complaint_id = Column(UUID(as_uuid=True), nullable=False, primary_key=True)
    joined_at    = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class ComplaintEmbedding(Base):
    __tablename__ = "complaint_embeddings"

    complaint_id    = Column(UUID(as_uuid=True), primary_key=True)
    text_embedding  = Column(Vector(768), nullable=False)
    image_embedding = Column(Vector(768))
    model_version   = Column(String(100), nullable=False, default="nomic-embed-text-v1.5")
    embedded_at     = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 5 â€” WORKFLOW ENGINE
# ============================================================

class WorkflowTemplate(Base):
    __tablename__ = "workflow_templates"

    id          = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id     = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    name        = Column(String(300), nullable=False)
    description = Column(Text)
    created_by  = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at  = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("city_id", "name"),)


class WorkflowTemplateVersion(Base):
    __tablename__ = "workflow_template_versions"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    template_id         = Column(UUID(as_uuid=True), ForeignKey("workflow_templates.id"), nullable=False)
    city_id             = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id     = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_type_id       = Column(UUID(as_uuid=True), ForeignKey("infra_types.id"))
    version             = Column(Integer, nullable=False)
    is_active           = Column(Boolean, nullable=False, default=True)
    is_latest_version   = Column(Boolean, nullable=False, default=True)
    previous_version_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id"))
    notes               = Column(Text)
    created_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("template_id", "version"),)


class WorkflowTemplateStep(Base):
    __tablename__ = "workflow_template_steps"

    id                      = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    version_id              = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id", ondelete="CASCADE"), nullable=False)
    step_number             = Column(Integer, nullable=False)
    department_id           = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    step_name               = Column(String(300), nullable=False)
    description             = Column(Text)
    expected_duration_hours = Column(Integer)
    is_optional             = Column(Boolean, nullable=False, default=False)
    requires_tender         = Column(Boolean, nullable=False, default=False)
    work_type_codes         = Column(ARRAY(Text), nullable=False, default=list)
    extra_meta              = Column("metadata", JSONB, nullable=False, default=dict)
    created_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("version_id", "step_number"),)


class WorkflowStepDependency(Base):
    __tablename__ = "workflow_step_dependencies"

    step_id            = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    depends_on_step_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id", ondelete="CASCADE"), nullable=False, primary_key=True)

    __table_args__ = (
        CheckConstraint("step_id != depends_on_step_id", name="chk_no_self_dependency"),
    )


class WorkflowInstance(Base):
    __tablename__ = "workflow_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"), nullable=False)
    template_id          = Column(UUID(as_uuid=True), ForeignKey("workflow_templates.id"), nullable=False)
    version_id           = Column(UUID(as_uuid=True), ForeignKey("workflow_template_versions.id"), nullable=False)
    jurisdiction_id      = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    status               = Column(String(30), nullable=False, default="active")
    mode                 = Column(String(20), nullable=False, default="normal")
    current_step_number  = Column(Integer, nullable=False, default=1)
    total_steps          = Column(Integer, nullable=False)
    started_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    completed_at         = Column(DateTime(timezone=True))
    blocked_reason       = Column(Text)
    blocked_until        = Column(Date)
    is_emergency         = Column(Boolean, nullable=False, default=False)
    emergency_bypass_log = Column(JSONB, nullable=False, default=dict)
    created_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class WorkflowStepInstance(Base):
    __tablename__ = "workflow_step_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    template_step_id     = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id"), nullable=False)
    step_number          = Column(Integer, nullable=False)
    department_id        = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    step_name            = Column(String(300), nullable=False)
    status               = Column(String(30), nullable=False, default="pending")
    assigned_official_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    unlocked_at          = Column(DateTime(timezone=True))
    started_at           = Column(DateTime(timezone=True))
    expected_completion_at = Column(DateTime(timezone=True))
    completed_at         = Column(DateTime(timezone=True))
    constraint_block_id  = Column(UUID(as_uuid=True), ForeignKey("workflow_constraints.id"))
    legally_blocked_at   = Column(DateTime(timezone=True))
    legally_blocked_until = Column(Date)
    agent_summary        = Column(Text)
    agent_priority       = Column(String(20))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("workflow_instance_id", "step_number"),)


class WorkflowComplaints(Base):
    __tablename__ = "workflow_complaints"

    workflow_instance_id     = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False, primary_key=True)
    complaint_id             = Column(UUID(as_uuid=True), nullable=False, primary_key=True)
    attached_at              = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    attached_by_agent_log_id = Column(UUID(as_uuid=True), ForeignKey("agent_logs.id"))


class WorkflowStatusHistory(Base):
    __tablename__ = "workflow_status_history"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    old_status           = Column(String(30))
    new_status           = Column(String(30), nullable=False)
    changed_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    change_source        = Column(String(30), nullable=False, default="system")
    reason               = Column(Text)
    state_snapshot       = Column(JSONB, nullable=False, default=dict)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 6 â€” TASKS
# ============================================================

class Task(Base):
    __tablename__ = "tasks"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    task_number               = Column(String(30), nullable=False, unique=True)
    workflow_step_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_step_instances.id"))
    complaint_id              = Column(UUID(as_uuid=True))
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    jurisdiction_id           = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    assigned_official_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    assigned_worker_id        = Column(UUID(as_uuid=True), ForeignKey("workers.id"))
    assigned_contractor_id    = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    title                     = Column(String(500), nullable=False)
    description               = Column(Text)
    status                    = Column(String(30), nullable=False, default="pending")
    priority                  = Column(String(20), nullable=False, default="normal")
    override_reason_code      = Column(String(30))
    override_notes            = Column(Text)
    override_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    override_at               = Column(DateTime(timezone=True))
    previous_assignee         = Column(JSONB)
    due_at                    = Column(DateTime(timezone=True))
    started_at                = Column(DateTime(timezone=True))
    completed_at              = Column(DateTime(timezone=True))
    before_photos             = Column(JSONB, nullable=False, default=list)
    after_photos              = Column(JSONB, nullable=False, default=list)
    progress_photos           = Column(JSONB, nullable=False, default=list)
    completion_notes          = Column(Text)
    completion_location       = Column(Geometry("POINT", srid=4326))
    agent_summary             = Column(Text)
    is_deleted                = Column(Boolean, nullable=False, default=False)
    deleted_at                = Column(DateTime(timezone=True))
    deleted_by                = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    deletion_reason           = Column(Text)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class TaskStatusHistory(Base):
    __tablename__ = "task_status_history"

    id         = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    task_id    = Column(UUID(as_uuid=True), ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False)
    old_status = Column(String(30))
    new_status = Column(String(30), nullable=False)
    changed_by = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    reason     = Column(Text)
    extra_meta = Column("metadata", JSONB, nullable=False, default=dict)
    created_at = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class TaskSLA(Base):
    __tablename__ = "task_sla"

    task_id         = Column(UUID(as_uuid=True), ForeignKey("tasks.id", ondelete="CASCADE"), primary_key=True)
    sla_hours       = Column(Integer, nullable=False)
    started_at      = Column(DateTime(timezone=True))
    due_at          = Column(DateTime(timezone=True), nullable=False)
    is_breached     = Column(Boolean, nullable=False, default=False)
    breached_at     = Column(DateTime(timezone=True))
    warning_sent_at = Column(DateTime(timezone=True))
    escalation_log  = Column(JSONB, nullable=False, default=list)
    created_at      = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at      = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 7 â€” EMERGENCY POSTHOC TASKS
# ============================================================

class EmergencyPosthocTask(Base):
    __tablename__ = "emergency_posthoc_tasks"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    workflow_instance_id      = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id", ondelete="CASCADE"), nullable=False)
    complaint_id              = Column(UUID(as_uuid=True), nullable=False)
    original_template_step_id = Column(UUID(as_uuid=True), ForeignKey("workflow_template_steps.id"), nullable=False)
    step_number               = Column(Integer, nullable=False)
    step_name                 = Column(String(300), nullable=False)
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    assigned_official_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    documentation_type        = Column(String(50), nullable=False)
    instructions              = Column(Text, nullable=False)
    is_mandatory              = Column(Boolean, nullable=False, default=True)
    status                    = Column(String(30), nullable=False, default="pending")
    waived_by                 = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    waived_reason             = Column(Text)
    uploaded_documents        = Column(JSONB, nullable=False, default=list)
    completion_notes          = Column(Text)
    due_within_hours          = Column(Integer, nullable=False, default=48)
    emergency_bypass_at       = Column(DateTime(timezone=True), nullable=False)
    due_at                    = Column(DateTime(timezone=True), nullable=False)
    completed_at              = Column(DateTime(timezone=True))
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 8 â€” TENDERS
# ============================================================

class Tender(Base):
    __tablename__ = "tenders"

    id                        = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    tender_number             = Column(String(30), nullable=False, unique=True)
    department_id             = Column(UUID(as_uuid=True), ForeignKey("departments.id"), nullable=False)
    workflow_step_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_step_instances.id"))
    complaint_id              = Column(UUID(as_uuid=True))
    requested_by              = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    title                     = Column(String(500), nullable=False)
    description               = Column(Text)
    scope_of_work             = Column(Text)
    estimated_cost            = Column(Numeric(15, 2))
    final_cost                = Column(Numeric(15, 2))
    status                    = Column(String(30), nullable=False, default="draft")
    approved_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    rejected_by               = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    awarded_to_contractor_id  = Column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    documents                 = Column(JSONB, nullable=False, default=list)
    approval_notes            = Column(Text)
    rejection_reason          = Column(Text)
    submitted_at              = Column(DateTime(timezone=True))
    approved_at               = Column(DateTime(timezone=True))
    awarded_at                = Column(DateTime(timezone=True))
    due_date                  = Column(Date)
    created_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at                = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 9 â€” SURVEYS
# ============================================================

class SurveyTemplate(Base):
    __tablename__ = "survey_templates"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name                = Column(String(300), nullable=False)
    survey_type         = Column(String(30), nullable=False)
    trigger_at_step_pct = Column(SmallInteger, default=50)
    questions           = Column(JSONB, nullable=False)
    is_active           = Column(Boolean, nullable=False, default=True)
    created_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class SurveyInstance(Base):
    __tablename__ = "survey_instances"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    template_id          = Column(UUID(as_uuid=True), ForeignKey("survey_templates.id"), nullable=False)
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    complaint_id         = Column(UUID(as_uuid=True))
    survey_type          = Column(String(30), nullable=False)
    target_user_id       = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    target_role          = Column(String(30), nullable=False)
    status               = Column(String(20), nullable=False, default="pending")
    triggered_by         = Column(String(20), nullable=False, default="agent")
    channel              = Column(String(20), nullable=False, default="whatsapp")
    related_location     = Column(Geometry("POINT", srid=4326))
    triggered_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    sent_at              = Column(DateTime(timezone=True))
    opened_at            = Column(DateTime(timezone=True))
    completed_at         = Column(DateTime(timezone=True))
    expires_at           = Column(DateTime(timezone=True))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


class SurveyResponse(Base):
    __tablename__ = "survey_responses"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    survey_instance_id = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"), nullable=False)
    respondent_id      = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    answers            = Column(JSONB, nullable=False)
    overall_rating     = Column(Numeric(3, 1))
    feedback_text      = Column(Text)
    submitted_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 10 â€” NOTIFICATIONS
# ============================================================

class NotificationTemplate(Base):
    __tablename__ = "notification_templates"

    id               = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name             = Column(String(300), nullable=False)
    event_type       = Column(String(100), nullable=False)
    channel          = Column(String(30), nullable=False)
    language         = Column(String(10), nullable=False, default="hi")
    subject_template = Column(Text)
    body_template    = Column(Text, nullable=False)
    is_active        = Column(Boolean, nullable=False, default=True)
    created_at       = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("event_type", "channel", "language"),)


class NotificationLog(Base):
    __tablename__ = "notification_logs"

    id                  = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    template_id         = Column(UUID(as_uuid=True), ForeignKey("notification_templates.id"))
    recipient_user_id   = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    recipient_contact   = Column(String(255), nullable=False)
    channel             = Column(String(30), nullable=False)
    event_type          = Column(String(100), nullable=False)
    complaint_id        = Column(UUID(as_uuid=True))
    task_id             = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    survey_instance_id  = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"))
    payload             = Column(JSONB, nullable=False, default=dict)
    status              = Column(String(20), nullable=False, default="pending")
    external_message_id = Column(String(255))
    error_message       = Column(Text)
    sent_at             = Column(DateTime(timezone=True))
    delivered_at        = Column(DateTime(timezone=True))
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class AreaNotificationSubscription(Base):
    __tablename__ = "area_notification_subscriptions"

    id                 = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id            = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    location           = Column(Geometry("POINT", srid=4326), nullable=False)
    radius_meters      = Column(Integer, nullable=False, default=5000)
    preferred_channels = Column(ARRAY(Text), nullable=False, default=list)
    is_active          = Column(Boolean, nullable=False, default=True)
    created_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at         = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 11 â€” GCP INTEGRATION
# ============================================================

class PubSubEventLog(Base):
    __tablename__ = "pubsub_event_log"

    id                   = Column(UUID(as_uuid=True), nullable=False, default=uuid.uuid4, primary_key=True)
    event_type           = Column(String(100), nullable=False)
    pubsub_topic         = Column(String(300))
    pubsub_message_id    = Column(String(200))
    published_at         = Column(DateTime(timezone=True))
    ack_at               = Column(DateTime(timezone=True))
    payload              = Column(JSONB, nullable=False, default=dict)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id              = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    user_id              = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    processed_by         = Column(String(200))
    processing_status    = Column(String(20), nullable=False, default="published")
    retry_count          = Column(SmallInteger, nullable=False, default=0)
    error_message        = Column(Text)
    processed_at         = Column(DateTime(timezone=True))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (
        {"postgresql_partition_by": "RANGE (created_at)"},
    )


class CloudTaskSchedule(Base):
    __tablename__ = "cloud_task_schedule"

    id                     = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    cloud_task_name        = Column(String(500), nullable=False, unique=True)
    queue_name             = Column(String(200), nullable=False)
    task_type              = Column(String(100), nullable=False)
    complaint_id           = Column(UUID(as_uuid=True))
    workflow_instance_id   = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id                = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    survey_instance_id     = Column(UUID(as_uuid=True), ForeignKey("survey_instances.id"))
    target_user_id         = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    payload                = Column(JSONB, nullable=False, default=dict)
    scheduled_for          = Column(DateTime(timezone=True), nullable=False)
    schedule_delay_seconds = Column(Integer, nullable=False, default=0)
    status                 = Column(String(20), nullable=False, default="scheduled")
    retry_count            = Column(SmallInteger, nullable=False, default=0)
    error_message          = Column(Text)
    executed_at            = Column(DateTime(timezone=True))
    created_at             = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 12 â€” AGENT LOGS
# ============================================================

class AgentLog(Base):
    __tablename__ = "agent_logs"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    agent_type           = Column(String(60), nullable=False)
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    task_id              = Column(UUID(as_uuid=True), ForeignKey("tasks.id"))
    input_data           = Column(JSONB, nullable=False, default=dict)
    output_data          = Column(JSONB, nullable=False, default=dict)
    action_taken         = Column(String(300))
    confidence_score     = Column(Numeric(5, 4))
    human_overridden     = Column(Boolean, nullable=False, default=False)
    override_by          = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    override_reason      = Column(Text)
    latency_ms           = Column(Integer)
    model_used           = Column(String(100))
    tokens_used          = Column(Integer)
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 13 â€” PUBLIC ANNOUNCEMENTS
# ============================================================

class PublicAnnouncement(Base):
    __tablename__ = "public_announcements"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"), nullable=False)
    jurisdiction_id      = Column(UUID(as_uuid=True), ForeignKey("jurisdictions.id"))
    infra_node_id        = Column(UUID(as_uuid=True), ForeignKey("infra_nodes.id"))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    title                = Column(String(500), nullable=False)
    content              = Column(Text, nullable=False)
    work_type            = Column(String(100))
    affected_area        = Column(Geometry("POLYGON", srid=4326))
    status               = Column(String(30), nullable=False)
    expected_start_date  = Column(Date)
    expected_end_date    = Column(Date)
    actual_end_date      = Column(Date)
    is_published         = Column(Boolean, nullable=False, default=False)
    published_at         = Column(DateTime(timezone=True))
    expires_at           = Column(DateTime(timezone=True))
    created_by           = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
    updated_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())


# ============================================================
# LAYER 14 â€” KPI SNAPSHOTS
# ============================================================

class OfficialPerformanceSnapshot(Base):
    __tablename__ = "official_performance_snapshots"

    id                       = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    official_id              = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    department_id            = Column(UUID(as_uuid=True), ForeignKey("departments.id"))
    snapshot_date            = Column(Date, nullable=False)
    tasks_assigned           = Column(Integer, nullable=False, default=0)
    tasks_completed          = Column(Integer, nullable=False, default=0)
    tasks_overdue            = Column(Integer, nullable=False, default=0)
    avg_resolution_hours     = Column(Numeric(8, 2))
    avg_survey_rating        = Column(Numeric(4, 2))
    override_count           = Column(Integer, nullable=False, default=0)
    override_reason_breakdown = Column(JSONB, nullable=False, default=dict)
    complaints_handled       = Column(Integer, nullable=False, default=0)
    emergency_bypasses       = Column(Integer, nullable=False, default=0)
    posthoc_tasks_pending    = Column(Integer, nullable=False, default=0)
    created_at               = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("official_id", "snapshot_date"),)


class ContractorPerformanceSnapshot(Base):
    __tablename__ = "contractor_performance_snapshots"

    id                  = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    contractor_id       = Column(UUID(as_uuid=True), ForeignKey("contractors.id"), nullable=False)
    snapshot_date       = Column(Date, nullable=False)
    tasks_completed     = Column(Integer, nullable=False, default=0)
    tasks_overdue       = Column(Integer, nullable=False, default=0)
    avg_completion_hours = Column(Numeric(8, 2))
    avg_survey_rating   = Column(Numeric(4, 2))
    tenders_won         = Column(Integer, nullable=False, default=0)
    tenders_applied     = Column(Integer, nullable=False, default=0)
    created_at          = Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    __table_args__ = (UniqueConstraint("contractor_id", "snapshot_date"),)


# ============================================================
# LAYER 15 â€” DOMAIN EVENTS
# ============================================================

class DomainEvent(Base):
    __tablename__ = "domain_events"

    id                   = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    event_type           = Column(String(100), nullable=False)
    entity_type          = Column(String(60), nullable=False)
    entity_id            = Column(UUID(as_uuid=True), nullable=False)
    actor_id             = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    actor_type           = Column(String(30))
    payload              = Column(JSONB, nullable=False, default=dict)
    complaint_id         = Column(UUID(as_uuid=True))
    workflow_instance_id = Column(UUID(as_uuid=True), ForeignKey("workflow_instances.id"))
    city_id              = Column(UUID(as_uuid=True), ForeignKey("cities.id"))
    created_at           = Column(DateTime(timezone=True), nullable=False, server_default=func.now())
```

#### backend/schemas.py
`$lang
from typing import List, Optional
from uuid import UUID

from fastapi import UploadFile
from pydantic import BaseModel, ConfigDict, Field

class ComplaintCreate(BaseModel):
    text: str
    lat: float
    lng: float
    photo_url: Optional[str] = None


class ComplaintIngestRequest(BaseModel):
    model_config = ConfigDict(arbitrary_types_allowed=True)

    citizen_id: UUID
    city_id: UUID
    city_code: str
    title: str
    description: str
    original_language: str
    lat: float = Field(ge=-90, le=90)
    lng: float = Field(ge=-180, le=180)
    infra_type_id: UUID

    address_text: Optional[str] = None
    infra_name: Optional[str] = None
    priority: Optional[str] = "normal"
    voice_transcript: Optional[str] = None
    agent_summary: Optional[str] = None
    agent_priority_reason: Optional[str] = None
    agent_suggested_dept_ids: Optional[List[str]] = None
    embedding_model: Optional[str] = "nomic-embed-text-v1.5"

    images: List[UploadFile] = Field(default_factory=list)
    voice_recording: Optional[UploadFile] = None


class ComplaintIngestResponse(BaseModel):
    complaint_id: UUID
    complaint_number: str
    infra_node_id: UUID
    workflow_instance_id: Optional[UUID]
    is_repeat_complaint: bool
    is_new_infra_node: bool
    repeat_gap_days: Optional[int]
    jurisdiction_id: Optional[UUID]

class ComplaintResponse(BaseModel):
    id: int
    status: str
    message: str


class SignUpRequest(BaseModel):
    full_name: str
    email: str
    password: str
    city_code: Optional[str] = None
    preferred_language: Optional[str] = "hi"


class SignInRequest(BaseModel):
    email: str
    password: str


class AuthResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    expires_in: int
    user_id: UUID
    role: str
    email: str
    full_name: str


class TokenData(BaseModel):
    user_id: UUID
    role: str
    
class SurveySubmit(BaseModel):

    complaint_id: int
    rating: int
    comment: str
    

class AssistantQuery(BaseModel):
    query: str
```

## 5. All Existing Endpoints Full code of every existing route, grouped by router, including exact request and response shapes

#### backend/main.py
`$lang
# backend/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes import complaint_router, auth_router


app = FastAPI(
    title="PSCRM Civic Intelligence API",
    description="Multi-Agent Event-Driven Civic Infrastructure Platform",
    version="1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(complaint_router.router)
app.include_router(auth_router.router)

@app.get("/")
def root():
    return {"status": "online", "message": "PSCRM Core Nervous System Active"}
```

#### backend/routes/auth_router.py
`$lang
import base64
import hashlib
import hmac
import os
import re
from datetime import datetime, timedelta, timezone

import jwt
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from config import settings
from db import get_db
from dependencies import get_current_user
from models import City, User
from schemas import AuthResponse, SignInRequest, SignUpRequest, TokenData

router = APIRouter(prefix="/auth", tags=["Auth"])

PASSWORD_ITERATIONS = 390000
PASSWORD_REGEX = re.compile(r"^(?=.*[A-Za-z])(?=.*\d).{8,}$")


def _hash_password(password: str) -> str:
    salt = os.urandom(16)
    digest = hashlib.pbkdf2_hmac("sha256", password.encode("utf-8"), salt, PASSWORD_ITERATIONS)
    return "pbkdf2_sha256${}${}${}".format(
        PASSWORD_ITERATIONS,
        base64.b64encode(salt).decode("ascii"),
        base64.b64encode(digest).decode("ascii"),
    )


def _verify_password(password: str, stored: str) -> bool:
    try:
        algo, iteration_str, salt_b64, digest_b64 = stored.split("$", 3)
        if algo != "pbkdf2_sha256":
            return False
        iterations = int(iteration_str)
        salt = base64.b64decode(salt_b64.encode("ascii"))
        expected = base64.b64decode(digest_b64.encode("ascii"))
    except Exception:
        return False

    actual = hashlib.pbkdf2_hmac("sha256", password.encode("utf-8"), salt, iterations)
    return hmac.compare_digest(actual, expected)


def _issue_access_token(user: User) -> tuple[str, int]:
    expires_seconds = settings.AUTH_ACCESS_TOKEN_EXPIRE_MINUTES * 60
    expires_at = datetime.now(timezone.utc) + timedelta(seconds=expires_seconds)
    payload = {
        "sub": str(user.id),
        "role": user.role,
        "email": user.email,
        "type": "access",
        "exp": int(expires_at.timestamp()),
        "iat": int(datetime.now(timezone.utc).timestamp()),
    }
    token = jwt.encode(payload, settings.AUTH_JWT_SECRET, algorithm=settings.AUTH_JWT_ALGORITHM)
    return token, expires_seconds


def _resolve_city_id(db: Session, city_code: str | None):
    if city_code:
        city = db.query(City).filter(City.city_code == city_code.strip()).first()
        if not city:
            raise HTTPException(status_code=400, detail="Invalid city_code")
        return city.id

    first_city = db.query(City).order_by(City.created_at.asc()).first()
    return first_city.id if first_city else None


def _validate_password_strength(password: str) -> None:
    if not PASSWORD_REGEX.match(password):
        raise HTTPException(
            status_code=400,
            detail="Password must be at least 8 characters and include letters and numbers",
        )


@router.post("/signup", response_model=AuthResponse)
def signup(payload: SignUpRequest, db: Session = Depends(get_db)):
    email = payload.email.strip().lower()
    if not email:
        raise HTTPException(status_code=400, detail="Email is required")

    if db.query(User).filter(User.email == email).first():
        raise HTTPException(status_code=409, detail="Email already registered")

    _validate_password_strength(payload.password)
    city_id = _resolve_city_id(db, payload.city_code)
    password_hash = _hash_password(payload.password)

    user = User(
        city_id=city_id,
        email=email,
        full_name=payload.full_name.strip(),
        preferred_language=(payload.preferred_language or "hi").strip(),
        role="citizen",
        is_active=True,
        is_verified=True,
        auth_provider="password",
        extra_meta={"password_hash": password_hash},
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    token, expires_in = _issue_access_token(user)
    return AuthResponse(
        access_token=token,
        expires_in=expires_in,
        user_id=user.id,
        role=user.role,
        email=user.email or "",
        full_name=user.full_name,
    )


@router.post("/login")
def login(payload: SignInRequest, db: Session = Depends(get_db)):
    email = payload.email.strip().lower()
    user = db.query(User).filter(User.email == email).first()
    if not user or not user.is_active:
        raise HTTPException(status_code=401, detail="Invalid email or password")

    meta = user.extra_meta or {}
    stored_hash = meta.get("password_hash") if isinstance(meta, dict) else None
    if not stored_hash or not _verify_password(payload.password, stored_hash):
        raise HTTPException(status_code=401, detail="Invalid email or password")

    token, expires_in = _issue_access_token(user)
    return AuthResponse(
        access_token=token,
        expires_in=expires_in,
        user_id=user.id,
        role=user.role,
        email=user.email or "",
        full_name=user.full_name,
    )


@router.get("/me")
def me(current_user: TokenData = Depends(get_current_user), db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id == current_user.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return {
        "user_id": str(user.id),
        "email": user.email,
        "full_name": user.full_name,
        "role": user.role,
        "is_active": user.is_active,
    }

```

#### backend/routes/complaint_router.py
`$lang
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, File, Form, HTTPException, UploadFile
from sqlalchemy.orm import Session

from db import get_db
from dependencies import get_current_user
from models import City, InfraType, User
from schemas import ComplaintIngestRequest, ComplaintIngestResponse, TokenData
from services.complaint_service import (
    get_complaint_by_id as get_complaint_by_id_service,
    ingest_complaint as ingest_complaint_service,
)

router = APIRouter(prefix="/complaints", tags=["Complaints"])


@router.get("/{complaint_id}")
def get_complaint_by_id(
    complaint_id: UUID,
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    return get_complaint_by_id_service(
        db=db,
        complaint_id=complaint_id,
        current_user_id=current_user.user_id,
        current_user_role=current_user.role,
    )

@router.post("/ingest", response_model=ComplaintIngestResponse)
async def ingest_complaint(
    title: Optional[str] = Form(default=None),
    text: Optional[str] = Form(default=None),
    description: Optional[str] = Form(default=None),
    original_language: str = Form("en"),
    lat: float = Form(...),
    lng: float = Form(...),
    infra_type_id: Optional[UUID] = Form(default=None),
    address_text: Optional[str] = Form(default=None),
    infra_name: Optional[str] = Form(default=None),
    priority: str = Form(default="normal"),
    voice_transcript: Optional[str] = Form(default=None),
    agent_summary: Optional[str] = Form(default=None),
    agent_priority_reason: Optional[str] = Form(default=None),
    embedding_model: str = Form(default="nomic-embed-text-v1.5"),
    agent_suggested_dept_ids: Optional[str] = Form(default=None),
    images: List[UploadFile] = File(default=[]),
    image: Optional[UploadFile] = File(default=None),
    voice_recording: Optional[UploadFile] = File(default=None),
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    allowed_roles = {"citizen", "admin", "super_admin"}
    if current_user.role not in allowed_roles:
        raise HTTPException(status_code=403, detail="You are not allowed to submit complaints")

    user = db.query(User).filter(User.id == current_user.user_id, User.is_active.is_(True)).first()
    if not user:
        raise HTTPException(status_code=401, detail="Authenticated user not found")

    if not user.city_id:
        raise HTTPException(status_code=400, detail="User city is not configured")

    city = db.query(City).filter(City.id == user.city_id).first()
    if not city:
        raise HTTPException(status_code=400, detail="User city record not found")

    resolved_infra_type_id = infra_type_id
    if resolved_infra_type_id is None:
        first_infra_type = db.query(InfraType).order_by(InfraType.created_at.asc()).first()
        if not first_infra_type:
            raise HTTPException(status_code=400, detail="No infra type configured in system")
        resolved_infra_type_id = first_infra_type.id

    resolved_description = (description or text or "").strip()
    if not resolved_description:
        raise HTTPException(status_code=400, detail="Complaint description is required")

    resolved_title = (title or resolved_description[:120]).strip()

    all_images = list(images)
    if image is not None:
        all_images.append(image)

    suggested_dept_ids = []
    if agent_suggested_dept_ids:
        suggested_dept_ids = [item.strip() for item in agent_suggested_dept_ids.split(",") if item.strip()]

    request = ComplaintIngestRequest(
        citizen_id=current_user.user_id,
        city_id=user.city_id,
        city_code=city.city_code,
        title=resolved_title,
        description=resolved_description,
        original_language=original_language,
        lat=lat,
        lng=lng,
        infra_type_id=resolved_infra_type_id,
        address_text=address_text,
        infra_name=infra_name,
        priority=priority,
        voice_transcript=voice_transcript,
        agent_summary=agent_summary,
        agent_priority_reason=agent_priority_reason,
        agent_suggested_dept_ids=suggested_dept_ids,
        embedding_model=embedding_model,
        images=all_images,
        voice_recording=voice_recording,
    )

    return await ingest_complaint_service(db, request)

```

#### backend/schemas.py
`$lang
from typing import List, Optional
from uuid import UUID

from fastapi import UploadFile
from pydantic import BaseModel, ConfigDict, Field

class ComplaintCreate(BaseModel):
    text: str
    lat: float
    lng: float
    photo_url: Optional[str] = None


class ComplaintIngestRequest(BaseModel):
    model_config = ConfigDict(arbitrary_types_allowed=True)

    citizen_id: UUID
    city_id: UUID
    city_code: str
    title: str
    description: str
    original_language: str
    lat: float = Field(ge=-90, le=90)
    lng: float = Field(ge=-180, le=180)
    infra_type_id: UUID

    address_text: Optional[str] = None
    infra_name: Optional[str] = None
    priority: Optional[str] = "normal"
    voice_transcript: Optional[str] = None
    agent_summary: Optional[str] = None
    agent_priority_reason: Optional[str] = None
    agent_suggested_dept_ids: Optional[List[str]] = None
    embedding_model: Optional[str] = "nomic-embed-text-v1.5"

    images: List[UploadFile] = Field(default_factory=list)
    voice_recording: Optional[UploadFile] = None


class ComplaintIngestResponse(BaseModel):
    complaint_id: UUID
    complaint_number: str
    infra_node_id: UUID
    workflow_instance_id: Optional[UUID]
    is_repeat_complaint: bool
    is_new_infra_node: bool
    repeat_gap_days: Optional[int]
    jurisdiction_id: Optional[UUID]

class ComplaintResponse(BaseModel):
    id: int
    status: str
    message: str


class SignUpRequest(BaseModel):
    full_name: str
    email: str
    password: str
    city_code: Optional[str] = None
    preferred_language: Optional[str] = "hi"


class SignInRequest(BaseModel):
    email: str
    password: str


class AuthResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    expires_in: int
    user_id: UUID
    role: str
    email: str
    full_name: str


class TokenData(BaseModel):
    user_id: UUID
    role: str
    
class SurveySubmit(BaseModel):

    complaint_id: int
    rating: int
    comment: str
    

class AssistantQuery(BaseModel):
    query: str
```

## 6. Configuration and Environment Full code of settings/config file, every environment variable used, how GCP credentials are handled

#### backend/config.py
`$lang
from pydantic_settings import BaseSettings
from typing import Optional

class Settings(BaseSettings):
    DATABASE_URL: str
    GEMINI_API_KEY: str
    NOMIC_API_KEY: str
    GROQ_API_KEY: str
    AUTH_JWT_SECRET: str
    AUTH_JWT_ALGORITHM: str = "HS256"
    AUTH_ACCESS_TOKEN_EXPIRE_MINUTES: int = 60
    SUPABASE_JWT_SECRET: Optional[str] = None
    GCS_ENABLED: bool = False
    GCS_BUCKET_NAME: Optional[str] = None
    GCS_PROJECT_ID: Optional[str] = None
    GCS_UPLOAD_PREFIX: str = "complaints"
    GCS_EMBEDDINGS_PREFIX: str = "embeddings"
    GCS_STRICT_MODE: bool = False

    class Config:
        env_file = ".env"

settings = Settings()
```

#### backend/main.py
`$lang
# backend/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes import complaint_router, auth_router


app = FastAPI(
    title="PSCRM Civic Intelligence API",
    description="Multi-Agent Event-Driven Civic Infrastructure Platform",
    version="1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(complaint_router.router)
app.include_router(auth_router.router)

@app.get("/")
def root():
    return {"status": "online", "message": "PSCRM Core Nervous System Active"}
```

#### backend/services/storage_service.py
`$lang
from pathlib import Path
import logging
import json
from typing import Dict, Optional
from uuid import uuid4

from google.cloud import storage

from config import settings

BASE_DIR = Path(__file__).resolve().parents[1]
UPLOADS_DIR = BASE_DIR / "data" / "uploads"
EMBEDDINGS_DIR = BASE_DIR / "data" / "embeddings"
logger = logging.getLogger(__name__)


def _ensure_uploads_dir() -> None:
    UPLOADS_DIR.mkdir(parents=True, exist_ok=True)


def _ensure_embeddings_dir() -> None:
    EMBEDDINGS_DIR.mkdir(parents=True, exist_ok=True)


def _local_save(content: bytes, filename: str) -> str:
    _ensure_uploads_dir()
    suffix = Path(filename or "upload.bin").suffix
    path = UPLOADS_DIR / f"{uuid4()}{suffix}"
    path.write_bytes(content)
    return str(path)


def _gcs_upload(content: bytes, filename: str, content_type: Optional[str]) -> str:
    bucket_name = settings.GCS_BUCKET_NAME
    if not bucket_name:
        raise ValueError("GCS_BUCKET_NAME is not configured")

    suffix = Path(filename or "upload.bin").suffix
    object_name = f"{settings.GCS_UPLOAD_PREFIX}/{uuid4()}{suffix}"

    client = storage.Client(project=settings.GCS_PROJECT_ID)
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(object_name)
    blob.upload_from_string(content, content_type=content_type or "application/octet-stream")

    return f"https://storage.googleapis.com/{bucket_name}/{object_name}"


def _gcs_upload_with_object_name(content: bytes, object_name: str, content_type: Optional[str]) -> str:
    bucket_name = settings.GCS_BUCKET_NAME
    if not bucket_name:
        raise ValueError("GCS_BUCKET_NAME is not configured")

    client = storage.Client(project=settings.GCS_PROJECT_ID)
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(object_name)
    blob.upload_from_string(content, content_type=content_type or "application/octet-stream")

    return f"https://storage.googleapis.com/{bucket_name}/{object_name}"


def save_upload(content: bytes, filename: str, content_type: Optional[str]) -> Dict[str, str]:
    """Save upload locally for immediate processing, and optionally mirror to GCS."""
    local_path = _local_save(content, filename)

    if settings.GCS_ENABLED and settings.GCS_BUCKET_NAME:
        try:
            remote_url = _gcs_upload(content, filename, content_type)
            return {
                "local_path": local_path,
                "url": remote_url,
                "storage": "gcs",
            }
        except Exception as exc:
            if settings.GCS_STRICT_MODE:
                raise
            logger.warning("GCS upload failed, falling back to local storage: %s", exc)

    return {
        "local_path": local_path,
        "url": local_path,
        "storage": "local",
    }


def save_embedding_artifact(complaint_id: str, payload: Dict[str, object]) -> Dict[str, str]:
    """Persist embedding payload to local disk and optionally mirror it to GCS."""
    _ensure_embeddings_dir()
    local_path = EMBEDDINGS_DIR / f"{complaint_id}.json"
    content = json.dumps(payload, ensure_ascii=True).encode("utf-8")
    local_path.write_bytes(content)

    if settings.GCS_ENABLED and settings.GCS_BUCKET_NAME:
        object_name = f"{settings.GCS_EMBEDDINGS_PREFIX}/{complaint_id}.json"
        try:
            remote_url = _gcs_upload_with_object_name(content, object_name, "application/json")
            return {
                "local_path": str(local_path),
                "url": remote_url,
                "storage": "gcs",
            }
        except Exception as exc:
            if settings.GCS_STRICT_MODE:
                raise
            logger.warning("Embedding artifact upload failed, falling back to local storage: %s", exc)

    return {
        "local_path": str(local_path),
        "url": str(local_path),
        "storage": "local",
    }

```

#### backend/services/complaint_service.py
`$lang
import json
import logging
from typing import Dict, Iterable, List, Optional
from uuid import UUID

from google import genai
from fastapi import HTTPException
from sqlalchemy import text
from sqlalchemy.orm import Session

from config import settings
from schemas import ComplaintIngestRequest, ComplaintIngestResponse
from services.embedding_service import create_complaint_embeddings
from services.storage_service import save_embedding_artifact, save_upload

logger = logging.getLogger(__name__)


def get_complaint_by_id(
    db: Session,
    complaint_id: UUID,
    current_user_id: UUID,
    current_user_role: str,
) -> Dict[str, object]:
    row = db.execute(
        text(
            """
            SELECT
                id,
                complaint_number,
                citizen_id,
                city_id,
                jurisdiction_id,
                infra_node_id,
                workflow_instance_id,
                title,
                description,
                original_language,
                translated_description,
                address_text,
                images,
                status,
                priority,
                is_repeat_complaint,
                repeat_gap_days,
                created_at,
                updated_at
            FROM complaints
            WHERE id = CAST(:complaint_id AS uuid)
              AND is_deleted = false
            """
        ),
        {"complaint_id": str(complaint_id)},
    ).mappings().first()

    if row is None:
        raise HTTPException(status_code=404, detail="Complaint not found")

    if current_user_role == "citizen" and str(row["citizen_id"]) != str(current_user_id):
        raise HTTPException(status_code=403, detail="You are not allowed to view this complaint")

    return {
        "id": str(row["id"]),
        "complaint_number": row["complaint_number"],
        "citizen_id": str(row["citizen_id"]),
        "city_id": str(row["city_id"]),
        "jurisdiction_id": str(row["jurisdiction_id"]) if row["jurisdiction_id"] else None,
        "infra_node_id": str(row["infra_node_id"]) if row["infra_node_id"] else None,
        "workflow_instance_id": str(row["workflow_instance_id"]) if row["workflow_instance_id"] else None,
        "title": row["title"],
        "description": row["description"],
        "original_language": row["original_language"],
        "translated_description": row["translated_description"],
        "address_text": row["address_text"],
        "images": row["images"] or [],
        "status": row["status"],
        "priority": row["priority"],
        "is_repeat_complaint": bool(row["is_repeat_complaint"]),
        "repeat_gap_days": row["repeat_gap_days"],
        "created_at": row["created_at"].isoformat() if row["created_at"] else None,
        "updated_at": row["updated_at"].isoformat() if row["updated_at"] else None,
    }


def _vector_literal(values: Optional[Iterable[float]]) -> Optional[str]:
    if values is None:
        return None
    return "[" + ",".join(str(float(v)) for v in values) + "]"


def _uuid_array_literal(values: Optional[List[str]]) -> str:
    if not values:
        return "{}"
    return "{" + ",".join(values) + "}"


def _translate_to_english(description: str, original_language: str) -> str:
    if original_language.lower().startswith("en"):
        return description

    try:
        client = genai.Client(api_key=settings.GEMINI_API_KEY)
        prompt = (
            "Translate this complaint to English and return only translated text.\n"
            f"Language: {original_language}\n"
            f"Complaint: {description}"
        )
        response = client.models.generate_content(model="gemini-2.5-flash", contents=prompt)
        translated = (response.text or "").strip()
        if translated:
            return translated
        logger.warning("Gemini translation returned empty text; using original description")
    except Exception as exc:
        logger.warning("Gemini translation failed; using original description: %s", exc)

    return description


def _insert_domain_event(
    db: Session,
    *,
    event_type: str,
    complaint_id: str,
    citizen_id: str,
    city_id: str,
    payload: Dict[str, object],
) -> None:
    db.execute(
        text(
            """
            INSERT INTO domain_events (
                event_type,
                entity_type,
                entity_id,
                actor_id,
                actor_type,
                complaint_id,
                city_id,
                payload
            )
            VALUES (
                :event_type,
                'complaint',
                CAST(:entity_id AS uuid),
                CAST(:actor_id AS uuid),
                'user',
                CAST(:complaint_id AS uuid),
                CAST(:city_id AS uuid),
                CAST(:payload AS jsonb)
            )
            """
        ),
        {
            "event_type": event_type,
            "entity_id": complaint_id,
            "actor_id": citizen_id,
            "complaint_id": complaint_id,
            "city_id": city_id,
            "payload": json.dumps(payload),
        },
    )


async def ingest_complaint(db: Session, request: ComplaintIngestRequest) -> ComplaintIngestResponse:
    images_payload: List[Dict[str, str]] = []
    primary_image_local_path: Optional[str] = None

    for upload in request.images:
        content = await upload.read()
        if not content:
            continue

        saved = save_upload(content, upload.filename or "image.bin", upload.content_type)
        if primary_image_local_path is None:
            primary_image_local_path = saved["local_path"]

        images_payload.append(
            {
                "url": saved["url"],
                "storage": saved["storage"],
                "mime_type": upload.content_type or "application/octet-stream",
            }
        )

    voice_recording_url = None
    if request.voice_recording is not None:
        voice_content = await request.voice_recording.read()
        if voice_content:
            saved_voice = save_upload(
                voice_content,
                request.voice_recording.filename or "voice.bin",
                request.voice_recording.content_type,
            )
            voice_recording_url = saved_voice["url"]

    translated_description = _translate_to_english(request.description, request.original_language)
    embeddings = create_complaint_embeddings(translated_description, primary_image_local_path)
    text_embedding = embeddings["text_embedding"]
    image_embedding = embeddings["image_embedding"]

    if text_embedding is None:
        raise ValueError("Text embedding is required and cannot be null")

    params = {
        "p_citizen_id": str(request.citizen_id),
        "p_city_id": str(request.city_id),
        "p_city_code": request.city_code,
        "p_title": request.title,
        "p_description": request.description,
        "p_original_language": request.original_language,
        "p_translated_description": translated_description,
        "p_lat": request.lat,
        "p_lng": request.lng,
        "p_address_text": request.address_text,
        "p_images": json.dumps(images_payload),
        "p_voice_recording_url": voice_recording_url,
        "p_voice_transcript": request.voice_transcript,
        "p_infra_type_id": str(request.infra_type_id),
        "p_infra_name": request.infra_name,
        "p_text_embedding": _vector_literal(text_embedding),
        "p_image_embedding": _vector_literal(image_embedding),
        "p_embedding_model": request.embedding_model or "nomic-embed-text-v1.5",
        "p_priority": request.priority,
        "p_agent_summary": request.agent_summary,
        "p_agent_priority_reason": request.agent_priority_reason,
        "p_agent_suggested_dept_ids": _uuid_array_literal(request.agent_suggested_dept_ids),
    }

    result = db.execute(
        text(
            """
            SELECT * FROM fn_ingest_complaint(
                CAST(:p_citizen_id AS uuid), CAST(:p_city_id AS uuid), :p_city_code,
                :p_title, :p_description, :p_original_language, :p_translated_description,
                :p_lat, :p_lng, :p_address_text,
                CAST(:p_images AS jsonb), :p_voice_recording_url, :p_voice_transcript,
                CAST(:p_infra_type_id AS uuid), :p_infra_name,
                CAST(:p_text_embedding AS vector(768)), CAST(:p_image_embedding AS vector(768)),
                :p_embedding_model,
                :p_priority, :p_agent_summary, :p_agent_priority_reason,
                CAST(:p_agent_suggested_dept_ids AS uuid[])
            )
            """
        ),
        params,
    )
    row = result.mappings().first()
    if row is None:
        raise ValueError("fn_ingest_complaint returned no row")

    complaint_id = str(row["complaint_id"])

    embedding_artifact = save_embedding_artifact(
        complaint_id,
        {
            "complaint_id": complaint_id,
            "embedding_model": request.embedding_model or "nomic-embed-text-v1.5",
            "translated_description": translated_description,
            "text_embedding": text_embedding,
            "image_embedding": image_embedding,
        },
    )

    city_id = str(request.city_id)
    citizen_id = str(request.citizen_id)
    payload = {
        "complaint_id": complaint_id,
        "complaint_number": str(row["complaint_number"]),
        "infra_node_id": str(row["infra_node_id"]),
        "workflow_instance_id": str(row["workflow_instance_id"]) if row["workflow_instance_id"] else None,
        "is_new_infra_node": bool(row["is_new_infra_node"]),
        "is_repeat_complaint": bool(row["is_repeat_complaint"]),
        "repeat_gap_days": row["repeat_gap_days"],
        "jurisdiction_id": str(row["jurisdiction_id"]),
        "embedding_artifact_url": embedding_artifact["url"],
        "embedding_artifact_storage": embedding_artifact["storage"],
    }

    if row["workflow_instance_id"] is None:
        _insert_domain_event(
            db,
            event_type="WORKFLOW_INSTANCE_REQUIRED",
            complaint_id=complaint_id,
            citizen_id=citizen_id,
            city_id=city_id,
            payload=payload,
        )

    if bool(row["is_repeat_complaint"]):
        _insert_domain_event(
            db,
            event_type="REPEAT_COMPLAINT_NOTIFICATION_QUEUED",
            complaint_id=complaint_id,
            citizen_id=citizen_id,
            city_id=city_id,
            payload=payload,
        )

    if bool(row["is_new_infra_node"]):
        _insert_domain_event(
            db,
            event_type="NEW_INFRA_NODE_DETECTED",
            complaint_id=complaint_id,
            citizen_id=citizen_id,
            city_id=city_id,
            payload=payload,
        )

    db.commit()

    return ComplaintIngestResponse(
        complaint_id=row["complaint_id"],
        complaint_number=row["complaint_number"],
        infra_node_id=row["infra_node_id"],
        workflow_instance_id=row["workflow_instance_id"],
        is_repeat_complaint=row["is_repeat_complaint"],
        is_new_infra_node=row["is_new_infra_node"],
        repeat_gap_days=row["repeat_gap_days"],
        jurisdiction_id=row["jurisdiction_id"],
    )

```

#### backend/.env
`$lang

GEMINI_API_KEY="AIzaSyAPg9_3nA_0QqXe1bPneAglwRm6h5lJX9A"

NOMIC_API_KEY="nk-Kv4rFqhOiHWbRv3slz_tFYtuX0dnmv0CmzIhwTJmF8I"

GROQ_API_KEY="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"


DATABASE_URL=postgresql+psycopg2://postgres:Ayushp%40thaK12@34.131.142.234:5432/pscrm

AUTH_JWT_SECRET="psrm_auth_jwt_change_this_to_a_long_random_secret_2026"
AUTH_JWT_ALGORITHM="HS256"
AUTH_ACCESS_TOKEN_EXPIRE_MINUTES=60

GCS_ENABLED=false
GCS_BUCKET_NAME="pscrm_complaint_images"
GCS_UPLOAD_PREFIX="complaints"
GCS_PROJECT_ID="steam-form-482109-s6"
GCS_EMBEDDINGS_PREFIX="embeddings"
GCS_STRICT_MODE=false
```

#### frontend/.env
`$lang

```

## 7. Any Storage or File Handling Code Full code of anything related to file upload, storage, GCS, even if incomplete or placeholder

#### backend/services/storage_service.py
`$lang
from pathlib import Path
import logging
import json
from typing import Dict, Optional
from uuid import uuid4

from google.cloud import storage

from config import settings

BASE_DIR = Path(__file__).resolve().parents[1]
UPLOADS_DIR = BASE_DIR / "data" / "uploads"
EMBEDDINGS_DIR = BASE_DIR / "data" / "embeddings"
logger = logging.getLogger(__name__)


def _ensure_uploads_dir() -> None:
    UPLOADS_DIR.mkdir(parents=True, exist_ok=True)


def _ensure_embeddings_dir() -> None:
    EMBEDDINGS_DIR.mkdir(parents=True, exist_ok=True)


def _local_save(content: bytes, filename: str) -> str:
    _ensure_uploads_dir()
    suffix = Path(filename or "upload.bin").suffix
    path = UPLOADS_DIR / f"{uuid4()}{suffix}"
    path.write_bytes(content)
    return str(path)


def _gcs_upload(content: bytes, filename: str, content_type: Optional[str]) -> str:
    bucket_name = settings.GCS_BUCKET_NAME
    if not bucket_name:
        raise ValueError("GCS_BUCKET_NAME is not configured")

    suffix = Path(filename or "upload.bin").suffix
    object_name = f"{settings.GCS_UPLOAD_PREFIX}/{uuid4()}{suffix}"

    client = storage.Client(project=settings.GCS_PROJECT_ID)
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(object_name)
    blob.upload_from_string(content, content_type=content_type or "application/octet-stream")

    return f"https://storage.googleapis.com/{bucket_name}/{object_name}"


def _gcs_upload_with_object_name(content: bytes, object_name: str, content_type: Optional[str]) -> str:
    bucket_name = settings.GCS_BUCKET_NAME
    if not bucket_name:
        raise ValueError("GCS_BUCKET_NAME is not configured")

    client = storage.Client(project=settings.GCS_PROJECT_ID)
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(object_name)
    blob.upload_from_string(content, content_type=content_type or "application/octet-stream")

    return f"https://storage.googleapis.com/{bucket_name}/{object_name}"


def save_upload(content: bytes, filename: str, content_type: Optional[str]) -> Dict[str, str]:
    """Save upload locally for immediate processing, and optionally mirror to GCS."""
    local_path = _local_save(content, filename)

    if settings.GCS_ENABLED and settings.GCS_BUCKET_NAME:
        try:
            remote_url = _gcs_upload(content, filename, content_type)
            return {
                "local_path": local_path,
                "url": remote_url,
                "storage": "gcs",
            }
        except Exception as exc:
            if settings.GCS_STRICT_MODE:
                raise
            logger.warning("GCS upload failed, falling back to local storage: %s", exc)

    return {
        "local_path": local_path,
        "url": local_path,
        "storage": "local",
    }


def save_embedding_artifact(complaint_id: str, payload: Dict[str, object]) -> Dict[str, str]:
    """Persist embedding payload to local disk and optionally mirror it to GCS."""
    _ensure_embeddings_dir()
    local_path = EMBEDDINGS_DIR / f"{complaint_id}.json"
    content = json.dumps(payload, ensure_ascii=True).encode("utf-8")
    local_path.write_bytes(content)

    if settings.GCS_ENABLED and settings.GCS_BUCKET_NAME:
        object_name = f"{settings.GCS_EMBEDDINGS_PREFIX}/{complaint_id}.json"
        try:
            remote_url = _gcs_upload_with_object_name(content, object_name, "application/json")
            return {
                "local_path": str(local_path),
                "url": remote_url,
                "storage": "gcs",
            }
        except Exception as exc:
            if settings.GCS_STRICT_MODE:
                raise
            logger.warning("Embedding artifact upload failed, falling back to local storage: %s", exc)

    return {
        "local_path": str(local_path),
        "url": str(local_path),
        "storage": "local",
    }

```

#### backend/services/complaint_service.py
`$lang
import json
import logging
from typing import Dict, Iterable, List, Optional
from uuid import UUID

from google import genai
from fastapi import HTTPException
from sqlalchemy import text
from sqlalchemy.orm import Session

from config import settings
from schemas import ComplaintIngestRequest, ComplaintIngestResponse
from services.embedding_service import create_complaint_embeddings
from services.storage_service import save_embedding_artifact, save_upload

logger = logging.getLogger(__name__)


def get_complaint_by_id(
    db: Session,
    complaint_id: UUID,
    current_user_id: UUID,
    current_user_role: str,
) -> Dict[str, object]:
    row = db.execute(
        text(
            """
            SELECT
                id,
                complaint_number,
                citizen_id,
                city_id,
                jurisdiction_id,
                infra_node_id,
                workflow_instance_id,
                title,
                description,
                original_language,
                translated_description,
                address_text,
                images,
                status,
                priority,
                is_repeat_complaint,
                repeat_gap_days,
                created_at,
                updated_at
            FROM complaints
            WHERE id = CAST(:complaint_id AS uuid)
              AND is_deleted = false
            """
        ),
        {"complaint_id": str(complaint_id)},
    ).mappings().first()

    if row is None:
        raise HTTPException(status_code=404, detail="Complaint not found")

    if current_user_role == "citizen" and str(row["citizen_id"]) != str(current_user_id):
        raise HTTPException(status_code=403, detail="You are not allowed to view this complaint")

    return {
        "id": str(row["id"]),
        "complaint_number": row["complaint_number"],
        "citizen_id": str(row["citizen_id"]),
        "city_id": str(row["city_id"]),
        "jurisdiction_id": str(row["jurisdiction_id"]) if row["jurisdiction_id"] else None,
        "infra_node_id": str(row["infra_node_id"]) if row["infra_node_id"] else None,
        "workflow_instance_id": str(row["workflow_instance_id"]) if row["workflow_instance_id"] else None,
        "title": row["title"],
        "description": row["description"],
        "original_language": row["original_language"],
        "translated_description": row["translated_description"],
        "address_text": row["address_text"],
        "images": row["images"] or [],
        "status": row["status"],
        "priority": row["priority"],
        "is_repeat_complaint": bool(row["is_repeat_complaint"]),
        "repeat_gap_days": row["repeat_gap_days"],
        "created_at": row["created_at"].isoformat() if row["created_at"] else None,
        "updated_at": row["updated_at"].isoformat() if row["updated_at"] else None,
    }


def _vector_literal(values: Optional[Iterable[float]]) -> Optional[str]:
    if values is None:
        return None
    return "[" + ",".join(str(float(v)) for v in values) + "]"


def _uuid_array_literal(values: Optional[List[str]]) -> str:
    if not values:
        return "{}"
    return "{" + ",".join(values) + "}"


def _translate_to_english(description: str, original_language: str) -> str:
    if original_language.lower().startswith("en"):
        return description

    try:
        client = genai.Client(api_key=settings.GEMINI_API_KEY)
        prompt = (
            "Translate this complaint to English and return only translated text.\n"
            f"Language: {original_language}\n"
            f"Complaint: {description}"
        )
        response = client.models.generate_content(model="gemini-2.5-flash", contents=prompt)
        translated = (response.text or "").strip()
        if translated:
            return translated
        logger.warning("Gemini translation returned empty text; using original description")
    except Exception as exc:
        logger.warning("Gemini translation failed; using original description: %s", exc)

    return description


def _insert_domain_event(
    db: Session,
    *,
    event_type: str,
    complaint_id: str,
    citizen_id: str,
    city_id: str,
    payload: Dict[str, object],
) -> None:
    db.execute(
        text(
            """
            INSERT INTO domain_events (
                event_type,
                entity_type,
                entity_id,
                actor_id,
                actor_type,
                complaint_id,
                city_id,
                payload
            )
            VALUES (
                :event_type,
                'complaint',
                CAST(:entity_id AS uuid),
                CAST(:actor_id AS uuid),
                'user',
                CAST(:complaint_id AS uuid),
                CAST(:city_id AS uuid),
                CAST(:payload AS jsonb)
            )
            """
        ),
        {
            "event_type": event_type,
            "entity_id": complaint_id,
            "actor_id": citizen_id,
            "complaint_id": complaint_id,
            "city_id": city_id,
            "payload": json.dumps(payload),
        },
    )


async def ingest_complaint(db: Session, request: ComplaintIngestRequest) -> ComplaintIngestResponse:
    images_payload: List[Dict[str, str]] = []
    primary_image_local_path: Optional[str] = None

    for upload in request.images:
        content = await upload.read()
        if not content:
            continue

        saved = save_upload(content, upload.filename or "image.bin", upload.content_type)
        if primary_image_local_path is None:
            primary_image_local_path = saved["local_path"]

        images_payload.append(
            {
                "url": saved["url"],
                "storage": saved["storage"],
                "mime_type": upload.content_type or "application/octet-stream",
            }
        )

    voice_recording_url = None
    if request.voice_recording is not None:
        voice_content = await request.voice_recording.read()
        if voice_content:
            saved_voice = save_upload(
                voice_content,
                request.voice_recording.filename or "voice.bin",
                request.voice_recording.content_type,
            )
            voice_recording_url = saved_voice["url"]

    translated_description = _translate_to_english(request.description, request.original_language)
    embeddings = create_complaint_embeddings(translated_description, primary_image_local_path)
    text_embedding = embeddings["text_embedding"]
    image_embedding = embeddings["image_embedding"]

    if text_embedding is None:
        raise ValueError("Text embedding is required and cannot be null")

    params = {
        "p_citizen_id": str(request.citizen_id),
        "p_city_id": str(request.city_id),
        "p_city_code": request.city_code,
        "p_title": request.title,
        "p_description": request.description,
        "p_original_language": request.original_language,
        "p_translated_description": translated_description,
        "p_lat": request.lat,
        "p_lng": request.lng,
        "p_address_text": request.address_text,
        "p_images": json.dumps(images_payload),
        "p_voice_recording_url": voice_recording_url,
        "p_voice_transcript": request.voice_transcript,
        "p_infra_type_id": str(request.infra_type_id),
        "p_infra_name": request.infra_name,
        "p_text_embedding": _vector_literal(text_embedding),
        "p_image_embedding": _vector_literal(image_embedding),
        "p_embedding_model": request.embedding_model or "nomic-embed-text-v1.5",
        "p_priority": request.priority,
        "p_agent_summary": request.agent_summary,
        "p_agent_priority_reason": request.agent_priority_reason,
        "p_agent_suggested_dept_ids": _uuid_array_literal(request.agent_suggested_dept_ids),
    }

    result = db.execute(
        text(
            """
            SELECT * FROM fn_ingest_complaint(
                CAST(:p_citizen_id AS uuid), CAST(:p_city_id AS uuid), :p_city_code,
                :p_title, :p_description, :p_original_language, :p_translated_description,
                :p_lat, :p_lng, :p_address_text,
                CAST(:p_images AS jsonb), :p_voice_recording_url, :p_voice_transcript,
                CAST(:p_infra_type_id AS uuid), :p_infra_name,
                CAST(:p_text_embedding AS vector(768)), CAST(:p_image_embedding AS vector(768)),
                :p_embedding_model,
                :p_priority, :p_agent_summary, :p_agent_priority_reason,
                CAST(:p_agent_suggested_dept_ids AS uuid[])
            )
            """
        ),
        params,
    )
    row = result.mappings().first()
    if row is None:
        raise ValueError("fn_ingest_complaint returned no row")

    complaint_id = str(row["complaint_id"])

    embedding_artifact = save_embedding_artifact(
        complaint_id,
        {
            "complaint_id": complaint_id,
            "embedding_model": request.embedding_model or "nomic-embed-text-v1.5",
            "translated_description": translated_description,
            "text_embedding": text_embedding,
            "image_embedding": image_embedding,
        },
    )

    city_id = str(request.city_id)
    citizen_id = str(request.citizen_id)
    payload = {
        "complaint_id": complaint_id,
        "complaint_number": str(row["complaint_number"]),
        "infra_node_id": str(row["infra_node_id"]),
        "workflow_instance_id": str(row["workflow_instance_id"]) if row["workflow_instance_id"] else None,
        "is_new_infra_node": bool(row["is_new_infra_node"]),
        "is_repeat_complaint": bool(row["is_repeat_complaint"]),
        "repeat_gap_days": row["repeat_gap_days"],
        "jurisdiction_id": str(row["jurisdiction_id"]),
        "embedding_artifact_url": embedding_artifact["url"],
        "embedding_artifact_storage": embedding_artifact["storage"],
    }

    if row["workflow_instance_id"] is None:
        _insert_domain_event(
            db,
            event_type="WORKFLOW_INSTANCE_REQUIRED",
            complaint_id=complaint_id,
            citizen_id=citizen_id,
            city_id=city_id,
            payload=payload,
        )

    if bool(row["is_repeat_complaint"]):
        _insert_domain_event(
            db,
            event_type="REPEAT_COMPLAINT_NOTIFICATION_QUEUED",
            complaint_id=complaint_id,
            citizen_id=citizen_id,
            city_id=city_id,
            payload=payload,
        )

    if bool(row["is_new_infra_node"]):
        _insert_domain_event(
            db,
            event_type="NEW_INFRA_NODE_DETECTED",
            complaint_id=complaint_id,
            citizen_id=citizen_id,
            city_id=city_id,
            payload=payload,
        )

    db.commit()

    return ComplaintIngestResponse(
        complaint_id=row["complaint_id"],
        complaint_number=row["complaint_number"],
        infra_node_id=row["infra_node_id"],
        workflow_instance_id=row["workflow_instance_id"],
        is_repeat_complaint=row["is_repeat_complaint"],
        is_new_infra_node=row["is_new_infra_node"],
        repeat_gap_days=row["repeat_gap_days"],
        jurisdiction_id=row["jurisdiction_id"],
    )

```

#### backend/services/embedding_service.py
`$lang
import os
from pathlib import Path
from typing import Any, Dict, List, Optional

import numpy as np
from nomic import embed
from PIL import Image

from config import settings

TEXT_MODEL = "nomic-embed-text-v1.5"
IMAGE_MODEL = "nomic-embed-vision-v1.5"
EMBEDDING_DIMENSIONALITY = 768


def _ensure_nomic_api_key() -> None:
    os.environ["NOMIC_API_KEY"] = settings.NOMIC_API_KEY


def _extract_first_embedding(result: Dict[str, Any]) -> List[float]:
    vectors = result.get("embeddings")
    if not vectors:
        raise ValueError("No embeddings returned by model")
    return np.array(vectors)[0].tolist()


def create_text_embedding_vector(text: str) -> List[float]:
    _ensure_nomic_api_key()
    output = embed.text(
        texts=[text],
        model=TEXT_MODEL,
        task_type="search_document",
        dimensionality=EMBEDDING_DIMENSIONALITY,
    )
    vector = _extract_first_embedding(output)
    if len(vector) != EMBEDDING_DIMENSIONALITY:
        raise ValueError("Text embedding dimensionality mismatch")
    return vector


def create_image_embedding_vector(image_path: str) -> List[float]:
    _ensure_nomic_api_key()
    path = Path(image_path)
    if not path.exists():
        raise FileNotFoundError(f"Image not found: {image_path}")

    with Image.open(path) as img:
        output = embed.image(
            images=[img.convert("RGB")],
            model=IMAGE_MODEL,
        )

    vector = _extract_first_embedding(output)
    if len(vector) != EMBEDDING_DIMENSIONALITY:
        raise ValueError("Image embedding dimensionality mismatch")
    return vector


def create_complaint_embeddings(
    translated_description: str,
    primary_image_path: Optional[str],
) -> Dict[str, Optional[List[float]]]:
    text_embedding = create_text_embedding_vector(translated_description)
    image_embedding = None
    if primary_image_path:
        image_embedding = create_image_embedding_vector(primary_image_path)

    return {
        "text_embedding": text_embedding,
        "image_embedding": image_embedding,
    }
```

#### backend/routes/complaint_router.py
`$lang
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, File, Form, HTTPException, UploadFile
from sqlalchemy.orm import Session

from db import get_db
from dependencies import get_current_user
from models import City, InfraType, User
from schemas import ComplaintIngestRequest, ComplaintIngestResponse, TokenData
from services.complaint_service import (
    get_complaint_by_id as get_complaint_by_id_service,
    ingest_complaint as ingest_complaint_service,
)

router = APIRouter(prefix="/complaints", tags=["Complaints"])


@router.get("/{complaint_id}")
def get_complaint_by_id(
    complaint_id: UUID,
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    return get_complaint_by_id_service(
        db=db,
        complaint_id=complaint_id,
        current_user_id=current_user.user_id,
        current_user_role=current_user.role,
    )

@router.post("/ingest", response_model=ComplaintIngestResponse)
async def ingest_complaint(
    title: Optional[str] = Form(default=None),
    text: Optional[str] = Form(default=None),
    description: Optional[str] = Form(default=None),
    original_language: str = Form("en"),
    lat: float = Form(...),
    lng: float = Form(...),
    infra_type_id: Optional[UUID] = Form(default=None),
    address_text: Optional[str] = Form(default=None),
    infra_name: Optional[str] = Form(default=None),
    priority: str = Form(default="normal"),
    voice_transcript: Optional[str] = Form(default=None),
    agent_summary: Optional[str] = Form(default=None),
    agent_priority_reason: Optional[str] = Form(default=None),
    embedding_model: str = Form(default="nomic-embed-text-v1.5"),
    agent_suggested_dept_ids: Optional[str] = Form(default=None),
    images: List[UploadFile] = File(default=[]),
    image: Optional[UploadFile] = File(default=None),
    voice_recording: Optional[UploadFile] = File(default=None),
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    allowed_roles = {"citizen", "admin", "super_admin"}
    if current_user.role not in allowed_roles:
        raise HTTPException(status_code=403, detail="You are not allowed to submit complaints")

    user = db.query(User).filter(User.id == current_user.user_id, User.is_active.is_(True)).first()
    if not user:
        raise HTTPException(status_code=401, detail="Authenticated user not found")

    if not user.city_id:
        raise HTTPException(status_code=400, detail="User city is not configured")

    city = db.query(City).filter(City.id == user.city_id).first()
    if not city:
        raise HTTPException(status_code=400, detail="User city record not found")

    resolved_infra_type_id = infra_type_id
    if resolved_infra_type_id is None:
        first_infra_type = db.query(InfraType).order_by(InfraType.created_at.asc()).first()
        if not first_infra_type:
            raise HTTPException(status_code=400, detail="No infra type configured in system")
        resolved_infra_type_id = first_infra_type.id

    resolved_description = (description or text or "").strip()
    if not resolved_description:
        raise HTTPException(status_code=400, detail="Complaint description is required")

    resolved_title = (title or resolved_description[:120]).strip()

    all_images = list(images)
    if image is not None:
        all_images.append(image)

    suggested_dept_ids = []
    if agent_suggested_dept_ids:
        suggested_dept_ids = [item.strip() for item in agent_suggested_dept_ids.split(",") if item.strip()]

    request = ComplaintIngestRequest(
        citizen_id=current_user.user_id,
        city_id=user.city_id,
        city_code=city.city_code,
        title=resolved_title,
        description=resolved_description,
        original_language=original_language,
        lat=lat,
        lng=lng,
        infra_type_id=resolved_infra_type_id,
        address_text=address_text,
        infra_name=infra_name,
        priority=priority,
        voice_transcript=voice_transcript,
        agent_summary=agent_summary,
        agent_priority_reason=agent_priority_reason,
        agent_suggested_dept_ids=suggested_dept_ids,
        embedding_model=embedding_model,
        images=all_images,
        voice_recording=voice_recording,
    )

    return await ingest_complaint_service(db, request)

```

## 8. Dependencies Full contents of requirements.txt or pyproject.toml

#### backend/requirements.txt
`$lang
fastapi==0.135.1
uvicorn==0.41.0

# Validation and settings
pydantic==2.12.5
pydantic-settings==2.13.1
python-dotenv==1.2.2

# Auth and request handling
PyJWT==2.11.0
python-multipart==0.0.20

# Database
SQLAlchemy==2.0.48
psycopg2-binary==2.9.11
GeoAlchemy2==0.18.4
pgvector==0.4.2

# AI / embeddings / translation
google-genai==1.66.0
nomic==3.9.0
numpy==2.4.3
Pillow==12.1.1

# Object storage (optional, for bucket mode)
google-cloud-storage==3.4.1

```

#### frontend/package.json
`$lang
{
  "name": "psrm-frontend",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "axios": "^1.13.6",
    "leaflet": "^1.9.4",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "react-leaflet": "^5.0.0",
    "react-router-dom": "^7.9.0"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^5.0.0",
    "vite": "^7.1.7"
  }
}

```

#### frontend/package-lock.json
`$lang
{
  "name": "psrm-frontend",
  "version": "0.0.0",
  "lockfileVersion": 3,
  "requires": true,
  "packages": {
    "": {
      "name": "psrm-frontend",
      "version": "0.0.0",
      "dependencies": {
        "axios": "^1.13.6",
        "leaflet": "^1.9.4",
        "react": "^19.0.0",
        "react-dom": "^19.0.0",
        "react-leaflet": "^5.0.0",
        "react-router-dom": "^7.9.0"
      },
      "devDependencies": {
        "@vitejs/plugin-react": "^5.0.0",
        "vite": "^7.1.7"
      }
    },
    "node_modules/@babel/code-frame": {
      "version": "7.29.0",
      "resolved": "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.29.0.tgz",
      "integrity": "sha512-9NhCeYjq9+3uxgdtp20LSiJXJvN0FeCtNGpJxuMFZ1Kv3cWUNb6DOhJwUvcVCzKGR66cw4njwM6hrJLqgOwbcw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/helper-validator-identifier": "^7.28.5",
        "js-tokens": "^4.0.0",
        "picocolors": "^1.1.1"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/compat-data": {
      "version": "7.29.0",
      "resolved": "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.29.0.tgz",
      "integrity": "sha512-T1NCJqT/j9+cn8fvkt7jtwbLBfLC/1y1c7NtCeXFRgzGTsafi68MRv8yzkYSapBnFA6L3U2VSc02ciDzoAJhJg==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/core": {
      "version": "7.29.0",
      "resolved": "https://registry.npmjs.org/@babel/core/-/core-7.29.0.tgz",
      "integrity": "sha512-CGOfOJqWjg2qW/Mb6zNsDm+u5vFQ8DxXfbM09z69p5Z6+mE1ikP2jUXw+j42Pf1XTYED2Rni5f95npYeuwMDQA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/code-frame": "^7.29.0",
        "@babel/generator": "^7.29.0",
        "@babel/helper-compilation-targets": "^7.28.6",
        "@babel/helper-module-transforms": "^7.28.6",
        "@babel/helpers": "^7.28.6",
        "@babel/parser": "^7.29.0",
        "@babel/template": "^7.28.6",
        "@babel/traverse": "^7.29.0",
        "@babel/types": "^7.29.0",
        "@jridgewell/remapping": "^2.3.5",
        "convert-source-map": "^2.0.0",
        "debug": "^4.1.0",
        "gensync": "^1.0.0-beta.2",
        "json5": "^2.2.3",
        "semver": "^6.3.1"
      },
      "engines": {
        "node": ">=6.9.0"
      },
      "funding": {
        "type": "opencollective",
        "url": "https://opencollective.com/babel"
      }
    },
    "node_modules/@babel/generator": {
      "version": "7.29.1",
      "resolved": "https://registry.npmjs.org/@babel/generator/-/generator-7.29.1.tgz",
      "integrity": "sha512-qsaF+9Qcm2Qv8SRIMMscAvG4O3lJ0F1GuMo5HR/Bp02LopNgnZBC/EkbevHFeGs4ls/oPz9v+Bsmzbkbe+0dUw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/parser": "^7.29.0",
        "@babel/types": "^7.29.0",
        "@jridgewell/gen-mapping": "^0.3.12",
        "@jridgewell/trace-mapping": "^0.3.28",
        "jsesc": "^3.0.2"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-compilation-targets": {
      "version": "7.28.6",
      "resolved": "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.28.6.tgz",
      "integrity": "sha512-JYtls3hqi15fcx5GaSNL7SCTJ2MNmjrkHXg4FSpOA/grxK8KwyZ5bubHsCq8FXCkua6xhuaaBit+3b7+VZRfcA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/compat-data": "^7.28.6",
        "@babel/helper-validator-option": "^7.27.1",
        "browserslist": "^4.24.0",
        "lru-cache": "^5.1.1",
        "semver": "^6.3.1"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-globals": {
      "version": "7.28.0",
      "resolved": "https://registry.npmjs.org/@babel/helper-globals/-/helper-globals-7.28.0.tgz",
      "integrity": "sha512-+W6cISkXFa1jXsDEdYA8HeevQT/FULhxzR99pxphltZcVaugps53THCeiWA8SguxxpSp3gKPiuYfSWopkLQ4hw==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-module-imports": {
      "version": "7.28.6",
      "resolved": "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.28.6.tgz",
      "integrity": "sha512-l5XkZK7r7wa9LucGw9LwZyyCUscb4x37JWTPz7swwFE/0FMQAGpiWUZn8u9DzkSBWEcK25jmvubfpw2dnAMdbw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/traverse": "^7.28.6",
        "@babel/types": "^7.28.6"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-module-transforms": {
      "version": "7.28.6",
      "resolved": "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.28.6.tgz",
      "integrity": "sha512-67oXFAYr2cDLDVGLXTEABjdBJZ6drElUSI7WKp70NrpyISso3plG9SAGEF6y7zbha/wOzUByWWTJvEDVNIUGcA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/helper-module-imports": "^7.28.6",
        "@babel/helper-validator-identifier": "^7.28.5",
        "@babel/traverse": "^7.28.6"
      },
      "engines": {
        "node": ">=6.9.0"
      },
      "peerDependencies": {
        "@babel/core": "^7.0.0"
      }
    },
    "node_modules/@babel/helper-plugin-utils": {
      "version": "7.28.6",
      "resolved": "https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.28.6.tgz",
      "integrity": "sha512-S9gzZ/bz83GRysI7gAD4wPT/AI3uCnY+9xn+Mx/KPs2JwHJIz1W8PZkg2cqyt3RNOBM8ejcXhV6y8Og7ly/Dug==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-string-parser": {
      "version": "7.27.1",
      "resolved": "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.27.1.tgz",
      "integrity": "sha512-qMlSxKbpRlAridDExk92nSobyDdpPijUq2DW6oDnUqd0iOGxmQjyqhMIihI9+zv4LPyZdRje2cavWPbCbWm3eA==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-validator-identifier": {
      "version": "7.28.5",
      "resolved": "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.28.5.tgz",
      "integrity": "sha512-qSs4ifwzKJSV39ucNjsvc6WVHs6b7S03sOh2OcHF9UHfVPqWWALUsNUVzhSBiItjRZoLHx7nIarVjqKVusUZ1Q==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helper-validator-option": {
      "version": "7.27.1",
      "resolved": "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.27.1.tgz",
      "integrity": "sha512-YvjJow9FxbhFFKDSuFnVCe2WxXk1zWc22fFePVNEaWJEu8IrZVlda6N0uHwzZrUM1il7NC9Mlp4MaJYbYd9JSg==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/helpers": {
      "version": "7.29.2",
      "resolved": "https://registry.npmjs.org/@babel/helpers/-/helpers-7.29.2.tgz",
      "integrity": "sha512-HoGuUs4sCZNezVEKdVcwqmZN8GoHirLUcLaYVNBK2J0DadGtdcqgr3BCbvH8+XUo4NGjNl3VOtSjEKNzqfFgKw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/template": "^7.28.6",
        "@babel/types": "^7.29.0"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/parser": {
      "version": "7.29.2",
      "resolved": "https://registry.npmjs.org/@babel/parser/-/parser-7.29.2.tgz",
      "integrity": "sha512-4GgRzy/+fsBa72/RZVJmGKPmZu9Byn8o4MoLpmNe1m8ZfYnz5emHLQz3U4gLud6Zwl0RZIcgiLD7Uq7ySFuDLA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/types": "^7.29.0"
      },
      "bin": {
        "parser": "bin/babel-parser.js"
      },
      "engines": {
        "node": ">=6.0.0"
      }
    },
    "node_modules/@babel/plugin-transform-react-jsx-self": {
      "version": "7.27.1",
      "resolved": "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-self/-/plugin-transform-react-jsx-self-7.27.1.tgz",
      "integrity": "sha512-6UzkCs+ejGdZ5mFFC/OCUrv028ab2fp1znZmCZjAOBKiBK2jXD1O+BPSfX8X2qjJ75fZBMSnQn3Rq2mrBJK2mw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/helper-plugin-utils": "^7.27.1"
      },
      "engines": {
        "node": ">=6.9.0"
      },
      "peerDependencies": {
        "@babel/core": "^7.0.0-0"
      }
    },
    "node_modules/@babel/plugin-transform-react-jsx-source": {
      "version": "7.27.1",
      "resolved": "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-source/-/plugin-transform-react-jsx-source-7.27.1.tgz",
      "integrity": "sha512-zbwoTsBruTeKB9hSq73ha66iFeJHuaFkUbwvqElnygoNbj/jHRsSeokowZFN3CZ64IvEqcmmkVe89OPXc7ldAw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/helper-plugin-utils": "^7.27.1"
      },
      "engines": {
        "node": ">=6.9.0"
      },
      "peerDependencies": {
        "@babel/core": "^7.0.0-0"
      }
    },
    "node_modules/@babel/template": {
      "version": "7.28.6",
      "resolved": "https://registry.npmjs.org/@babel/template/-/template-7.28.6.tgz",
      "integrity": "sha512-YA6Ma2KsCdGb+WC6UpBVFJGXL58MDA6oyONbjyF/+5sBgxY/dwkhLogbMT2GXXyU84/IhRw/2D1Os1B/giz+BQ==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/code-frame": "^7.28.6",
        "@babel/parser": "^7.28.6",
        "@babel/types": "^7.28.6"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/traverse": {
      "version": "7.29.0",
      "resolved": "https://registry.npmjs.org/@babel/traverse/-/traverse-7.29.0.tgz",
      "integrity": "sha512-4HPiQr0X7+waHfyXPZpWPfWL/J7dcN1mx9gL6WdQVMbPnF3+ZhSMs8tCxN7oHddJE9fhNE7+lxdnlyemKfJRuA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/code-frame": "^7.29.0",
        "@babel/generator": "^7.29.0",
        "@babel/helper-globals": "^7.28.0",
        "@babel/parser": "^7.29.0",
        "@babel/template": "^7.28.6",
        "@babel/types": "^7.29.0",
        "debug": "^4.3.1"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@babel/types": {
      "version": "7.29.0",
      "resolved": "https://registry.npmjs.org/@babel/types/-/types-7.29.0.tgz",
      "integrity": "sha512-LwdZHpScM4Qz8Xw2iKSzS+cfglZzJGvofQICy7W7v4caru4EaAmyUuO6BGrbyQ2mYV11W0U8j5mBhd14dd3B0A==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/helper-string-parser": "^7.27.1",
        "@babel/helper-validator-identifier": "^7.28.5"
      },
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/@esbuild/aix-ppc64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/aix-ppc64/-/aix-ppc64-0.27.4.tgz",
      "integrity": "sha512-cQPwL2mp2nSmHHJlCyoXgHGhbEPMrEEU5xhkcy3Hs/O7nGZqEpZ2sUtLaL9MORLtDfRvVl2/3PAuEkYZH0Ty8Q==",
      "cpu": [
        "ppc64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "aix"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/android-arm": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/android-arm/-/android-arm-0.27.4.tgz",
      "integrity": "sha512-X9bUgvxiC8CHAGKYufLIHGXPJWnr0OCdR0anD2e21vdvgCI8lIfqFbnoeOz7lBjdrAGUhqLZLcQo6MLhTO2DKQ==",
      "cpu": [
        "arm"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "android"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/android-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/android-arm64/-/android-arm64-0.27.4.tgz",
      "integrity": "sha512-gdLscB7v75wRfu7QSm/zg6Rx29VLdy9eTr2t44sfTW7CxwAtQghZ4ZnqHk3/ogz7xao0QAgrkradbBzcqFPasw==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "android"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/android-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/android-x64/-/android-x64-0.27.4.tgz",
      "integrity": "sha512-PzPFnBNVF292sfpfhiyiXCGSn9HZg5BcAz+ivBuSsl6Rk4ga1oEXAamhOXRFyMcjwr2DVtm40G65N3GLeH1Lvw==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "android"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/darwin-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/darwin-arm64/-/darwin-arm64-0.27.4.tgz",
      "integrity": "sha512-b7xaGIwdJlht8ZFCvMkpDN6uiSmnxxK56N2GDTMYPr2/gzvfdQN8rTfBsvVKmIVY/X7EM+/hJKEIbbHs9oA4tQ==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/darwin-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/darwin-x64/-/darwin-x64-0.27.4.tgz",
      "integrity": "sha512-sR+OiKLwd15nmCdqpXMnuJ9W2kpy0KigzqScqHI3Hqwr7IXxBp3Yva+yJwoqh7rE8V77tdoheRYataNKL4QrPw==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/freebsd-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/freebsd-arm64/-/freebsd-arm64-0.27.4.tgz",
      "integrity": "sha512-jnfpKe+p79tCnm4GVav68A7tUFeKQwQyLgESwEAUzyxk/TJr4QdGog9sqWNcUbr/bZt/O/HXouspuQDd9JxFSw==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "freebsd"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/freebsd-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/freebsd-x64/-/freebsd-x64-0.27.4.tgz",
      "integrity": "sha512-2kb4ceA/CpfUrIcTUl1wrP/9ad9Atrp5J94Lq69w7UwOMolPIGrfLSvAKJp0RTvkPPyn6CIWrNy13kyLikZRZQ==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "freebsd"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-arm": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-arm/-/linux-arm-0.27.4.tgz",
      "integrity": "sha512-aBYgcIxX/wd5n2ys0yESGeYMGF+pv6g0DhZr3G1ZG4jMfruU9Tl1i2Z+Wnj9/KjGz1lTLCcorqE2viePZqj4Eg==",
      "cpu": [
        "arm"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.27.4.tgz",
      "integrity": "sha512-7nQOttdzVGth1iz57kxg9uCz57dxQLHWxopL6mYuYthohPKEK0vU0C3O21CcBK6KDlkYVcnDXY099HcCDXd9dA==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-ia32": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-ia32/-/linux-ia32-0.27.4.tgz",
      "integrity": "sha512-oPtixtAIzgvzYcKBQM/qZ3R+9TEUd1aNJQu0HhGyqtx6oS7qTpvjheIWBbes4+qu1bNlo2V4cbkISr8q6gRBFA==",
      "cpu": [
        "ia32"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-loong64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-loong64/-/linux-loong64-0.27.4.tgz",
      "integrity": "sha512-8mL/vh8qeCoRcFH2nM8wm5uJP+ZcVYGGayMavi8GmRJjuI3g1v6Z7Ni0JJKAJW+m0EtUuARb6Lmp4hMjzCBWzA==",
      "cpu": [
        "loong64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-mips64el": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-mips64el/-/linux-mips64el-0.27.4.tgz",
      "integrity": "sha512-1RdrWFFiiLIW7LQq9Q2NES+HiD4NyT8Itj9AUeCl0IVCA459WnPhREKgwrpaIfTOe+/2rdntisegiPWn/r/aAw==",
      "cpu": [
        "mips64el"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-ppc64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-ppc64/-/linux-ppc64-0.27.4.tgz",
      "integrity": "sha512-tLCwNG47l3sd9lpfyx9LAGEGItCUeRCWeAx6x2Jmbav65nAwoPXfewtAdtbtit/pJFLUWOhpv0FpS6GQAmPrHA==",
      "cpu": [
        "ppc64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-riscv64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-riscv64/-/linux-riscv64-0.27.4.tgz",
      "integrity": "sha512-BnASypppbUWyqjd1KIpU4AUBiIhVr6YlHx/cnPgqEkNoVOhHg+YiSVxM1RLfiy4t9cAulbRGTNCKOcqHrEQLIw==",
      "cpu": [
        "riscv64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-s390x": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-s390x/-/linux-s390x-0.27.4.tgz",
      "integrity": "sha512-+eUqgb/Z7vxVLezG8bVB9SfBie89gMueS+I0xYh2tJdw3vqA/0ImZJ2ROeWwVJN59ihBeZ7Tu92dF/5dy5FttA==",
      "cpu": [
        "s390x"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/linux-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.27.4.tgz",
      "integrity": "sha512-S5qOXrKV8BQEzJPVxAwnryi2+Iq5pB40gTEIT69BQONqR7JH1EPIcQ/Uiv9mCnn05jff9umq/5nqzxlqTOg9NA==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/netbsd-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/netbsd-arm64/-/netbsd-arm64-0.27.4.tgz",
      "integrity": "sha512-xHT8X4sb0GS8qTqiwzHqpY00C95DPAq7nAwX35Ie/s+LO9830hrMd3oX0ZMKLvy7vsonee73x0lmcdOVXFzd6Q==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "netbsd"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/netbsd-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/netbsd-x64/-/netbsd-x64-0.27.4.tgz",
      "integrity": "sha512-RugOvOdXfdyi5Tyv40kgQnI0byv66BFgAqjdgtAKqHoZTbTF2QqfQrFwa7cHEORJf6X2ht+l9ABLMP0dnKYsgg==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "netbsd"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/openbsd-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/openbsd-arm64/-/openbsd-arm64-0.27.4.tgz",
      "integrity": "sha512-2MyL3IAaTX+1/qP0O1SwskwcwCoOI4kV2IBX1xYnDDqthmq5ArrW94qSIKCAuRraMgPOmG0RDTA74mzYNQA9ow==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "openbsd"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/openbsd-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/openbsd-x64/-/openbsd-x64-0.27.4.tgz",
      "integrity": "sha512-u8fg/jQ5aQDfsnIV6+KwLOf1CmJnfu1ShpwqdwC0uA7ZPwFws55Ngc12vBdeUdnuWoQYx/SOQLGDcdlfXhYmXQ==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "openbsd"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/openharmony-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/openharmony-arm64/-/openharmony-arm64-0.27.4.tgz",
      "integrity": "sha512-JkTZrl6VbyO8lDQO3yv26nNr2RM2yZzNrNHEsj9bm6dOwwu9OYN28CjzZkH57bh4w0I2F7IodpQvUAEd1mbWXg==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "openharmony"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/sunos-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/sunos-x64/-/sunos-x64-0.27.4.tgz",
      "integrity": "sha512-/gOzgaewZJfeJTlsWhvUEmUG4tWEY2Spp5M20INYRg2ZKl9QPO3QEEgPeRtLjEWSW8FilRNacPOg8R1uaYkA6g==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "sunos"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/win32-arm64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/win32-arm64/-/win32-arm64-0.27.4.tgz",
      "integrity": "sha512-Z9SExBg2y32smoDQdf1HRwHRt6vAHLXcxD2uGgO/v2jK7Y718Ix4ndsbNMU/+1Qiem9OiOdaqitioZwxivhXYg==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/win32-ia32": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/win32-ia32/-/win32-ia32-0.27.4.tgz",
      "integrity": "sha512-DAyGLS0Jz5G5iixEbMHi5KdiApqHBWMGzTtMiJ72ZOLhbu/bzxgAe8Ue8CTS3n3HbIUHQz/L51yMdGMeoxXNJw==",
      "cpu": [
        "ia32"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@esbuild/win32-x64": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/@esbuild/win32-x64/-/win32-x64-0.27.4.tgz",
      "integrity": "sha512-+knoa0BDoeXgkNvvV1vvbZX4+hizelrkwmGJBdT17t8FNPwG2lKemmuMZlmaNQ3ws3DKKCxpb4zRZEIp3UxFCg==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ],
      "engines": {
        "node": ">=18"
      }
    },
    "node_modules/@jridgewell/gen-mapping": {
      "version": "0.3.13",
      "resolved": "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz",
      "integrity": "sha512-2kkt/7niJ6MgEPxF0bYdQ6etZaA+fQvDcLKckhy1yIQOzaoKjBBjSj63/aLVjYE3qhRt5dvM+uUyfCg6UKCBbA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@jridgewell/sourcemap-codec": "^1.5.0",
        "@jridgewell/trace-mapping": "^0.3.24"
      }
    },
    "node_modules/@jridgewell/remapping": {
      "version": "2.3.5",
      "resolved": "https://registry.npmjs.org/@jridgewell/remapping/-/remapping-2.3.5.tgz",
      "integrity": "sha512-LI9u/+laYG4Ds1TDKSJW2YPrIlcVYOwi2fUC6xB43lueCjgxV4lffOCZCtYFiH6TNOX+tQKXx97T4IKHbhyHEQ==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@jridgewell/gen-mapping": "^0.3.5",
        "@jridgewell/trace-mapping": "^0.3.24"
      }
    },
    "node_modules/@jridgewell/resolve-uri": {
      "version": "3.1.2",
      "resolved": "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz",
      "integrity": "sha512-bRISgCIjP20/tbWSPWMEi54QVPRZExkuD9lJL+UIxUKtwVJA8wW1Trb1jMs1RFXo1CBTNZ/5hpC9QvmKWdopKw==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.0.0"
      }
    },
    "node_modules/@jridgewell/sourcemap-codec": {
      "version": "1.5.5",
      "resolved": "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz",
      "integrity": "sha512-cYQ9310grqxueWbl+WuIUIaiUaDcj7WOq5fVhEljNVgRfOUhY9fy2zTvfoqWsnebh8Sl70VScFbICvJnLKB0Og==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/@jridgewell/trace-mapping": {
      "version": "0.3.31",
      "resolved": "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.31.tgz",
      "integrity": "sha512-zzNR+SdQSDJzc8joaeP8QQoCQr8NuYx2dIIytl1QeBEZHJ9uW6hebsrYgbz8hJwUQao3TWCMtmfV8Nu1twOLAw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@jridgewell/resolve-uri": "^3.1.0",
        "@jridgewell/sourcemap-codec": "^1.4.14"
      }
    },
    "node_modules/@react-leaflet/core": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/@react-leaflet/core/-/core-3.0.0.tgz",
      "integrity": "sha512-3EWmekh4Nz+pGcr+xjf0KNyYfC3U2JjnkWsh0zcqaexYqmmB5ZhH37kz41JXGmKzpaMZCnPofBBm64i+YrEvGQ==",
      "license": "Hippocratic-2.1",
      "peerDependencies": {
        "leaflet": "^1.9.0",
        "react": "^19.0.0",
        "react-dom": "^19.0.0"
      }
    },
    "node_modules/@rolldown/pluginutils": {
      "version": "1.0.0-rc.3",
      "resolved": "https://registry.npmjs.org/@rolldown/pluginutils/-/pluginutils-1.0.0-rc.3.tgz",
      "integrity": "sha512-eybk3TjzzzV97Dlj5c+XrBFW57eTNhzod66y9HrBlzJ6NsCrWCp/2kaPS3K9wJmurBC0Tdw4yPjXKZqlznim3Q==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/@rollup/rollup-android-arm-eabi": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-android-arm-eabi/-/rollup-android-arm-eabi-4.59.0.tgz",
      "integrity": "sha512-upnNBkA6ZH2VKGcBj9Fyl9IGNPULcjXRlg0LLeaioQWueH30p6IXtJEbKAgvyv+mJaMxSm1l6xwDXYjpEMiLMg==",
      "cpu": [
        "arm"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "android"
      ]
    },
    "node_modules/@rollup/rollup-android-arm64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-android-arm64/-/rollup-android-arm64-4.59.0.tgz",
      "integrity": "sha512-hZ+Zxj3SySm4A/DylsDKZAeVg0mvi++0PYVceVyX7hemkw7OreKdCvW2oQ3T1FMZvCaQXqOTHb8qmBShoqk69Q==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "android"
      ]
    },
    "node_modules/@rollup/rollup-darwin-arm64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-darwin-arm64/-/rollup-darwin-arm64-4.59.0.tgz",
      "integrity": "sha512-W2Psnbh1J8ZJw0xKAd8zdNgF9HRLkdWwwdWqubSVk0pUuQkoHnv7rx4GiF9rT4t5DIZGAsConRE3AxCdJ4m8rg==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ]
    },
    "node_modules/@rollup/rollup-darwin-x64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-darwin-x64/-/rollup-darwin-x64-4.59.0.tgz",
      "integrity": "sha512-ZW2KkwlS4lwTv7ZVsYDiARfFCnSGhzYPdiOU4IM2fDbL+QGlyAbjgSFuqNRbSthybLbIJ915UtZBtmuLrQAT/w==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ]
    },
    "node_modules/@rollup/rollup-freebsd-arm64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-freebsd-arm64/-/rollup-freebsd-arm64-4.59.0.tgz",
      "integrity": "sha512-EsKaJ5ytAu9jI3lonzn3BgG8iRBjV4LxZexygcQbpiU0wU0ATxhNVEpXKfUa0pS05gTcSDMKpn3Sx+QB9RlTTA==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "freebsd"
      ]
    },
    "node_modules/@rollup/rollup-freebsd-x64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-freebsd-x64/-/rollup-freebsd-x64-4.59.0.tgz",
      "integrity": "sha512-d3DuZi2KzTMjImrxoHIAODUZYoUUMsuUiY4SRRcJy6NJoZ6iIqWnJu9IScV9jXysyGMVuW+KNzZvBLOcpdl3Vg==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "freebsd"
      ]
    },
    "node_modules/@rollup/rollup-linux-arm-gnueabihf": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-arm-gnueabihf/-/rollup-linux-arm-gnueabihf-4.59.0.tgz",
      "integrity": "sha512-t4ONHboXi/3E0rT6OZl1pKbl2Vgxf9vJfWgmUoCEVQVxhW6Cw/c8I6hbbu7DAvgp82RKiH7TpLwxnJeKv2pbsw==",
      "cpu": [
        "arm"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-arm-musleabihf": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-arm-musleabihf/-/rollup-linux-arm-musleabihf-4.59.0.tgz",
      "integrity": "sha512-CikFT7aYPA2ufMD086cVORBYGHffBo4K8MQ4uPS/ZnY54GKj36i196u8U+aDVT2LX4eSMbyHtyOh7D7Zvk2VvA==",
      "cpu": [
        "arm"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-arm64-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.59.0.tgz",
      "integrity": "sha512-jYgUGk5aLd1nUb1CtQ8E+t5JhLc9x5WdBKew9ZgAXg7DBk0ZHErLHdXM24rfX+bKrFe+Xp5YuJo54I5HFjGDAA==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-arm64-musl": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.59.0.tgz",
      "integrity": "sha512-peZRVEdnFWZ5Bh2KeumKG9ty7aCXzzEsHShOZEFiCQlDEepP1dpUl/SrUNXNg13UmZl+gzVDPsiCwnV1uI0RUA==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-loong64-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-loong64-gnu/-/rollup-linux-loong64-gnu-4.59.0.tgz",
      "integrity": "sha512-gbUSW/97f7+r4gHy3Jlup8zDG190AuodsWnNiXErp9mT90iCy9NKKU0Xwx5k8VlRAIV2uU9CsMnEFg/xXaOfXg==",
      "cpu": [
        "loong64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-loong64-musl": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-loong64-musl/-/rollup-linux-loong64-musl-4.59.0.tgz",
      "integrity": "sha512-yTRONe79E+o0FWFijasoTjtzG9EBedFXJMl888NBEDCDV9I2wGbFFfJQQe63OijbFCUZqxpHz1GzpbtSFikJ4Q==",
      "cpu": [
        "loong64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-ppc64-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-ppc64-gnu/-/rollup-linux-ppc64-gnu-4.59.0.tgz",
      "integrity": "sha512-sw1o3tfyk12k3OEpRddF68a1unZ5VCN7zoTNtSn2KndUE+ea3m3ROOKRCZxEpmT9nsGnogpFP9x6mnLTCaoLkA==",
      "cpu": [
        "ppc64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-ppc64-musl": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-ppc64-musl/-/rollup-linux-ppc64-musl-4.59.0.tgz",
      "integrity": "sha512-+2kLtQ4xT3AiIxkzFVFXfsmlZiG5FXYW7ZyIIvGA7Bdeuh9Z0aN4hVyXS/G1E9bTP/vqszNIN/pUKCk/BTHsKA==",
      "cpu": [
        "ppc64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-riscv64-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-riscv64-gnu/-/rollup-linux-riscv64-gnu-4.59.0.tgz",
      "integrity": "sha512-NDYMpsXYJJaj+I7UdwIuHHNxXZ/b/N2hR15NyH3m2qAtb/hHPA4g4SuuvrdxetTdndfj9b1WOmy73kcPRoERUg==",
      "cpu": [
        "riscv64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-riscv64-musl": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-riscv64-musl/-/rollup-linux-riscv64-musl-4.59.0.tgz",
      "integrity": "sha512-nLckB8WOqHIf1bhymk+oHxvM9D3tyPndZH8i8+35p/1YiVoVswPid2yLzgX7ZJP0KQvnkhM4H6QZ5m0LzbyIAg==",
      "cpu": [
        "riscv64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-s390x-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-s390x-gnu/-/rollup-linux-s390x-gnu-4.59.0.tgz",
      "integrity": "sha512-oF87Ie3uAIvORFBpwnCvUzdeYUqi2wY6jRFWJAy1qus/udHFYIkplYRW+wo+GRUP4sKzYdmE1Y3+rY5Gc4ZO+w==",
      "cpu": [
        "s390x"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-x64-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.59.0.tgz",
      "integrity": "sha512-3AHmtQq/ppNuUspKAlvA8HtLybkDflkMuLK4DPo77DfthRb71V84/c4MlWJXixZz4uruIH4uaa07IqoAkG64fg==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-linux-x64-musl": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.59.0.tgz",
      "integrity": "sha512-2UdiwS/9cTAx7qIUZB/fWtToJwvt0Vbo0zmnYt7ED35KPg13Q0ym1g442THLC7VyI6JfYTP4PiSOWyoMdV2/xg==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "linux"
      ]
    },
    "node_modules/@rollup/rollup-openbsd-x64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-openbsd-x64/-/rollup-openbsd-x64-4.59.0.tgz",
      "integrity": "sha512-M3bLRAVk6GOwFlPTIxVBSYKUaqfLrn8l0psKinkCFxl4lQvOSz8ZrKDz2gxcBwHFpci0B6rttydI4IpS4IS/jQ==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "openbsd"
      ]
    },
    "node_modules/@rollup/rollup-openharmony-arm64": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-openharmony-arm64/-/rollup-openharmony-arm64-4.59.0.tgz",
      "integrity": "sha512-tt9KBJqaqp5i5HUZzoafHZX8b5Q2Fe7UjYERADll83O4fGqJ49O1FsL6LpdzVFQcpwvnyd0i+K/VSwu/o/nWlA==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "openharmony"
      ]
    },
    "node_modules/@rollup/rollup-win32-arm64-msvc": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-win32-arm64-msvc/-/rollup-win32-arm64-msvc-4.59.0.tgz",
      "integrity": "sha512-V5B6mG7OrGTwnxaNUzZTDTjDS7F75PO1ae6MJYdiMu60sq0CqN5CVeVsbhPxalupvTX8gXVSU9gq+Rx1/hvu6A==",
      "cpu": [
        "arm64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ]
    },
    "node_modules/@rollup/rollup-win32-ia32-msvc": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-win32-ia32-msvc/-/rollup-win32-ia32-msvc-4.59.0.tgz",
      "integrity": "sha512-UKFMHPuM9R0iBegwzKF4y0C4J9u8C6MEJgFuXTBerMk7EJ92GFVFYBfOZaSGLu6COf7FxpQNqhNS4c4icUPqxA==",
      "cpu": [
        "ia32"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ]
    },
    "node_modules/@rollup/rollup-win32-x64-gnu": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-win32-x64-gnu/-/rollup-win32-x64-gnu-4.59.0.tgz",
      "integrity": "sha512-laBkYlSS1n2L8fSo1thDNGrCTQMmxjYY5G0WFWjFFYZkKPjsMBsgJfGf4TLxXrF6RyhI60L8TMOjBMvXiTcxeA==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ]
    },
    "node_modules/@rollup/rollup-win32-x64-msvc": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/@rollup/rollup-win32-x64-msvc/-/rollup-win32-x64-msvc-4.59.0.tgz",
      "integrity": "sha512-2HRCml6OztYXyJXAvdDXPKcawukWY2GpR5/nxKp4iBgiO3wcoEGkAaqctIbZcNB6KlUQBIqt8VYkNSj2397EfA==",
      "cpu": [
        "x64"
      ],
      "dev": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "win32"
      ]
    },
    "node_modules/@types/babel__core": {
      "version": "7.20.5",
      "resolved": "https://registry.npmjs.org/@types/babel__core/-/babel__core-7.20.5.tgz",
      "integrity": "sha512-qoQprZvz5wQFJwMDqeseRXWv3rqMvhgpbXFfVyWhbx9X47POIA6i/+dXefEmZKoAgOaTdaIgNSMqMIU61yRyzA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/parser": "^7.20.7",
        "@babel/types": "^7.20.7",
        "@types/babel__generator": "*",
        "@types/babel__template": "*",
        "@types/babel__traverse": "*"
      }
    },
    "node_modules/@types/babel__generator": {
      "version": "7.27.0",
      "resolved": "https://registry.npmjs.org/@types/babel__generator/-/babel__generator-7.27.0.tgz",
      "integrity": "sha512-ufFd2Xi92OAVPYsy+P4n7/U7e68fex0+Ee8gSG9KX7eo084CWiQ4sdxktvdl0bOPupXtVJPY19zk6EwWqUQ8lg==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/types": "^7.0.0"
      }
    },
    "node_modules/@types/babel__template": {
      "version": "7.4.4",
      "resolved": "https://registry.npmjs.org/@types/babel__template/-/babel__template-7.4.4.tgz",
      "integrity": "sha512-h/NUaSyG5EyxBIp8YRxo4RMe2/qQgvyowRwVMzhYhBCONbW8PUsg4lkFMrhgZhUe5z3L3MiLDuvyJ/CaPa2A8A==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/parser": "^7.1.0",
        "@babel/types": "^7.0.0"
      }
    },
    "node_modules/@types/babel__traverse": {
      "version": "7.28.0",
      "resolved": "https://registry.npmjs.org/@types/babel__traverse/-/babel__traverse-7.28.0.tgz",
      "integrity": "sha512-8PvcXf70gTDZBgt9ptxJ8elBeBjcLOAcOtoO/mPJjtji1+CdGbHgm77om1GrsPxsiE+uXIpNSK64UYaIwQXd4Q==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/types": "^7.28.2"
      }
    },
    "node_modules/@types/estree": {
      "version": "1.0.8",
      "resolved": "https://registry.npmjs.org/@types/estree/-/estree-1.0.8.tgz",
      "integrity": "sha512-dWHzHa2WqEXI/O1E9OjrocMTKJl2mSrEolh1Iomrv6U+JuNwaHXsXx9bLu5gG7BUWFIN0skIQJQ/L1rIex4X6w==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/@vitejs/plugin-react": {
      "version": "5.2.0",
      "resolved": "https://registry.npmjs.org/@vitejs/plugin-react/-/plugin-react-5.2.0.tgz",
      "integrity": "sha512-YmKkfhOAi3wsB1PhJq5Scj3GXMn3WvtQ/JC0xoopuHoXSdmtdStOpFrYaT1kie2YgFBcIe64ROzMYRjCrYOdYw==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@babel/core": "^7.29.0",
        "@babel/plugin-transform-react-jsx-self": "^7.27.1",
        "@babel/plugin-transform-react-jsx-source": "^7.27.1",
        "@rolldown/pluginutils": "1.0.0-rc.3",
        "@types/babel__core": "^7.20.5",
        "react-refresh": "^0.18.0"
      },
      "engines": {
        "node": "^20.19.0 || >=22.12.0"
      },
      "peerDependencies": {
        "vite": "^4.2.0 || ^5.0.0 || ^6.0.0 || ^7.0.0 || ^8.0.0"
      }
    },
    "node_modules/asynckit": {
      "version": "0.4.0",
      "resolved": "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz",
      "integrity": "sha512-Oei9OH4tRh0YqU3GxhX79dM/mwVgvbZJaSNaRk+bshkj0S5cfHcgYakreBjrHwatXKbz+IoIdYLxrKim2MjW0Q==",
      "license": "MIT"
    },
    "node_modules/axios": {
      "version": "1.13.6",
      "resolved": "https://registry.npmjs.org/axios/-/axios-1.13.6.tgz",
      "integrity": "sha512-ChTCHMouEe2kn713WHbQGcuYrr6fXTBiu460OTwWrWob16g1bXn4vtz07Ope7ewMozJAnEquLk5lWQWtBig9DQ==",
      "license": "MIT",
      "dependencies": {
        "follow-redirects": "^1.15.11",
        "form-data": "^4.0.5",
        "proxy-from-env": "^1.1.0"
      }
    },
    "node_modules/baseline-browser-mapping": {
      "version": "2.10.8",
      "resolved": "https://registry.npmjs.org/baseline-browser-mapping/-/baseline-browser-mapping-2.10.8.tgz",
      "integrity": "sha512-PCLz/LXGBsNTErbtB6i5u4eLpHeMfi93aUv5duMmj6caNu6IphS4q6UevDnL36sZQv9lrP11dbPKGMaXPwMKfQ==",
      "dev": true,
      "license": "Apache-2.0",
      "bin": {
        "baseline-browser-mapping": "dist/cli.cjs"
      },
      "engines": {
        "node": ">=6.0.0"
      }
    },
    "node_modules/browserslist": {
      "version": "4.28.1",
      "resolved": "https://registry.npmjs.org/browserslist/-/browserslist-4.28.1.tgz",
      "integrity": "sha512-ZC5Bd0LgJXgwGqUknZY/vkUQ04r8NXnJZ3yYi4vDmSiZmC/pdSN0NbNRPxZpbtO4uAfDUAFffO8IZoM3Gj8IkA==",
      "dev": true,
      "funding": [
        {
          "type": "opencollective",
          "url": "https://opencollective.com/browserslist"
        },
        {
          "type": "tidelift",
          "url": "https://tidelift.com/funding/github/npm/browserslist"
        },
        {
          "type": "github",
          "url": "https://github.com/sponsors/ai"
        }
      ],
      "license": "MIT",
      "dependencies": {
        "baseline-browser-mapping": "^2.9.0",
        "caniuse-lite": "^1.0.30001759",
        "electron-to-chromium": "^1.5.263",
        "node-releases": "^2.0.27",
        "update-browserslist-db": "^1.2.0"
      },
      "bin": {
        "browserslist": "cli.js"
      },
      "engines": {
        "node": "^6 || ^7 || ^8 || ^9 || ^10 || ^11 || ^12 || >=13.7"
      }
    },
    "node_modules/call-bind-apply-helpers": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz",
      "integrity": "sha512-Sp1ablJ0ivDkSzjcaJdxEunN5/XvksFJ2sMBFfq6x0ryhQV/2b/KwFe21cMpmHtPOSij8K99/wSfoEuTObmuMQ==",
      "license": "MIT",
      "dependencies": {
        "es-errors": "^1.3.0",
        "function-bind": "^1.1.2"
      },
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/caniuse-lite": {
      "version": "1.0.30001780",
      "resolved": "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001780.tgz",
      "integrity": "sha512-llngX0E7nQci5BPJDqoZSbuZ5Bcs9F5db7EtgfwBerX9XGtkkiO4NwfDDIRzHTTwcYC8vC7bmeUEPGrKlR/TkQ==",
      "dev": true,
      "funding": [
        {
          "type": "opencollective",
          "url": "https://opencollective.com/browserslist"
        },
        {
          "type": "tidelift",
          "url": "https://tidelift.com/funding/github/npm/caniuse-lite"
        },
        {
          "type": "github",
          "url": "https://github.com/sponsors/ai"
        }
      ],
      "license": "CC-BY-4.0"
    },
    "node_modules/combined-stream": {
      "version": "1.0.8",
      "resolved": "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz",
      "integrity": "sha512-FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==",
      "license": "MIT",
      "dependencies": {
        "delayed-stream": "~1.0.0"
      },
      "engines": {
        "node": ">= 0.8"
      }
    },
    "node_modules/convert-source-map": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/convert-source-map/-/convert-source-map-2.0.0.tgz",
      "integrity": "sha512-Kvp459HrV2FEJ1CAsi1Ku+MY3kasH19TFykTz2xWmMeq6bk2NU3XXvfJ+Q61m0xktWwt+1HSYf3JZsTms3aRJg==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/cookie": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/cookie/-/cookie-1.1.1.tgz",
      "integrity": "sha512-ei8Aos7ja0weRpFzJnEA9UHJ/7XQmqglbRwnf2ATjcB9Wq874VKH9kfjjirM6UhU2/E5fFYadylyhFldcqSidQ==",
      "license": "MIT",
      "engines": {
        "node": ">=18"
      },
      "funding": {
        "type": "opencollective",
        "url": "https://opencollective.com/express"
      }
    },
    "node_modules/debug": {
      "version": "4.4.3",
      "resolved": "https://registry.npmjs.org/debug/-/debug-4.4.3.tgz",
      "integrity": "sha512-RGwwWnwQvkVfavKVt22FGLw+xYSdzARwm0ru6DhTVA3umU5hZc28V3kO4stgYryrTlLpuvgI9GiijltAjNbcqA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "ms": "^2.1.3"
      },
      "engines": {
        "node": ">=6.0"
      },
      "peerDependenciesMeta": {
        "supports-color": {
          "optional": true
        }
      }
    },
    "node_modules/delayed-stream": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz",
      "integrity": "sha512-ZySD7Nf91aLB0RxL4KGrKHBXl7Eds1DAmEdcoVawXnLD7SDhpNgtuII2aAkg7a7QS41jxPSZ17p4VdGnMHk3MQ==",
      "license": "MIT",
      "engines": {
        "node": ">=0.4.0"
      }
    },
    "node_modules/dunder-proto": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/dunder-proto/-/dunder-proto-1.0.1.tgz",
      "integrity": "sha512-KIN/nDJBQRcXw0MLVhZE9iQHmG68qAVIBg9CqmUYjmQIhgij9U5MFvrqkUL5FbtyyzZuOeOt0zdeRe4UY7ct+A==",
      "license": "MIT",
      "dependencies": {
        "call-bind-apply-helpers": "^1.0.1",
        "es-errors": "^1.3.0",
        "gopd": "^1.2.0"
      },
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/electron-to-chromium": {
      "version": "1.5.321",
      "resolved": "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.5.321.tgz",
      "integrity": "sha512-L2C7Q279W2D/J4PLZLk7sebOILDSWos7bMsMNN06rK482umHUrh/3lM8G7IlHFOYip2oAg5nha1rCMxr/rs6ZQ==",
      "dev": true,
      "license": "ISC"
    },
    "node_modules/es-define-property": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.1.tgz",
      "integrity": "sha512-e3nRfgfUZ4rNGL232gUgX06QNyyez04KdjFrF+LTRoOXmrOgFKDg4BCdsjW8EnT69eqdYGmRpJwiPVYNrCaW3g==",
      "license": "MIT",
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/es-errors": {
      "version": "1.3.0",
      "resolved": "https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz",
      "integrity": "sha512-Zf5H2Kxt2xjTvbJvP2ZWLEICxA6j+hAmMzIlypy4xcBg1vKVnx89Wy0GbS+kf5cwCVFFzdCFh2XSCFNULS6csw==",
      "license": "MIT",
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/es-object-atoms": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/es-object-atoms/-/es-object-atoms-1.1.1.tgz",
      "integrity": "sha512-FGgH2h8zKNim9ljj7dankFPcICIK9Cp5bm+c2gQSYePhpaG5+esrLODihIorn+Pe6FGJzWhXQotPv73jTaldXA==",
      "license": "MIT",
      "dependencies": {
        "es-errors": "^1.3.0"
      },
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/es-set-tostringtag": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz",
      "integrity": "sha512-j6vWzfrGVfyXxge+O0x5sh6cvxAog0a/4Rdd2K36zCMV5eJ+/+tOAngRO8cODMNWbVRdVlmGZQL2YS3yR8bIUA==",
      "license": "MIT",
      "dependencies": {
        "es-errors": "^1.3.0",
        "get-intrinsic": "^1.2.6",
        "has-tostringtag": "^1.0.2",
        "hasown": "^2.0.2"
      },
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/esbuild": {
      "version": "0.27.4",
      "resolved": "https://registry.npmjs.org/esbuild/-/esbuild-0.27.4.tgz",
      "integrity": "sha512-Rq4vbHnYkK5fws5NF7MYTU68FPRE1ajX7heQ/8QXXWqNgqqJ/GkmmyxIzUnf2Sr/bakf8l54716CcMGHYhMrrQ==",
      "dev": true,
      "hasInstallScript": true,
      "license": "MIT",
      "bin": {
        "esbuild": "bin/esbuild"
      },
      "engines": {
        "node": ">=18"
      },
      "optionalDependencies": {
        "@esbuild/aix-ppc64": "0.27.4",
        "@esbuild/android-arm": "0.27.4",
        "@esbuild/android-arm64": "0.27.4",
        "@esbuild/android-x64": "0.27.4",
        "@esbuild/darwin-arm64": "0.27.4",
        "@esbuild/darwin-x64": "0.27.4",
        "@esbuild/freebsd-arm64": "0.27.4",
        "@esbuild/freebsd-x64": "0.27.4",
        "@esbuild/linux-arm": "0.27.4",
        "@esbuild/linux-arm64": "0.27.4",
        "@esbuild/linux-ia32": "0.27.4",
        "@esbuild/linux-loong64": "0.27.4",
        "@esbuild/linux-mips64el": "0.27.4",
        "@esbuild/linux-ppc64": "0.27.4",
        "@esbuild/linux-riscv64": "0.27.4",
        "@esbuild/linux-s390x": "0.27.4",
        "@esbuild/linux-x64": "0.27.4",
        "@esbuild/netbsd-arm64": "0.27.4",
        "@esbuild/netbsd-x64": "0.27.4",
        "@esbuild/openbsd-arm64": "0.27.4",
        "@esbuild/openbsd-x64": "0.27.4",
        "@esbuild/openharmony-arm64": "0.27.4",
        "@esbuild/sunos-x64": "0.27.4",
        "@esbuild/win32-arm64": "0.27.4",
        "@esbuild/win32-ia32": "0.27.4",
        "@esbuild/win32-x64": "0.27.4"
      }
    },
    "node_modules/escalade": {
      "version": "3.2.0",
      "resolved": "https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz",
      "integrity": "sha512-WUj2qlxaQtO4g6Pq5c29GTcWGDyd8itL8zTlipgECz3JesAiiOKotd8JU6otB3PACgG6xkJUyVhboMS+bje/jA==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6"
      }
    },
    "node_modules/fdir": {
      "version": "6.5.0",
      "resolved": "https://registry.npmjs.org/fdir/-/fdir-6.5.0.tgz",
      "integrity": "sha512-tIbYtZbucOs0BRGqPJkshJUYdL+SDH7dVM8gjy+ERp3WAUjLEFJE+02kanyHtwjWOnwrKYBiwAmM0p4kLJAnXg==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=12.0.0"
      },
      "peerDependencies": {
        "picomatch": "^3 || ^4"
      },
      "peerDependenciesMeta": {
        "picomatch": {
          "optional": true
        }
      }
    },
    "node_modules/follow-redirects": {
      "version": "1.15.11",
      "resolved": "https://registry.npmjs.org/follow-redirects/-/follow-redirects-1.15.11.tgz",
      "integrity": "sha512-deG2P0JfjrTxl50XGCDyfI97ZGVCxIpfKYmfyrQ54n5FO/0gfIES8C/Psl6kWVDolizcaaxZJnTS0QSMxvnsBQ==",
      "funding": [
        {
          "type": "individual",
          "url": "https://github.com/sponsors/RubenVerborgh"
        }
      ],
      "license": "MIT",
      "engines": {
        "node": ">=4.0"
      },
      "peerDependenciesMeta": {
        "debug": {
          "optional": true
        }
      }
    },
    "node_modules/form-data": {
      "version": "4.0.5",
      "resolved": "https://registry.npmjs.org/form-data/-/form-data-4.0.5.tgz",
      "integrity": "sha512-8RipRLol37bNs2bhoV67fiTEvdTrbMUYcFTiy3+wuuOnUog2QBHCZWXDRijWQfAkhBj2Uf5UnVaiWwA5vdd82w==",
      "license": "MIT",
      "dependencies": {
        "asynckit": "^0.4.0",
        "combined-stream": "^1.0.8",
        "es-set-tostringtag": "^2.1.0",
        "hasown": "^2.0.2",
        "mime-types": "^2.1.12"
      },
      "engines": {
        "node": ">= 6"
      }
    },
    "node_modules/fsevents": {
      "version": "2.3.3",
      "resolved": "https://registry.npmjs.org/fsevents/-/fsevents-2.3.3.tgz",
      "integrity": "sha512-5xoDfX+fL7faATnagmWPpbFtwh/R77WmMMqqHGS65C3vvB0YHrgF+B1YmZ3441tMj5n63k0212XNoJwzlhffQw==",
      "dev": true,
      "hasInstallScript": true,
      "license": "MIT",
      "optional": true,
      "os": [
        "darwin"
      ],
      "engines": {
        "node": "^8.16.0 || ^10.6.0 || >=11.0.0"
      }
    },
    "node_modules/function-bind": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz",
      "integrity": "sha512-7XHNxH7qX9xG5mIwxkhumTox/MIRNcOgDrxWsMt2pAr23WHp6MrRlN7FBSFpCpr+oVO0F744iUgR82nJMfG2SA==",
      "license": "MIT",
      "funding": {
        "url": "https://github.com/sponsors/ljharb"
      }
    },
    "node_modules/gensync": {
      "version": "1.0.0-beta.2",
      "resolved": "https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz",
      "integrity": "sha512-3hN7NaskYvMDLQY55gnW3NQ+mesEAepTqlg+VEbj7zzqEMBVNhzcGYYeqFo/TlYz6eQiFcp1HcsCZO+nGgS8zg==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=6.9.0"
      }
    },
    "node_modules/get-intrinsic": {
      "version": "1.3.0",
      "resolved": "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.3.0.tgz",
      "integrity": "sha512-9fSjSaos/fRIVIp+xSJlE6lfwhES7LNtKaCBIamHsjr2na1BiABJPo0mOjjz8GJDURarmCPGqaiVg5mfjb98CQ==",
      "license": "MIT",
      "dependencies": {
        "call-bind-apply-helpers": "^1.0.2",
        "es-define-property": "^1.0.1",
        "es-errors": "^1.3.0",
        "es-object-atoms": "^1.1.1",
        "function-bind": "^1.1.2",
        "get-proto": "^1.0.1",
        "gopd": "^1.2.0",
        "has-symbols": "^1.1.0",
        "hasown": "^2.0.2",
        "math-intrinsics": "^1.1.0"
      },
      "engines": {
        "node": ">= 0.4"
      },
      "funding": {
        "url": "https://github.com/sponsors/ljharb"
      }
    },
    "node_modules/get-proto": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/get-proto/-/get-proto-1.0.1.tgz",
      "integrity": "sha512-sTSfBjoXBp89JvIKIefqw7U2CCebsc74kiY6awiGogKtoSGbgjYE/G/+l9sF3MWFPNc9IcoOC4ODfKHfxFmp0g==",
      "license": "MIT",
      "dependencies": {
        "dunder-proto": "^1.0.1",
        "es-object-atoms": "^1.0.0"
      },
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/gopd": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/gopd/-/gopd-1.2.0.tgz",
      "integrity": "sha512-ZUKRh6/kUFoAiTAtTYPZJ3hw9wNxx+BIBOijnlG9PnrJsCcSjs1wyyD6vJpaYtgnzDrKYRSqf3OO6Rfa93xsRg==",
      "license": "MIT",
      "engines": {
        "node": ">= 0.4"
      },
      "funding": {
        "url": "https://github.com/sponsors/ljharb"
      }
    },
    "node_modules/has-symbols": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/has-symbols/-/has-symbols-1.1.0.tgz",
      "integrity": "sha512-1cDNdwJ2Jaohmb3sg4OmKaMBwuC48sYni5HUw2DvsC8LjGTLK9h+eb1X6RyuOHe4hT0ULCW68iomhjUoKUqlPQ==",
      "license": "MIT",
      "engines": {
        "node": ">= 0.4"
      },
      "funding": {
        "url": "https://github.com/sponsors/ljharb"
      }
    },
    "node_modules/has-tostringtag": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.2.tgz",
      "integrity": "sha512-NqADB8VjPFLM2V0VvHUewwwsw0ZWBaIdgo+ieHtK3hasLz4qeCRjYcqfB6AQrBggRKppKF8L52/VqdVsO47Dlw==",
      "license": "MIT",
      "dependencies": {
        "has-symbols": "^1.0.3"
      },
      "engines": {
        "node": ">= 0.4"
      },
      "funding": {
        "url": "https://github.com/sponsors/ljharb"
      }
    },
    "node_modules/hasown": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/hasown/-/hasown-2.0.2.tgz",
      "integrity": "sha512-0hJU9SCPvmMzIBdZFqNPXWa6dqh7WdH0cII9y+CyS8rG3nL48Bclra9HmKhVVUHyPWNH5Y7xDwAB7bfgSjkUMQ==",
      "license": "MIT",
      "dependencies": {
        "function-bind": "^1.1.2"
      },
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/js-tokens": {
      "version": "4.0.0",
      "resolved": "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz",
      "integrity": "sha512-RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/jsesc": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/jsesc/-/jsesc-3.1.0.tgz",
      "integrity": "sha512-/sM3dO2FOzXjKQhJuo0Q173wf2KOo8t4I8vHy6lF9poUp7bKT0/NHE8fPX23PwfhnykfqnC2xRxOnVw5XuGIaA==",
      "dev": true,
      "license": "MIT",
      "bin": {
        "jsesc": "bin/jsesc"
      },
      "engines": {
        "node": ">=6"
      }
    },
    "node_modules/json5": {
      "version": "2.2.3",
      "resolved": "https://registry.npmjs.org/json5/-/json5-2.2.3.tgz",
      "integrity": "sha512-XmOWe7eyHYH14cLdVPoyg+GOH3rYX++KpzrylJwSW98t3Nk+U8XOl8FWKOgwtzdb8lXGf6zYwDUzeHMWfxasyg==",
      "dev": true,
      "license": "MIT",
      "bin": {
        "json5": "lib/cli.js"
      },
      "engines": {
        "node": ">=6"
      }
    },
    "node_modules/leaflet": {
      "version": "1.9.4",
      "resolved": "https://registry.npmjs.org/leaflet/-/leaflet-1.9.4.tgz",
      "integrity": "sha512-nxS1ynzJOmOlHp+iL3FyWqK89GtNL8U8rvlMOsQdTTssxZwCXh8N2NB3GDQOL+YR3XnWyZAxwQixURb+FA74PA==",
      "license": "BSD-2-Clause"
    },
    "node_modules/lru-cache": {
      "version": "5.1.1",
      "resolved": "https://registry.npmjs.org/lru-cache/-/lru-cache-5.1.1.tgz",
      "integrity": "sha512-KpNARQA3Iwv+jTA0utUVVbrh+Jlrr1Fv0e56GGzAFOXN7dk/FviaDW8LHmK52DlcH4WP2n6gI8vN1aesBFgo9w==",
      "dev": true,
      "license": "ISC",
      "dependencies": {
        "yallist": "^3.0.2"
      }
    },
    "node_modules/math-intrinsics": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/math-intrinsics/-/math-intrinsics-1.1.0.tgz",
      "integrity": "sha512-/IXtbwEk5HTPyEwyKX6hGkYXxM9nbj64B+ilVJnC/R6B0pH5G4V3b0pVbL7DBj4tkhBAppbQUlf6F6Xl9LHu1g==",
      "license": "MIT",
      "engines": {
        "node": ">= 0.4"
      }
    },
    "node_modules/mime-db": {
      "version": "1.52.0",
      "resolved": "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz",
      "integrity": "sha512-sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==",
      "license": "MIT",
      "engines": {
        "node": ">= 0.6"
      }
    },
    "node_modules/mime-types": {
      "version": "2.1.35",
      "resolved": "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz",
      "integrity": "sha512-ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==",
      "license": "MIT",
      "dependencies": {
        "mime-db": "1.52.0"
      },
      "engines": {
        "node": ">= 0.6"
      }
    },
    "node_modules/ms": {
      "version": "2.1.3",
      "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",
      "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/nanoid": {
      "version": "3.3.11",
      "resolved": "https://registry.npmjs.org/nanoid/-/nanoid-3.3.11.tgz",
      "integrity": "sha512-N8SpfPUnUp1bK+PMYW8qSWdl9U+wwNWI4QKxOYDy9JAro3WMX7p2OeVRF9v+347pnakNevPmiHhNmZ2HbFA76w==",
      "dev": true,
      "funding": [
        {
          "type": "github",
          "url": "https://github.com/sponsors/ai"
        }
      ],
      "license": "MIT",
      "bin": {
        "nanoid": "bin/nanoid.cjs"
      },
      "engines": {
        "node": "^10 || ^12 || ^13.7 || ^14 || >=15.0.1"
      }
    },
    "node_modules/node-releases": {
      "version": "2.0.36",
      "resolved": "https://registry.npmjs.org/node-releases/-/node-releases-2.0.36.tgz",
      "integrity": "sha512-TdC8FSgHz8Mwtw9g5L4gR/Sh9XhSP/0DEkQxfEFXOpiul5IiHgHan2VhYYb6agDSfp4KuvltmGApc8HMgUrIkA==",
      "dev": true,
      "license": "MIT"
    },
    "node_modules/picocolors": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz",
      "integrity": "sha512-xceH2snhtb5M9liqDsmEw56le376mTZkEX/jEb/RxNFyegNul7eNslCXP9FDj/Lcu0X8KEyMceP2ntpaHrDEVA==",
      "dev": true,
      "license": "ISC"
    },
    "node_modules/picomatch": {
      "version": "4.0.3",
      "resolved": "https://registry.npmjs.org/picomatch/-/picomatch-4.0.3.tgz",
      "integrity": "sha512-5gTmgEY/sqK6gFXLIsQNH19lWb4ebPDLA4SdLP7dsWkIXHWlG66oPuVvXSGFPppYZz8ZDZq0dYYrbHfBCVUb1Q==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=12"
      },
      "funding": {
        "url": "https://github.com/sponsors/jonschlinkert"
      }
    },
    "node_modules/postcss": {
      "version": "8.5.8",
      "resolved": "https://registry.npmjs.org/postcss/-/postcss-8.5.8.tgz",
      "integrity": "sha512-OW/rX8O/jXnm82Ey1k44pObPtdblfiuWnrd8X7GJ7emImCOstunGbXUpp7HdBrFQX6rJzn3sPT397Wp5aCwCHg==",
      "dev": true,
      "funding": [
        {
          "type": "opencollective",
          "url": "https://opencollective.com/postcss/"
        },
        {
          "type": "tidelift",
          "url": "https://tidelift.com/funding/github/npm/postcss"
        },
        {
          "type": "github",
          "url": "https://github.com/sponsors/ai"
        }
      ],
      "license": "MIT",
      "dependencies": {
        "nanoid": "^3.3.11",
        "picocolors": "^1.1.1",
        "source-map-js": "^1.2.1"
      },
      "engines": {
        "node": "^10 || ^12 || >=14"
      }
    },
    "node_modules/proxy-from-env": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/proxy-from-env/-/proxy-from-env-1.1.0.tgz",
      "integrity": "sha512-D+zkORCbA9f1tdWRK0RaCR3GPv50cMxcrz4X8k5LTSUD1Dkw47mKJEZQNunItRTkWwgtaUSo1RVFRIG9ZXiFYg==",
      "license": "MIT"
    },
    "node_modules/react": {
      "version": "19.2.4",
      "resolved": "https://registry.npmjs.org/react/-/react-19.2.4.tgz",
      "integrity": "sha512-9nfp2hYpCwOjAN+8TZFGhtWEwgvWHXqESH8qT89AT/lWklpLON22Lc8pEtnpsZz7VmawabSU0gCjnj8aC0euHQ==",
      "license": "MIT",
      "engines": {
        "node": ">=0.10.0"
      }
    },
    "node_modules/react-dom": {
      "version": "19.2.4",
      "resolved": "https://registry.npmjs.org/react-dom/-/react-dom-19.2.4.tgz",
      "integrity": "sha512-AXJdLo8kgMbimY95O2aKQqsz2iWi9jMgKJhRBAxECE4IFxfcazB2LmzloIoibJI3C12IlY20+KFaLv+71bUJeQ==",
      "license": "MIT",
      "dependencies": {
        "scheduler": "^0.27.0"
      },
      "peerDependencies": {
        "react": "^19.2.4"
      }
    },
    "node_modules/react-leaflet": {
      "version": "5.0.0",
      "resolved": "https://registry.npmjs.org/react-leaflet/-/react-leaflet-5.0.0.tgz",
      "integrity": "sha512-CWbTpr5vcHw5bt9i4zSlPEVQdTVcML390TjeDG0cK59z1ylexpqC6M1PJFjV8jD7CF+ACBFsLIDs6DRMoLEofw==",
      "license": "Hippocratic-2.1",
      "dependencies": {
        "@react-leaflet/core": "^3.0.0"
      },
      "peerDependencies": {
        "leaflet": "^1.9.0",
        "react": "^19.0.0",
        "react-dom": "^19.0.0"
      }
    },
    "node_modules/react-refresh": {
      "version": "0.18.0",
      "resolved": "https://registry.npmjs.org/react-refresh/-/react-refresh-0.18.0.tgz",
      "integrity": "sha512-QgT5//D3jfjJb6Gsjxv0Slpj23ip+HtOpnNgnb2S5zU3CB26G/IDPGoy4RJB42wzFE46DRsstbW6tKHoKbhAxw==",
      "dev": true,
      "license": "MIT",
      "engines": {
        "node": ">=0.10.0"
      }
    },
    "node_modules/react-router": {
      "version": "7.13.1",
      "resolved": "https://registry.npmjs.org/react-router/-/react-router-7.13.1.tgz",
      "integrity": "sha512-td+xP4X2/6BJvZoX6xw++A2DdEi++YypA69bJUV5oVvqf6/9/9nNlD70YO1e9d3MyamJEBQFEzk6mbfDYbqrSA==",
      "license": "MIT",
      "dependencies": {
        "cookie": "^1.0.1",
        "set-cookie-parser": "^2.6.0"
      },
      "engines": {
        "node": ">=20.0.0"
      },
      "peerDependencies": {
        "react": ">=18",
        "react-dom": ">=18"
      },
      "peerDependenciesMeta": {
        "react-dom": {
          "optional": true
        }
      }
    },
    "node_modules/react-router-dom": {
      "version": "7.13.1",
      "resolved": "https://registry.npmjs.org/react-router-dom/-/react-router-dom-7.13.1.tgz",
      "integrity": "sha512-UJnV3Rxc5TgUPJt2KJpo1Jpy0OKQr0AjgbZzBFjaPJcFOb2Y8jA5H3LT8HUJAiRLlWrEXWHbF1Z4SCZaQjWDHw==",
      "license": "MIT",
      "dependencies": {
        "react-router": "7.13.1"
      },
      "engines": {
        "node": ">=20.0.0"
      },
      "peerDependencies": {
        "react": ">=18",
        "react-dom": ">=18"
      }
    },
    "node_modules/rollup": {
      "version": "4.59.0",
      "resolved": "https://registry.npmjs.org/rollup/-/rollup-4.59.0.tgz",
      "integrity": "sha512-2oMpl67a3zCH9H79LeMcbDhXW/UmWG/y2zuqnF2jQq5uq9TbM9TVyXvA4+t+ne2IIkBdrLpAaRQAvo7YI/Yyeg==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "@types/estree": "1.0.8"
      },
      "bin": {
        "rollup": "dist/bin/rollup"
      },
      "engines": {
        "node": ">=18.0.0",
        "npm": ">=8.0.0"
      },
      "optionalDependencies": {
        "@rollup/rollup-android-arm-eabi": "4.59.0",
        "@rollup/rollup-android-arm64": "4.59.0",
        "@rollup/rollup-darwin-arm64": "4.59.0",
        "@rollup/rollup-darwin-x64": "4.59.0",
        "@rollup/rollup-freebsd-arm64": "4.59.0",
        "@rollup/rollup-freebsd-x64": "4.59.0",
        "@rollup/rollup-linux-arm-gnueabihf": "4.59.0",
        "@rollup/rollup-linux-arm-musleabihf": "4.59.0",
        "@rollup/rollup-linux-arm64-gnu": "4.59.0",
        "@rollup/rollup-linux-arm64-musl": "4.59.0",
        "@rollup/rollup-linux-loong64-gnu": "4.59.0",
        "@rollup/rollup-linux-loong64-musl": "4.59.0",
        "@rollup/rollup-linux-ppc64-gnu": "4.59.0",
        "@rollup/rollup-linux-ppc64-musl": "4.59.0",
        "@rollup/rollup-linux-riscv64-gnu": "4.59.0",
        "@rollup/rollup-linux-riscv64-musl": "4.59.0",
        "@rollup/rollup-linux-s390x-gnu": "4.59.0",
        "@rollup/rollup-linux-x64-gnu": "4.59.0",
        "@rollup/rollup-linux-x64-musl": "4.59.0",
        "@rollup/rollup-openbsd-x64": "4.59.0",
        "@rollup/rollup-openharmony-arm64": "4.59.0",
        "@rollup/rollup-win32-arm64-msvc": "4.59.0",
        "@rollup/rollup-win32-ia32-msvc": "4.59.0",
        "@rollup/rollup-win32-x64-gnu": "4.59.0",
        "@rollup/rollup-win32-x64-msvc": "4.59.0",
        "fsevents": "~2.3.2"
      }
    },
    "node_modules/scheduler": {
      "version": "0.27.0",
      "resolved": "https://registry.npmjs.org/scheduler/-/scheduler-0.27.0.tgz",
      "integrity": "sha512-eNv+WrVbKu1f3vbYJT/xtiF5syA5HPIMtf9IgY/nKg0sWqzAUEvqY/xm7OcZc/qafLx/iO9FgOmeSAp4v5ti/Q==",
      "license": "MIT"
    },
    "node_modules/semver": {
      "version": "6.3.1",
      "resolved": "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz",
      "integrity": "sha512-BR7VvDCVHO+q2xBEWskxS6DJE1qRnb7DxzUrogb71CWoSficBxYsiAGd+Kl0mmq/MprG9yArRkyrQxTO6XjMzA==",
      "dev": true,
      "license": "ISC",
      "bin": {
        "semver": "bin/semver.js"
      }
    },
    "node_modules/set-cookie-parser": {
      "version": "2.7.2",
      "resolved": "https://registry.npmjs.org/set-cookie-parser/-/set-cookie-parser-2.7.2.tgz",
      "integrity": "sha512-oeM1lpU/UvhTxw+g3cIfxXHyJRc/uidd3yK1P242gzHds0udQBYzs3y8j4gCCW+ZJ7ad0yctld8RYO+bdurlvw==",
      "license": "MIT"
    },
    "node_modules/source-map-js": {
      "version": "1.2.1",
      "resolved": "https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.1.tgz",
      "integrity": "sha512-UXWMKhLOwVKb728IUtQPXxfYU+usdybtUrK/8uGE8CQMvrhOpwvzDBwj0QhSL7MQc7vIsISBG8VQ8+IDQxpfQA==",
      "dev": true,
      "license": "BSD-3-Clause",
      "engines": {
        "node": ">=0.10.0"
      }
    },
    "node_modules/tinyglobby": {
      "version": "0.2.15",
      "resolved": "https://registry.npmjs.org/tinyglobby/-/tinyglobby-0.2.15.tgz",
      "integrity": "sha512-j2Zq4NyQYG5XMST4cbs02Ak8iJUdxRM0XI5QyxXuZOzKOINmWurp3smXu3y5wDcJrptwpSjgXHzIQxR0omXljQ==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "fdir": "^6.5.0",
        "picomatch": "^4.0.3"
      },
      "engines": {
        "node": ">=12.0.0"
      },
      "funding": {
        "url": "https://github.com/sponsors/SuperchupuDev"
      }
    },
    "node_modules/update-browserslist-db": {
      "version": "1.2.3",
      "resolved": "https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.2.3.tgz",
      "integrity": "sha512-Js0m9cx+qOgDxo0eMiFGEueWztz+d4+M3rGlmKPT+T4IS/jP4ylw3Nwpu6cpTTP8R1MAC1kF4VbdLt3ARf209w==",
      "dev": true,
      "funding": [
        {
          "type": "opencollective",
          "url": "https://opencollective.com/browserslist"
        },
        {
          "type": "tidelift",
          "url": "https://tidelift.com/funding/github/npm/browserslist"
        },
        {
          "type": "github",
          "url": "https://github.com/sponsors/ai"
        }
      ],
      "license": "MIT",
      "dependencies": {
        "escalade": "^3.2.0",
        "picocolors": "^1.1.1"
      },
      "bin": {
        "update-browserslist-db": "cli.js"
      },
      "peerDependencies": {
        "browserslist": ">= 4.21.0"
      }
    },
    "node_modules/vite": {
      "version": "7.3.1",
      "resolved": "https://registry.npmjs.org/vite/-/vite-7.3.1.tgz",
      "integrity": "sha512-w+N7Hifpc3gRjZ63vYBXA56dvvRlNWRczTdmCBBa+CotUzAPf5b7YMdMR/8CQoeYE5LX3W4wj6RYTgonm1b9DA==",
      "dev": true,
      "license": "MIT",
      "dependencies": {
        "esbuild": "^0.27.0",
        "fdir": "^6.5.0",
        "picomatch": "^4.0.3",
        "postcss": "^8.5.6",
        "rollup": "^4.43.0",
        "tinyglobby": "^0.2.15"
      },
      "bin": {
        "vite": "bin/vite.js"
      },
      "engines": {
        "node": "^20.19.0 || >=22.12.0"
      },
      "funding": {
        "url": "https://github.com/vitejs/vite?sponsor=1"
      },
      "optionalDependencies": {
        "fsevents": "~2.3.3"
      },
      "peerDependencies": {
        "@types/node": "^20.19.0 || >=22.12.0",
        "jiti": ">=1.21.0",
        "less": "^4.0.0",
        "lightningcss": "^1.21.0",
        "sass": "^1.70.0",
        "sass-embedded": "^1.70.0",
        "stylus": ">=0.54.8",
        "sugarss": "^5.0.0",
        "terser": "^5.16.0",
        "tsx": "^4.8.1",
        "yaml": "^2.4.2"
      },
      "peerDependenciesMeta": {
        "@types/node": {
          "optional": true
        },
        "jiti": {
          "optional": true
        },
        "less": {
          "optional": true
        },
        "lightningcss": {
          "optional": true
        },
        "sass": {
          "optional": true
        },
        "sass-embedded": {
          "optional": true
        },
        "stylus": {
          "optional": true
        },
        "sugarss": {
          "optional": true
        },
        "terser": {
          "optional": true
        },
        "tsx": {
          "optional": true
        },
        "yaml": {
          "optional": true
        }
      }
    },
    "node_modules/yallist": {
      "version": "3.1.1",
      "resolved": "https://registry.npmjs.org/yallist/-/yallist-3.1.1.tgz",
      "integrity": "sha512-a4UGQaWPH59mOXUYnAG2ewncQS4i4F43Tv3JoAM+s2VDAmS9NsK8GpDMLrCHPksFT7h3K6TOoUNn2pb7RoXx4g==",
      "dev": true,
      "license": "ISC"
    }
  }
}

```

