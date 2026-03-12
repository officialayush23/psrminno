# backend/services/assistant_service.py
import json
from sqlalchemy.orm import Session
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_core.messages import HumanMessage, SystemMessage

from config import settings
from services.assistant_tools import (
    tool_department_stats,
    tool_zone_stats,
    tool_contractor_stats,
    tool_complaint_heatmap
)

llm = ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    api_key=settings.GEMINI_API_KEY,
    temperature=0.2
)


def run_admin_query(db: Session, query: str):

    system_prompt = """
You are an AI assistant for a city infrastructure control system.

You can call tools.

TOOLS AVAILABLE:

department_stats
zone_stats
contractor_stats
complaint_heatmap

Return JSON:
{
 "tool": "<tool_name>",
 "reason": "why this tool is needed"
}
"""

    response = llm.invoke([
        SystemMessage(content=system_prompt),
        HumanMessage(content=query)
    ])

    try:
        data = json.loads(response.content)
    except:
        return {"answer": response.content}

    tool = data.get("tool")

    if tool == "department_stats":
        return tool_department_stats(db)

    if tool == "zone_stats":
        return tool_zone_stats(db)

    if tool == "contractor_stats":
        return tool_contractor_stats(db)

    if tool == "complaint_heatmap":
        return tool_complaint_heatmap(db)

    return {"answer": "No suitable tool found"}