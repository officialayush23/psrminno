import json
from datetime import datetime
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, File, Form, HTTPException, UploadFile
from sqlalchemy import text
from sqlalchemy.orm import Session

from db import get_db
from dependencies import get_current_user
from models import City, InfraType, User
from schemas import ComplaintIngestRequest, ComplaintIngestResponse, TokenData
from services.complaint_service import (
    get_complaint_by_id as get_complaint_by_id_service,
    ingest_complaint as ingest_complaint_service,
)
from services.storage_service import generate_signed_upload_url

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


@router.get("/complaints/upload-url")
def get_upload_url(
    complaint_id: str,
    content_type: str = "image/jpeg",
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    allowed_roles = ["citizen", "worker", "contractor"]
    if current_user.role not in allowed_roles:
        raise HTTPException(status_code=403, detail="Not allowed to upload images")

    try:
        result = generate_signed_upload_url(complaint_id, content_type)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))

    return result


@router.patch("/complaints/{complaint_id}/images")
def append_complaint_image(
    complaint_id: str,
    file_url: str,
    object_path: str,
    content_type: str = "image/jpeg",
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    new_image = {
        "url": file_url,
        "object_path": object_path,
        "storage": "gcs",
        "mime_type": content_type,
        "uploaded_by": str(current_user.user_id),
        "uploaded_at": datetime.utcnow().isoformat(),
    }

    db.execute(
        text(
            """
            UPDATE complaints
            SET images = images || :new_image::jsonb,
                updated_at = now()
            WHERE id = CAST(:complaint_id AS uuid)
              AND is_deleted = false
        """
        ),
        {
            "complaint_id": complaint_id,
            "new_image": json.dumps(new_image),
        }
    )
    db.commit()

    return {"message": "Image appended successfully", "image": new_image}
