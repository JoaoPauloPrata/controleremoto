from starlette.requests import Request
from starlette.responses import JSONResponse

from pynput.keyboard import Key
from pynput.keyboard import  Controller as keyBoard

keyboard = keyBoard()

from infra.server import *

#KEYBOARD FUNCTIONS

# @app.post('/backspace')
async def backspace(request: Request):

    keyboard.press(Key.backspace)
    return JSONResponse({"response": "succsess"}) 
# @app.post('/enter')
async def enter(request: Request):
    keyboard.press(Key.enter)
    return JSONResponse({"response": "succsess"}) 
    
# @app.post('/pressandunpresskey')
async def pressAndUnpressKey(request: Request):
    data = await request.json() 
    keyboard.press(data["keyPressed"])
    keyboard.release(data["keyPressed"])
    return JSONResponse({"response": "succsess"}) 
# @app.post('/presskey')
async def pressKey(request: Request):
    data = await request.json()
    keyboard.press(data["keyPressed"])
    return JSONResponse({"response": "succsess"}) 
# @app.post('/unpresskey')
async def unPressKey(request: Request):
    data = await request.json()
    keyboard.release(data["keyPressed"])
    return JSONResponse({"response": "succsess"}) 