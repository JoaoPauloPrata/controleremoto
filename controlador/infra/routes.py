from starlette.routing import Route

from infra.controllers.keyboardFunctions import enter


ROUTES = [Route("/enter", enter)]