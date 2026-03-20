
# backend/firebase.py
import firebase_admin
from firebase_admin import credentials, auth

# Download your service account JSON from GCP Console →
# IAM & Admin → Service Accounts → your project → Keys → Add Key
cred = credentials.Certificate("serviceAccountKey.json")  
firebase_admin.initialize_app(cred)


def verify_firebase_token(id_token: str) -> dict:
    """Returns decoded token with uid, email, phone_number, etc."""
    return auth.verify_id_token(id_token)