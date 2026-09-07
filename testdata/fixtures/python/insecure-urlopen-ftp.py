"""insecure-urlopen-ftp: insecure transport in urllib calls.

Fully-qualified http:// (or ftp://) URLs passed straight to urllib, or
assigned to a variable first, are reported; https:// URLs and
unrelated calls are not.
"""
import urllib.request


def fetch_direct():
    # ruleid: insecure-urlopen-ftp
    urllib.request.urlopen("ftp://example.com/data", timeout=5)


def fetch_assigned():
    # ruleid: insecure-urlopen-ftp
    url = "ftp://example.com/data"
    urllib.request.urlopen(url, timeout=5)


def fetch_secure():
    # ok: insecure-urlopen-ftp
    urllib.request.urlopen("https://example.com/data", timeout=5)


def fetch_secure_assigned():
    # ok: insecure-urlopen-ftp
    url = "https://example.com/data"
    urllib.request.urlopen(url, timeout=5)
