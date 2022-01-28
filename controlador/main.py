import json
from threading import *
import time
from pynput.mouse import Button, Controller
from fastapi import FastAPI, Query
from pydantic import BaseModel

class Moove(BaseModel):
    mooveAxisX: float
    mooveAxisY: float
class ScrollMoove(BaseModel):
    moove: float
app = FastAPI()
mouse = Controller()
@app.post('/left')
def left():
    mouse.move(-5,0)
@app.post('/right')
def right():
    mouse.move(5,0)
@app.post('/up')
def up():
    mouse.move(0,-5).start()
@app.post('/down')
def down():
    mouse.move(0,5)



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


#mouse.position = (0, 0)
# mouse.click(Button.left, 2);
# mouse.press(Button.left);
# mouse.release(Button.left);
# mouse.scroll(0, -100);
