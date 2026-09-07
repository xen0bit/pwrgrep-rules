"""flask-api-method-string-format: user arg formatted into requests call.

An API-controller method passing a parameter through str.format into
requests is reported; literal interpolations and format-free calls
are not.
"""
import requests


class ApiController(object):
    method_decorators = []

    def fetch(self, arg):
        # ruleid: flask-api-method-string-format
        return requests.get("{}".format(arg))

    def build(self, arg):
        # ruleid: flask-api-method-string-format
        url = "{}".format(arg)
        return requests.get(url)

    def fetch_timeout(self, arg):
        # ruleid: flask-api-method-string-format
        return requests.get("{}".format(arg), timeout=5)

    def static(self):
        # ok: flask-api-method-string-format
        return requests.get("{}".format("fixed"))

    def plain(self, arg):
        # ok: flask-api-method-string-format
        return requests.get("https://example.com/" + arg)
