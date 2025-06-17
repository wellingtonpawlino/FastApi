from fastapi import APIRouter
from app.models import Evento
from app.database import db

router = APIRouter()

@router.post("/")
async def criar_evento(evento: Evento):
    await db.eventos.insert_one(evento.dict())
    return {"status": "evento salvo"}

@router.get("/")
async def listar_eventos():
    eventos = await db.eventos.find().to_list(100)
    return eventos