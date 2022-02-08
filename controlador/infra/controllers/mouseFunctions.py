from urllib.request import Request
from starlette.responses import JSONResponse
from pynput.mouse import Button, Controller
mouse = Controller()


from infra.server import *
#MOUSE FUNCTIONS    
#@app.post('/mouseclick')

def mouseClick(request : Request):
    mouse.click(Button.left)
    return JSONResponse({"response": "succsess"}) 

#@app.post('/pressright')
def pressRightButton(request : Request):
    mouse.press(Button.right)
    return JSONResponse({"response": "succsess"}) 
#@app.post('/unpressright')
def unPressRightButton(request : Request):
    mouse.release(Button.right)
    return JSONResponse({"response": "succsess"}) 
#@app.post('/pressleft')
def pressLeftButton(request : Request):
    mouse.press(Button.left)
    return JSONResponse({"response": "succsess"}) 
#@app.post('/unpressleft')
def unPressLeftButton(request : Request):
    mouse.release(Button.left)
    return JSONResponse({"response": "succsess"}) 
#@app.post('/moovemouse')
async def mooveMouse(request : Request):
    data = await request.json() 
    mouse.move(data["mooveAxisX"], data["mooveAxisY"])
    return JSONResponse({"response": "succsess"}) 
#@app.post('/mousescroll')
async def mouseScrool(request : Request):
    data = await request.json() 
    mouse.scroll(0, data["moove"])
    return JSONResponse({"response": "succsess"}) 