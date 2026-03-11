# backend/services/gemini_service.py
from google import genai
import os
import json

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))

def classify_complaint(text):

    prompt = f"""
Classify this civic complaint.

Complaint: {text}

Return JSON:
department_id
asset_type
urgency
"""

    response = client.models.generate_content(
        model="gemini-2.5-flash",
        contents=prompt
    )

    try:
        return json.loads(response.text)
    except:
        return {}