# A session fetching a literal URL has a fixed, reviewable destination.
# Flag literal URLs in a Session (the rule fires on any string, http or
# https); computed URLs are the variable case.
import requests


def flag_literal():
    with requests.Session() as s:
        # ruleid: request-session-http-in-with-context
        s.get("http://example.com/api")
        # ruleid: request-session-http-in-with-context
        s.post("http://example.com/login", data=data)
        # ruleid: request-session-http-in-with-context
        s.put("http://example.com/api")


def safe_variable(url):
    with requests.Session() as s:
        # ok: request-session-http-in-with-context
        s.get(url)
        # ok: request-session-http-in-with-context
        s.post(url, data=data)
        # ok: request-session-http-in-with-context
        s.delete(url)
