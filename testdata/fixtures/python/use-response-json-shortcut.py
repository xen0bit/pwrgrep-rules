"""use-response-json-shortcut: json.loads(resp.text) has a .json() shortcut.

Deserializing a requests response body by hand is reported (use
resp.json()); already-parsed bodies and non-requests JSON are not.
"""
import json

import requests


def read_manual():
    resp = requests.get("https://example.com/api")
    # ruleid: use-response-json-shortcut
    return json.loads(resp.text)


def read_manual_post():
    resp = requests.post("https://example.com/api", json={"a": 1})
    # ruleid: use-response-json-shortcut
    return json.loads(resp.text)


def read_shortcut():
    resp = requests.get("https://example.com/api")
    # ok: use-response-json-shortcut
    return resp.json()


def read_plain():
    # ok: use-response-json-shortcut
    return json.loads('{"a": 1}')
