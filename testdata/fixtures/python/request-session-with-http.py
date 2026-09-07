# A chained Session fetching a literal URL has a fixed, reviewable
# destination. Flag literal URLs (the rule fires on any string, http or
# https); computed URLs are the variable case.
import requests


def flag_literal():
    # ruleid: request-session-with-http
    requests.Session().get("http://example.com/api")
    # ruleid: request-session-with-http
    requests.Session().post("http://example.com/login", data=data)
    # ruleid: request-session-with-http
    requests.Session().put("http://example.com/api")


def safe_variable(url):
    # ok: request-session-with-http
    requests.Session().get(url)
    # ok: request-session-with-http
    requests.Session().post(url, data=data)
    # ok: request-session-with-http
    requests.Session().delete(url)
