from fastapi import FastAPI
from infra.routes import ROUTES


app = FastAPI(routes=ROUTES)

app2 = app