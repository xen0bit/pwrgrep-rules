# requests fetches whatever string it is handed. A literal URL is a fixed,
# reviewable destination, so flag the literal that is itself http://; a URL
# from a variable, an https:// literal, or a namespace URL is not this.
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
    # ok: request-with-http
    requests.get("https://example.com/api")
    # ok: request-with-http
    requests.get("http://www.w3.org/2001/XMLSchema")
