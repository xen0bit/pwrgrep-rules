"""insecure-openerdirector-open: insecure transport through urllib opener objects.

A hard-coded http:// (or ftp://) URL opened through an explicitly built
opener, directly or via a variable, is reported; https:// URLs are not.
"""
import urllib.request


def open_direct():
    # ruleid: insecure-openerdirector-open
    urllib.request.OpenerDirector().open("http://example.com/data")


def open_via_handle():
    opener = urllib.request.OpenerDirector()
    # ruleid: insecure-openerdirector-open
    opener.open("http://example.com/data")


def open_secure():
    # ok: insecure-openerdirector-open
    urllib.request.OpenerDirector().open("https://example.com/data")


def open_secure_handle():
    opener = urllib.request.OpenerDirector()
    # ok: insecure-openerdirector-open
    opener.open("https://example.com/data")
