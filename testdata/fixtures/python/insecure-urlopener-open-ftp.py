"""insecure-urlopener-open-ftp: insecure transport through urllib opener objects.

A hard-coded http:// (or ftp://) URL opened through an explicitly built
opener, directly or via a variable, is reported; https:// URLs are not.
"""
import urllib.request


def open_direct():
    # ruleid: insecure-urlopener-open-ftp
    urllib.request.URLopener().open("ftp://example.com/data")


def open_via_handle():
    opener = urllib.request.URLopener()
    # ruleid: insecure-urlopener-open-ftp
    opener.open("ftp://example.com/data")


def open_secure():
    # ok: insecure-urlopener-open-ftp
    urllib.request.URLopener().open("https://example.com/data")


def open_secure_handle():
    opener = urllib.request.URLopener()
    # ok: insecure-urlopener-open-ftp
    opener.open("https://example.com/data")
