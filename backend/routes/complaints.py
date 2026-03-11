# backend/routes/complaints.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from db import get_db
from schemas import ComplaintCreate
from services.geo_service import find_nearest_asset
from services.gemini_service import classify_complaint
from services.rule_engine import rule_classify
from sqlalchemy import text

router = APIRouter(prefix="/complaints")

@router.post("/")
def create_complaint(data: ComplaintCreate, db: Session = Depends(get_db)):

    asset = find_nearest_asset(db, data.lat, data.lng)

    rule_result = rule_classify(data.text)

    ai_result = classify_complaint(data.text)

    department_id = ai_result.get("department_id")

    query = text("""
        INSERT INTO complaints (user_id,text,location,asset_id,department_id)
        VALUES (
            :user_id,
            :text,
            ST_SetSRID(ST_MakePoint(:lng,:lat),4326),
            :asset_id,
            :department_id
        )
        RETURNING id
    """)

    result = db.execute(query,{
        "user_id":data.user_id,
        "text":data.text,
        "lng":data.lng,
        "lat":data.lat,
        "asset_id":asset,
        "department_id":department_id
    })

    complaint_id = result.fetchone()[0]
    db.commit()

    return {"complaint_id":complaint_id}