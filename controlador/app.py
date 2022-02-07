import uvicorn
import socket

ipv4 = socket.gethostbyname(socket.gethostname())
if __name__ == "__main__":
    uvicorn.run("infra.server:app", host=ipv4, port=8000, reload=True)