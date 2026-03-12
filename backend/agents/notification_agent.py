# backend/agents/notification_agent.py
from services.notification_service import create_notification
from db import SessionLocal


def notify_node(state):

    db = SessionLocal()

    try:

        create_notification(
            db,
            state["complaint_id"],
            "Complaint processed and task assigned.",
            "system_update"
        )

        state["reasoning"].append(
            "Citizen notified"
        )

    finally:
        db.close()

    return state