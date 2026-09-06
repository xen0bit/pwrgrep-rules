# CWE-918: Server-side request forgery — the URL is the caller's choice.
#
# A URL the caller chose that reaches `requests.get`, `urllib.request.urlopen`
# or `httpx.get` lets the caller make the server fetch an internal address.
# A literal URL is safe.
import requests
import urllib.request
import httpx
from flask import request


@app.route("/fetch/<url>")
def from_route(url):
    # ruleid: python-ssrf
    requests.get(url)
    # ruleid: python-ssrf
    urllib.request.urlopen(url)


def from_query():
    u = request.args.get("url")
    # ruleid: python-ssrf
    requests.get(u)
    # ruleid: python-ssrf
    requests.post(u, data="hi")
    # ruleid: python-ssrf
    httpx.get(u)
    # Propagation through a variable — reaching must follow it.
    target = u
    # ruleid: python-ssrf
    urllib.request.urlopen(target)
    # ruleid: python-ssrf
    httpx.post(target)


def safe_literal():
    # ok: python-ssrf
    requests.get("https://example.com/api")
    # ok: python-ssrf
    urllib.request.urlopen("https://example.com/data")
    # ok: python-ssrf
    httpx.get("https://example.com/static")
    # ok: python-ssrf
    requests.post("https://example.com/submit", data="x")


def safe_constant():
    base = "https://example.com/"
    path = "api/v1"
    # ok: python-ssrf
    requests.get(base + path)
