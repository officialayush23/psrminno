# backend/services/rule_engine.py
rules = {
    "tree":2,
    "pole":1,
    "streetlight":1,
    "drain":3,
    "garbage":5
}

def rule_classify(text):

    text = text.lower()

    for word,dept in rules.items():
        if word in text:
            return {"department_id":dept}

    return {}