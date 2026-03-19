# backend/services/survey_service.py
from sqlalchemy.orm import Session
from sqlalchemy import text
from models import SurveyResponse, Complaint, Contractor, Task, DomainEvent 


def submit_feedback(db: Session, complaint_id: int, rating: int, comment: str):

    feedback = SurveyResponse(
        complaint_id=complaint_id,
        rating=rating,
        comment=comment
    )

    db.add(feedback)

    complaint = db.query(Complaint).filter(
        Complaint.id == complaint_id
    ).first()

    complaint.status = "RESOLVED"

    task = db.query(Task).filter(
        Task.complaint_id == complaint_id
    ).first()

    contractor = None

    if task:
        contractor = db.query(Contractor).filter(
            Contractor.id == task.contractor_id
        ).first()

    if contractor:

        contractor.jobs_completed += 1

        # update average rating

        result = db.execute(text("""
            SELECT AVG(rating)
            FROM feedback f
            JOIN tasks t
            ON f.complaint_id = t.complaint_id
            WHERE t.contractor_id=:cid
        """), {"cid": contractor.id}).fetchone()

        if result:
            contractor.rating = float(result[0])

    event = DomainEvent(
        complaint_id=complaint_id,
        event_type="SURVEY_SUBMITTED",
        agent_name="SurveyService",
        payload={
            "rating": rating
        }
    )

    db.add(event)

    db.commit()

    return {
        "status": "survey_recorded"
    }