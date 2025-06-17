from fastapi import FastAPI
from app.routers import eventos

app = FastAPI()

@app.get("/health")
def health_check():
    return {"status": "ok"}

app.include_router(eventos.router, prefix="/eventos")