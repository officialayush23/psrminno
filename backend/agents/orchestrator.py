# backend/agents/orchestrator.py
from langgraph.graph import StateGraph, END

from agents.state import CivicState
from agents.routing_agent import extraction_node, tool_execution_node, finalize_routing_node
from agents.task_agent import task_node
from agents.predictive_node import predictive_node
from agents.notification_agent import notify_node


workflow = StateGraph(CivicState)

workflow.add_node("extract", extraction_node)

workflow.add_node("geo_lookup", tool_execution_node)

workflow.add_node("finalize_routing", finalize_routing_node)

workflow.add_node("task_creation", task_node)

workflow.add_node("predictive_monitor", predictive_node)

workflow.add_node("notify", notify_node)


workflow.set_entry_point("extract")

workflow.add_edge("extract", "geo_lookup")

workflow.add_edge("geo_lookup", "finalize_routing")

workflow.add_edge("finalize_routing", "task_creation")

workflow.add_edge("task_creation", "predictive_monitor")

workflow.add_edge("predictive_monitor", "notify")

workflow.add_edge("notify", END)


civic_orchestrator = workflow.compile()



    
def run_civic_workflow(complaint_id, text, lat, lng):

    state = {
        "complaint_id": complaint_id,
        "text": text,
        "lat": lat,
        "lng": lng,
        "reasoning": []
    }

    civic_orchestrator.invoke(state)