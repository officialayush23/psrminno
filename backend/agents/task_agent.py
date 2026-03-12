# backend/agetns/task_agent.py
from services.task_service import create_task_for_complaint
from db import SessionLocal


def task_node(state):

    db = SessionLocal()

    try:

        task = create_task_for_complaint(
            db,
            state["complaint_id"]
        )

        state["task_id"] = task.id

        state["reasoning"].append(
            f"Task created: {task.id}"
        )

    finally:
        db.close()

    return state