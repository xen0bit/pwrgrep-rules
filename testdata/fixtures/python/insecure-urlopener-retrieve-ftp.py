"""insecure-urlopener-retrieve-ftp: insecure transport through urllib opener objects.

A hard-coded http:// (or ftp://) URL opened through an explicitly built
opener, directly or via a variable, is reported; https:// URLs are not.
"""
import urllib.request


def open_direct():
    # ruleid: insecure-urlopener-retrieve-ftp
    urllib.request.URLopener().retrieve("ftp://example.com/data")


def open_via_handle():
    opener = urllib.request.URLopener()
    # ruleid: insecure-urlopener-retrieve-ftp
    opener.retrieve("ftp://example.com/data")


def open_secure():
    # ok: insecure-urlopener-retrieve-ftp
    urllib.request.URLopener().retrieve("https://example.com/data")


def open_secure_handle():
    opener = urllib.request.URLopener()
    # ok: insecure-urlopener-retrieve-ftp
    opener.retrieve("https://example.com/data")
