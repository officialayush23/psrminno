# backend/main.py
from fastapi import FastAPI


app = FastAPI(
    title="PSCRM Civic Intelligence API",
    version="1.0"
)



@app.get("/")
def root():
    return {"message": "PSCRM backend running"}