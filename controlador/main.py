from ast import Str
import string

from threading import *

from pynput.mouse import Button, Controller
from pynput.keyboard import Key
from pynput.keyboard import  Controller as keyBoard
from fastapi import FastAPI, Query
from pydantic import BaseModel

class Moove(BaseModel):
    mooveAxisX: float
    mooveAxisY: float
class ScrollMoove(BaseModel):
    moove: float
class KeyboarComands(BaseModel):
    keyPressed: str


app = FastAPI()
mouse = Controller()
keyboard = keyBoard()

@app.post('/moovejoystick')
def mooveJoystick(moove: Moove):
    mouse.move(moove.mooveAxisX, moove.mooveAxisY)
   

#MOUSE FUNCTIONS    
@app.post('/mouseclick')
def pressRightButton():
    mouse.click(Button.left)
@app.post('/pressright')
def pressRightButton():
    mouse.press(Button.right)
@app.post('/unpressright')
def unPressRightButton():
    mouse.release(Button.right)
@app.post('/pressleft')
def pressLeftButton():
    mouse.press(Button.left)
@app.post('/unpressleft')
def unPressLeftButton():
    mouse.release(Button.left)
@app.post('/moovemouse')
def mooveMouse(moove: Moove):
    mouse.move(moove.mooveAxisX, moove.mooveAxisY)
@app.post('/mousescroll')
def mouseScrool(moove: ScrollMoove):
    mouse.scroll(0, moove.moove)

#KEYBOARD FUNCTIONS

@app.post('/backspace')
def backspace():
    keyboard.press(Key.backspace)
@app.post('/enter')
def enter():
    keyboard.press(Key.enter)    
    
@app.post('/pressandunpresskey')
def pressAndUnpressKey(key: KeyboarComands):
    keyboard.press(key.keyPressed)
    keyboard.release(key.keyPressed)

@app.post('/presskey')
def pressKey(key: KeyboarComands):
    keyboard.press(key.keyPressed)
@app.post('/unpresskey')
def unPressKey(key: KeyboarComands):
    keyboard.release(key.keyPressed)
    
