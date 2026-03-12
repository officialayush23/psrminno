# backend/routes/surveys.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from db import get_db
from schemas import SurveySubmit
from dependencies import get_current_user
from services.survey_service import submit_feedback


router = APIRouter(
    prefix="/api/surveys",
    tags=["Surveys"]
)


@router.post("/submit")

def submit_survey(
    data: SurveySubmit,
    db: Session = Depends(get_db),
    user = Depends(get_current_user)
):

    result = submit_feedback(
        db,
        data.complaint_id,
        data.rating,
        data.comment
    )

    return result