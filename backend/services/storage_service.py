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

    key_path = settings.GCS_SERVICE_ACCOUNT_KEY_PATH
    if not key_path:
        raise ValueError("GCS_SERVICE_ACCOUNT_KEY_PATH is not configured")

    from google.oauth2 import service_account
    credentials = service_account.Credentials.from_service_account_file(
        key_path,
        scopes=["https://www.googleapis.com/auth/cloud-platform"],
    )

    suffix = Path(filename or "upload.bin").suffix
    object_name = f"{settings.GCS_UPLOAD_PREFIX}/{uuid4()}{suffix}"

    client = storage.Client(credentials=credentials, project=settings.GCS_PROJECT_ID)
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(object_name)
    blob.upload_from_string(content, content_type=content_type or "application/octet-stream")

    return f"https://storage.googleapis.com/{bucket_name}/{object_name}"


def _gcs_upload_with_object_name(content: bytes, object_name: str, content_type: Optional[str]) -> str:
    bucket_name = settings.GCS_BUCKET_NAME
    if not bucket_name:
        raise ValueError("GCS_BUCKET_NAME is not configured")

    key_path = settings.GCS_SERVICE_ACCOUNT_KEY_PATH
    if not key_path:
        raise ValueError("GCS_SERVICE_ACCOUNT_KEY_PATH is not configured")

    from google.oauth2 import service_account
    credentials = service_account.Credentials.from_service_account_file(
        key_path,
        scopes=["https://www.googleapis.com/auth/cloud-platform"],
    )

    client = storage.Client(credentials=credentials, project=settings.GCS_PROJECT_ID)
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


def generate_signed_upload_url(
    complaint_id: str,
    content_type: str = "image/jpeg",
) -> Dict[str, str]:
    """
    Generate a signed URL for direct browser upload to GCS.
    Returns both the signed upload URL (PUT) and the permanent public view URL.
    """
    allowed_types = ["image/jpeg", "image/png"]
    if content_type not in allowed_types:
        raise ValueError(f"Invalid content type: {content_type}. Allowed: {allowed_types}")

    bucket_name = settings.GCS_BUCKET_NAME
    if not bucket_name:
        raise ValueError("GCS_BUCKET_NAME is not configured")

    key_path = settings.GCS_SERVICE_ACCOUNT_KEY_PATH
    if not key_path:
        raise ValueError("GCS_SERVICE_ACCOUNT_KEY_PATH is not configured")

    from google.oauth2 import service_account
    credentials = service_account.Credentials.from_service_account_file(
        key_path,
        scopes=["https://www.googleapis.com/auth/cloud-platform"],
    )

    extension = "jpg" if content_type == "image/jpeg" else "png"
    file_id = str(uuid4())
    object_path = f"{settings.GCS_UPLOAD_PREFIX}/{complaint_id}/images/{file_id}.{extension}"

    client = storage.Client(credentials=credentials, project=settings.GCS_PROJECT_ID)
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(object_path)

    signed_url = blob.generate_signed_url(
        version="v4",
        expiration=900,
        method="PUT",
        content_type=content_type,
        credentials=credentials,
    )

    public_url = f"https://storage.googleapis.com/{bucket_name}/{object_path}"

    return {
        "upload_url": signed_url,
        "file_url": public_url,
        "object_path": object_path,
    }
