from pydantic import BaseModel
from datetime import datetime

class Evento(BaseModel):
    tipo: str
    servico: str
    mensagem: str
    nivel: str
    timestamp: datetime