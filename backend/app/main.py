from fastapi import FastAPI
from .routers import agents, auth

app = FastAPI(title="TaskForge-AI — MVP")

app.include_router(auth.router, prefix="/auth")
app.include_router(agents.router)
