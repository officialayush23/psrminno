from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import text

from db import get_db
from dependencies import get_current_user
from schemas import TokenData

router = APIRouter(prefix="/stats", tags=["Stats"])


@router.get("/me")
def get_my_stats(
    db: Session = Depends(get_db),
    current_user: TokenData = Depends(get_current_user),
):
    """
    Returns aggregate stats for the authenticated citizen:
      total_count, active_count, resolved_count, avg_resolution_days
    """
    row = db.execute(
        text("""
            SELECT
                COUNT(*)                                                   AS total_count,
                COUNT(*) FILTER (WHERE status NOT IN (
                    'resolved', 'closed', 'rejected'
                ))                                                         AS active_count,
                COUNT(*) FILTER (WHERE status IN ('resolved', 'closed'))   AS resolved_count,
                ROUND(
                    AVG(
                        EXTRACT(EPOCH FROM (resolved_at - created_at)) / 86400.0
                    ) FILTER (WHERE resolved_at IS NOT NULL),
                    1
                )                                                          AS avg_resolution_days
            FROM complaints
            WHERE citizen_id = CAST(:uid AS uuid)
              AND is_deleted = false
        """),
        {"uid": str(current_user.user_id)},
    ).mappings().first()

    return {
        "total_count": int(row["total_count"] or 0),
        "active_count": int(row["active_count"] or 0),
        "resolved_count": int(row["resolved_count"] or 0),
        "avg_resolution_days": float(row["avg_resolution_days"]) if row["avg_resolution_days"] is not None else None,
    }
