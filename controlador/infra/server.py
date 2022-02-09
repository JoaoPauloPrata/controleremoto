from distutils.log import debug
from fastapi import FastAPI
from starlette.applications import Starlette

from infra.routes import ROUTES


app = Starlette(routes=ROUTES, debug=True)

 
