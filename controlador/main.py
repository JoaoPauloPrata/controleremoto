from pynput.mouse import Button, Controller
from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get('/')
def raiz():
    mouse = Controller()
    mouse.move(10,0)

#mouse.position = (0, 0)
# mouse.click(Button.left, 2);
# mouse.press(Button.left);
# mouse.release(Button.left);
# mouse.scroll(0, -100);
