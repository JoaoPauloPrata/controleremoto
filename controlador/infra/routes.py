from starlette.routing import Route

from infra.controllers.keyboardFunctions import *
from infra.controllers.mouseFunctions import *


ROUTES = [
    Route("/enter", enter, methods=["POST"]),
    Route("/backspace", backspace, methods=["POST"]),
    Route("/pressandunpresskey", pressAndUnpressKey, methods=["POST"]),
    Route("/presskey", pressKey, methods=["POST"]),
    Route("/unpresskey", unPressKey, methods=["POST"]),
    Route("/pressright", pressRightButton, methods=["POST"]),
    Route("/unpressright", unPressRightButton, methods=["POST"]),
    Route("/pressleft", pressLeftButton, methods=["POST"]),
    Route("/unpressleft", unPressLeftButton, methods=["POST"]),
    Route("/moovemouse", mooveMouse, methods=["POST"]),
    Route("/mousescroll", mouseScrool, methods=["POST"]),
    Route("/mouseclick", mouseClick, methods=["POST"]),
]