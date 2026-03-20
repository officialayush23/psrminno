# backend/routes/auth_router.py

import re
from typing import Optional

import firebase_admin
from fastapi import APIRouter, Depends, HTTPException
from firebase_admin import auth as firebase_auth, credentials
from pydantic import BaseModel
from sqlalchemy.orm import Session
from typing import Optional

from config import settings
from db import get_db
from dependencies import get_current_user
from models import City, User
from schemas import TokenData

# ── Firebase app init (safe to call multiple times) ──────────────
if not firebase_admin._apps:
    cred = credentials.Certificate(settings.FIREBASE_SERVICE_ACCOUNT_PATH)
    firebase_admin.initialize_app(cred)

router = APIRouter(prefix="/auth", tags=["Auth"])

# ── Request / Response schemas (local, auth-specific) ────────────

class FirebaseTokenRequest(BaseModel):
    """Sent by the frontend after Firebase signup or login."""
    id_token:   str
    full_name:  Optional[str] = None   # required on first signup, ignored on login
    city_code:  Optional[str] = None   # optional; defaults to first city (Delhi)
    preferred_language: Optional[str] = "hi"


class AuthResponse(BaseModel):
    user_id:    str
    role:       str
    email:      Optional[str]
    phone:      Optional[str]
    full_name:  str
    city_id:    Optional[str]
    is_new_user: bool          # lets the frontend know whether to show onboarding


# ── Helpers ───────────────────────────────────────────────────────

def _verify_firebase_token(id_token: str) -> dict:
    """Verify Firebase ID token and return decoded claims."""
    try:
        return firebase_auth.verify_id_token(id_token)
    except firebase_auth.ExpiredIdTokenError:
        raise HTTPException(status_code=401, detail="Firebase token has expired")
    except firebase_auth.InvalidIdTokenError:
        raise HTTPException(status_code=401, detail="Invalid Firebase token")
    except Exception as exc:
        raise HTTPException(status_code=401, detail=f"Token verification failed: {exc}")


def _resolve_city(db: Session, city_code: Optional[str]) -> City:
    """Return the City row for the given code, or the first city if no code given."""
    if city_code:
        city = db.query(City).filter(City.city_code == city_code.strip().upper()).first()
        if not city:
            raise HTTPException(status_code=400, detail=f"Unknown city_code: {city_code}")
        return city

    city = db.query(City).order_by(City.created_at.asc()).first()
    if not city:
        raise HTTPException(status_code=500, detail="No cities configured in database")
    return city


def _provider_label(sign_in_provider: str) -> str:
    """Map Firebase sign-in provider strings to your auth_provider column values."""
    mapping = {
        "password":    "password",
        "phone":       "phone_otp",
        "google.com":  "google",
        "apple.com":   "apple",
    }
    return mapping.get(sign_in_provider, sign_in_provider)


def _build_user_response(user: User, is_new: bool) -> AuthResponse:
    return AuthResponse(
        user_id=str(user.id),
        role=user.role,
        email=user.email,
        phone=user.phone,
        full_name=user.full_name,
        city_id=str(user.city_id) if user.city_id else None,
        is_new_user=is_new,
    )


# ── Routes ────────────────────────────────────────────────────────

