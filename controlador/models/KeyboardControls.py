from pydantic import BaseModel


class KeyboarComands(BaseModel):
    keyPressed: str
