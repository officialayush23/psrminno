# backend/schemas.py
from pydantic import BaseModel, UUID4
from typing import Optional

class ComplaintCreate(BaseModel):
    text: str
    lat: float
    lng: float
    photo_url: Optional[str] = None

class ComplaintResponse(BaseModel):
    id: int
    status: str
    message: str

class TokenData(BaseModel):
    user_id: UUID4
    role: str
    
class SurveySubmit(BaseModel):

    complaint_id: int
    rating: int
    comment: str
    

class AssistantQuery(BaseModel):
    query: str