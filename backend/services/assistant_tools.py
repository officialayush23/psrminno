# backend/services/assistant_tools.py
from sqlalchemy.orm import Session
from services.analytics_service import (
    complaints_by_department,
    zone_complaint_distribution,
    contractor_performance,
    complaints_heatmap
)

def tool_department_stats(db: Session):
    return complaints_by_department(db)

def tool_zone_stats(db: Session):
    return zone_complaint_distribution(db)

def tool_contractor_stats(db: Session):
    return contractor_performance(db)

def tool_complaint_heatmap(db: Session):
    return complaints_heatmap(db)