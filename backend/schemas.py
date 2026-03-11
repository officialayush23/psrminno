# backend/schemas.py
from pydantic import BaseModel

class ComplaintCreate(BaseModel):
    text: str
    lat: float
    lng: float
    user_id: str