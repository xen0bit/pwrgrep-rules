# requests fetches whatever string it is handed, so a literal URL is
# a fixed, reviewable destination. Flag literal URLs (the rule fires
# on any string, http or https); computed URLs are the variable case.
import requests


def flag_literal():
    # ruleid: request-with-http
    requests.get("http://example.com/api")
    # ruleid: request-with-http
    requests.post("http://example.com/login", data=data)
    # ruleid: request-with-http
    requests.put("http://example.com/api")


def safe_variable(url):
    # ok: request-with-http
    requests.get(url)
    # ok: request-with-http
    requests.post(url, data=data)
    # ok: request-with-http
    requests.delete(url)
