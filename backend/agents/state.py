# backend/agetns/state.py
from typing import TypedDict, Optional


class CivicState(TypedDict):

    complaint_id: int
    text: str
    lat: float
    lng: float

    asset_type: Optional[str]
    urgency: Optional[str]

    asset_id: Optional[int]
    department_id: Optional[int]

    task_id: Optional[int]

    alerts_created: bool

    reasoning: list