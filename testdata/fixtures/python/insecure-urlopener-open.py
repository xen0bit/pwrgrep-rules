"""insecure-urlopener-open: insecure transport through urllib opener objects.

A hard-coded http:// (or ftp://) URL opened through an explicitly built
opener, directly or via a variable, is reported; https:// URLs are not.
"""
import urllib.request


def open_direct():
    # ruleid: insecure-urlopener-open
    urllib.request.URLopener().open("http://example.com/data")


def open_via_handle():
    opener = urllib.request.URLopener()
    # ruleid: insecure-urlopener-open
    opener.open("http://example.com/data")


def open_secure():
    # ok: insecure-urlopener-open
    urllib.request.URLopener().open("https://example.com/data")


def open_secure_handle():
    opener = urllib.request.URLopener()
    # ok: insecure-urlopener-open
    opener.open("https://example.com/data")