@router.post("/signup", response_model=AuthResponse)
def signup(payload: FirebaseTokenRequest, db: Session = Depends(get_db)):
    """
    Called by the frontend immediately after Firebase.createUserWithEmailAndPassword()
    or any Firebase sign-up flow.

    Flow:
      1. Frontend creates user in Firebase → gets Firebase ID token
      2. Frontend POSTs id_token + full_name here
      3. We verify the token, create the internal user row, return user info

    The Firebase ID token is then used as the Bearer token on all
    subsequent requests — no separate JWT needed.
    """
    decoded      = _verify_firebase_token(payload.id_token)
    firebase_uid = decoded["uid"]
    email        = (decoded.get("email") or "").strip().lower() or None
    phone        = decoded.get("phone_number") or None
    provider     = _provider_label(decoded.get("firebase", {}).get("sign_in_provider", "password"))
    display_name = (
        payload.full_name
        or decoded.get("name")
        or email
        or phone
        or "Citizen"
    ).strip()

    # ── Idempotency: return existing user if already registered ──
    existing = db.query(User).filter(User.auth_uid == firebase_uid).first()
    if existing:
        return _build_user_response(existing, is_new=False)

    # ── Duplicate email guard (different Firebase account, same email) ──
    if email and db.query(User).filter(User.email == email).first():
        raise HTTPException(status_code=409, detail="Email already registered with a different account")

    city = _resolve_city(db, payload.city_code)

    user = User(
        # ── Identity ─────────────────────────────────────────────
        auth_uid          = firebase_uid,
        auth_provider     = provider,

        # ── Contact ──────────────────────────────────────────────
        email             = email,
        phone             = phone,
        full_name         = display_name,

        # ── Locale / preferences ─────────────────────────────────
        preferred_language = (payload.preferred_language or "hi").strip(),

        # ── City (required FK) ───────────────────────────────────
        city_id           = city.id,

        # ── Role & status ────────────────────────────────────────
        role              = "citizen",
        is_active         = True,
        is_verified       = email is not None or phone is not None,

        # ── Opt-ins ──────────────────────────────────────────────
        twilio_opt_in     = True,
        email_opt_in      = True,

        # ── No password hash needed — Firebase owns credentials ──
        extra_meta        = {},
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    return _build_user_response(user, is_new=True)


@router.post("/login", response_model=AuthResponse)
def login(payload: FirebaseTokenRequest, db: Session = Depends(get_db)):
    """
    Called by the frontend after Firebase.signInWithEmailAndPassword()
    or any Firebase sign-in flow.

    Flow:
      1. Frontend signs in via Firebase → gets Firebase ID token
      2. Frontend POSTs id_token here
      3. We verify the token, fetch the internal user, return user info

    If the user somehow signed in via Firebase but has no internal record
    (e.g. admin created them directly in Firebase console), we auto-create
    their row here so login never fails for a valid Firebase user.
    """
    decoded      = _verify_firebase_token(payload.id_token)
    firebase_uid = decoded["uid"]
    email        = (decoded.get("email") or "").strip().lower() or None
    phone        = decoded.get("phone_number") or None
    provider     = _provider_label(decoded.get("firebase", {}).get("sign_in_provider", "password"))

    user = db.query(User).filter(User.auth_uid == firebase_uid).first()

    if not user:
        # ── Auto-provision: valid Firebase user with no internal record ──
        # This handles: users created in Firebase console, migrated users, etc.
        city = _resolve_city(db, payload.city_code)
        display_name = (
            decoded.get("name") or email or phone or "Citizen"
        ).strip()

        user = User(
            auth_uid           = firebase_uid,
            auth_provider      = provider,
            email              = email,
            phone              = phone,
            full_name          = display_name,
            preferred_language = (payload.preferred_language or "hi").strip(),
            city_id            = city.id,
            role               = "citizen",
            is_active          = True,
            is_verified        = True,
            twilio_opt_in      = True,
            email_opt_in       = True,
            extra_meta         = {},
        )
        db.add(user)
        db.commit()
        db.refresh(user)
        return _build_user_response(user, is_new=True)

    if not user.is_active:
        raise HTTPException(status_code=403, detail="Account is deactivated")

    # ── Keep auth_provider in sync if user changed sign-in method ──
    if user.auth_provider != provider:
        user.auth_provider = provider
        db.commit()

    return _build_user_response(user, is_new=False)


@router.get("/me")
def me(
    current_user: TokenData = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    user = db.query(User).filter(User.id == current_user.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return {
        "user_id":    str(user.id),
        "email":      user.email,
        "phone":      user.phone,
        "full_name":  user.full_name,
        "role":       user.role,
        "city_id":    str(user.city_id) if user.city_id else None,
        "is_active":  user.is_active,
        "auth_provider": user.auth_provider,
    }
