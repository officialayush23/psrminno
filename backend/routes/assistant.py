# backend/routes/assistant.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from db import get_db
from schemas import AssistantQuery
from dependencies import get_current_user
from services.assistant_service import run_admin_query

router = APIRouter(
    prefix="/api/assistant",
    tags=["AI Assistant"]
)


@router.post("/query")

def assistant_query(
    data: AssistantQuery,
    db: Session = Depends(get_db),
    user = Depends(get_current_user)
):

    result = run_admin_query(db, data.query)

    return result