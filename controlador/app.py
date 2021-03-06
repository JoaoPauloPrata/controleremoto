from cProfile import label
import uvicorn
import socket
import pyqrcode as pqr
from tkinter import *


ipv4 = socket.gethostbyname(socket.gethostname())
if __name__ == "__main__":
    code = pqr.create(ipv4)
    code_xbm = code.xbm(scale = 5)
    jan = Tk()
    code_bmp = BitmapImage(data = code_xbm)
    code_bmp.config(foreground="black")
    code_bmp.config(background="white")
    label = Label(image = code_bmp)
    label.pack()
    jan.mainloop()
    uvicorn.run("infra.server:app", host=ipv4, port=8000, reload=True)
    


