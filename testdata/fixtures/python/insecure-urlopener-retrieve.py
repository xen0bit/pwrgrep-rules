"""insecure-urlopener-retrieve: insecure transport through urllib opener objects.

A hard-coded http:// (or ftp://) URL opened through an explicitly built
opener, directly or via a variable, is reported; https:// URLs are not.
"""
import urllib.request


def open_direct():
    # ruleid: insecure-urlopener-retrieve
    urllib.request.URLopener().retrieve("http://example.com/data")


def open_via_handle():
    opener = urllib.request.URLopener()
    # ruleid: insecure-urlopener-retrieve
    opener.retrieve("http://example.com/data")


def open_secure():
    # ok: insecure-urlopener-retrieve
    urllib.request.URLopener().retrieve("https://example.com/data")


def open_secure_handle():
    opener = urllib.request.URLopener()
    # ok: insecure-urlopener-retrieve
    opener.retrieve("https://example.com/data")
