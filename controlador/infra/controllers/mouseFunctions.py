from pynput.mouse import Button, Controller
mouse = Controller()

from models.MouseControls import *
from infra.server import *
#MOUSE FUNCTIONS    
#@app.post('/mouseclick')
def pressRightButton():
    mouse.click(Button.left)
#@app.post('/pressright')
def pressRightButton():
    mouse.press(Button.right)
#@app.post('/unpressright')
def unPressRightButton():
    mouse.release(Button.right)
#@app.post('/pressleft')
def pressLeftButton():
    mouse.press(Button.left)
#@app.post('/unpressleft')
def unPressLeftButton():
    mouse.release(Button.left)
#@app.post('/moovemouse')
def mooveMouse(moove: Moove):
    mouse.move(moove.mooveAxisX, moove.mooveAxisY)
#@app.post('/mousescroll')
def mouseScrool(moove: ScrollMoove):
    mouse.scroll(0, moove.moove)