"""insecure-openerdirector-open-ftp: insecure transport through urllib opener objects.

A hard-coded http:// (or ftp://) URL opened through an explicitly built
opener, directly or via a variable, is reported; https:// URLs are not.
"""
import urllib.request


def open_direct():
    # ruleid: insecure-openerdirector-open-ftp
    urllib.request.OpenerDirector().open("ftp://example.com/data")


def open_via_handle():
    opener = urllib.request.OpenerDirector()
    # ruleid: insecure-openerdirector-open-ftp
    opener.open("ftp://example.com/data")


def open_secure():
    # ok: insecure-openerdirector-open-ftp
    urllib.request.OpenerDirector().open("https://example.com/data")


def open_secure_handle():
    opener = urllib.request.OpenerDirector()
    # ok: insecure-openerdirector-open-ftp
    opener.open("https://example.com/data")
