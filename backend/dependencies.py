# backend/dependencies.py
"""
Firebase Auth dependency — lazy initialization so the service account
file path is resolved at runtime (not at import time), which is required
for Cloud Run where the file is mounted as a secret volume.
"""
import logging

import firebase_admin
from fastapi import Depends, HTTPException, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from firebase_admin import auth as firebase_auth, credentials
from sqlalchemy.orm import Session

from config import settings
from db import get_db
from models import User
from schemas import TokenData

logger = logging.getLogger(__name__)
security = HTTPBearer()

_firebase_initialized = False


def _ensure_firebase() -> None:
    """Lazy Firebase init — called on first request, not at import time."""
    global _firebase_initialized
    if _firebase_initialized:
        return
    if firebase_admin._apps:
        _firebase_initialized = True
        return
    try:
        cred = credentials.Certificate(settings.FIREBASE_SERVICE_ACCOUNT_PATH)
        firebase_admin.initialize_app(cred)
        _firebase_initialized = True
        logger.info(
            "Firebase Admin SDK initialized from %s",
            settings.FIREBASE_SERVICE_ACCOUNT_PATH,
        )
    except Exception as exc:
        logger.error("Firebase init failed: %s", exc)
        raise RuntimeError(f"Firebase init failed: {exc}") from exc


def get_current_user(
    creds: HTTPAuthorizationCredentials = Security(security),
    db: Session = Depends(get_db),
) -> TokenData:
    _ensure_firebase()
    try:
        decoded = firebase_auth.verify_id_token(creds.credentials)
    except firebase_auth.ExpiredIdTokenError:
        raise HTTPException(status_code=401, detail="Token has expired")
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid authentication token")

    firebase_uid = decoded["uid"]
    user = db.query(User).filter(
        User.auth_uid == firebase_uid,
        User.is_active.is_(True),
    ).first()

    if not user:
        raise HTTPException(status_code=401, detail="User not found or inactive")

    return TokenData(user_id=user.id, role=user.role)