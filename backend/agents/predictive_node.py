# backend/agents/predictive_node.py
from agents.predictive_agent import detect_clusters
from db import SessionLocal


def predictive_node(state):

    db = SessionLocal()

    try:

        detect_clusters(db)

        state["alerts_created"] = True

        state["reasoning"].append(
            "Cluster analysis executed"
        )

    finally:
        db.close()

    return state