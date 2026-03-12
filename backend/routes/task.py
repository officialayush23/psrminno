# backend/routes/task.py
from pydoc import text

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from db import get_db
from schemas import TokenData
from dependencies import get_current_user
from services.task_service import create_task_for_complaint, update_task_status

router = APIRouter(prefix="/api/tasks", tags=["Tasks"])


@router.post("/create/{complaint_id}")
def create_task(
    complaint_id: int,
    db: Session = Depends(get_db),
    user: TokenData = Depends(get_current_user)
):

    task = create_task_for_complaint(db, complaint_id)

    return {"task_id": task.id}


@router.post("/update/{task_id}")
def update_status(
    task_id: int,
    status: str,
    db: Session = Depends(get_db),
    user: TokenData = Depends(get_current_user)
):

    task = update_task_status(
        db,
        task_id,
        status,
        user.user_id
    )

    return {"task_id": task.id, "status": task.status}



@router.get("/my")

def my_tasks(
    db: Session = Depends(get_db),
    user: TokenData = Depends(get_current_user)
):

    tasks = db.execute(
        text("""
        SELECT id,status,complaint_id
        FROM tasks
        WHERE employee_id=:uid
        """),
        {"uid": str(user.user_id)}
    ).fetchall()

    return [
        {
            "task_id": t[0],
            "status": t[1],
            "complaint_id": t[2]
        }
        for t in tasks
    ]