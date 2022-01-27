from threading import *
import time
from pynput.mouse import Button, Controller
from fastapi import FastAPI
import uvicorn


app = FastAPI()
mouse = Controller()
@app.get('/left')
def left():
    mouse.move(-10,0)
@app.get('/right')
def right():
    mouse.move(10,0)
@app.get('/up')
def up():
    mouse.move(0,-10).start()
@app.get('/down')
def down():
    mouse.move(0,10)




#mouse.position = (0, 0)
# mouse.click(Button.left, 2);
# mouse.press(Button.left);
# mouse.release(Button.left);
# mouse.scroll(0, -100);
