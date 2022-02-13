"""FastAPI + Redis counter demo app
"""
import os

import redis
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()

backend = redis.Redis(host=os.environ.get('REDIS_HOST', 'web-counter-redis.default'),
                      port=int(os.environ.get('REDIS_PORT', '6379')))


@app.get('/{name}', response_class=PlainTextResponse)
def read(name: str):
    value = backend.incr(name)
    if value is None:
        value = 0
    return "Hola! We have hit counter " + str(int(value))+  " times\n"
