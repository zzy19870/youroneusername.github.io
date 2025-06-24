from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

# 定义一个模型，接收前端发送的请求数据
class Message(BaseModel):
    text: str

# 处理GET请求
@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

# 处理POST请求
@app.post("/send_message/")
def send_message(message: Message):
    return {"message_received": message.text}
