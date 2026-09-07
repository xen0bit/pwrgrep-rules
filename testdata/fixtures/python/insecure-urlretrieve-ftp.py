"""insecure-urlretrieve-ftp: insecure transport in urllib calls.

Fully-qualified http:// (or ftp://) URLs passed straight to urllib, or
assigned to a variable first, are reported; https:// URLs and
unrelated calls are not.
"""
import urllib.request


def fetch_direct():
    # ruleid: insecure-urlretrieve-ftp
    urllib.request.urlretrieve("ftp://example.com/data", timeout=5)


def fetch_assigned():
    # ruleid: insecure-urlretrieve-ftp
    url = "ftp://example.com/data"
    urllib.request.urlretrieve(url, timeout=5)


def fetch_secure():
    # ok: insecure-urlretrieve-ftp
    urllib.request.urlretrieve("https://example.com/data", timeout=5)


def fetch_secure_assigned():
    # ok: insecure-urlretrieve-ftp
    url = "https://example.com/data"
    urllib.request.urlretrieve(url, timeout=5)
