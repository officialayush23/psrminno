# backend/dependencies.py

import firebase_admin
from fastapi import Depends, HTTPException, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from firebase_admin import auth as firebase_auth, credentials
from sqlalchemy.orm import Session

from config import settings
from db import get_db
from models import User
from schemas import TokenData

if not firebase_admin._apps:
    cred = credentials.Certificate(settings.FIREBASE_SERVICE_ACCOUNT_PATH)
    firebase_admin.initialize_app(cred)

security = HTTPBearer()


def get_current_user(
    credentials: HTTPAuthorizationCredentials = Security(security),
    db: Session = Depends(get_db),
) -> TokenData:
    try:
        decoded = firebase_auth.verify_id_token(credentials.credentials)
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