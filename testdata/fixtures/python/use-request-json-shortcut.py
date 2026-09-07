"""use-request-json-shortcut: body=json.dumps() has a json= shortcut.

Passing body=json.dumps(...) to requests is reported (use json=...);
passing json= directly or data= without json is not.
"""
import json

import requests


def create_direct():
    # ruleid: use-request-json-shortcut
    return requests.post("https://example.com/api", body=json.dumps({"a": 1}))


def create_extra_kwarg():
    # ruleid: use-request-json-shortcut
    return requests.post("https://example.com/api", body=json.dumps({"a": 1}), timeout=5)


def create_shortcut():
    # ok: use-request-json-shortcut
    return requests.post("https://example.com/api", json={"a": 1})


def create_plain():
    # ok: use-request-json-shortcut
    return requests.post("https://example.com/api", data="a=1")
