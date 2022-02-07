from pydantic import BaseModel

class Moove(BaseModel):
    mooveAxisX: float
    mooveAxisY: float
class ScrollMoove(BaseModel):
    moove: float