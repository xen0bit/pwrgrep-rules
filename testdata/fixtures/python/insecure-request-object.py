"""insecure-request-object: insecure transport in urllib calls.

Fully-qualified http:// (or ftp://) URLs passed straight to urllib, or
assigned to a variable first, are reported; https:// URLs and
unrelated calls are not.
"""
import urllib.request


def fetch_direct():
    # ruleid: insecure-request-object
    urllib.request.Request("http://example.com/data", timeout=5)


def fetch_assigned():
    # ruleid: insecure-request-object
    url = "http://example.com/data"
    urllib.request.Request(url, timeout=5)


def fetch_secure():
    # ok: insecure-request-object
    urllib.request.Request("https://example.com/data", timeout=5)


def fetch_secure_assigned():
    # ok: insecure-request-object
    url = "https://example.com/data"
    urllib.request.Request(url, timeout=5)
