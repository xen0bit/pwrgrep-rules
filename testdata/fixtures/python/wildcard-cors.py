# allow_origins=["*"] lets any site read responses: the API's data
# becomes every site's data. Flag the wildcard; named origins are fix.
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()


def flag_wildcard():
    # ruleid: wildcard-cors
    app.add_middleware(CORSMiddleware, allow_origins=["*"])
    # ruleid: wildcard-cors
    app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_methods=["*"])
    origins = ["*"]
    # ruleid: wildcard-cors
    app.add_middleware(CORSMiddleware, allow_origins=origins)


def safe_origins():
    # ok: wildcard-cors
    app.add_middleware(CORSMiddleware, allow_origins=["https://example.com"])
    # ok: wildcard-cors
    app.add_middleware(CORSMiddleware, allow_origins=["https://a.example.com", "https://b.example.com"])
    # ok: wildcard-cors
    app.add_middleware(CORSMiddleware, allow_origins=[])
