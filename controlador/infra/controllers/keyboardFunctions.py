from starlette.requests import Request
from models.KeyboardControls import *
from pynput.keyboard import Key
from pynput.keyboard import  Controller as keyBoard

keyboard = keyBoard()

from infra.server import *

#KEYBOARD FUNCTIONS

# @app.post('/backspace')
def backspace():
    keyboard.press(Key.backspace)
# @app.post('/enter')
def enter(request: Request):
    keyboard.press(Key.enter)    
    
# @app.post('/pressandunpresskey')
def pressAndUnpressKey(key: KeyboarComands):
    keyboard.press(key.keyPressed)
    keyboard.release(key.keyPressed)

# @app.post('/presskey')
def pressKey(key: KeyboarComands):
    keyboard.press(key.keyPressed)
# @app.post('/unpresskey')
def unPressKey(key: KeyboarComands):
    keyboard.release(key.keyPressed)