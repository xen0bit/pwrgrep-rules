"""no-auth-over-http: requests credentials over cleartext HTTP.

auth= against an http:// URL, inline or via a variable, is reported;
the same calls over https:// are not.
"""
import requests


def fetch_direct():
    # ruleid: no-auth-over-http
    return requests.get("http://example.com/api", auth=("user", "pw"))


def fetch_assigned():
    # ruleid: no-auth-over-http
    url = "http://example.com/api"
    return requests.post(url, auth=("user", "pw"))


def fetch_secure():
    # ok: no-auth-over-http
    return requests.get("https://example.com/api", auth=("user", "pw"))


def fetch_secure_assigned():
    # ok: no-auth-over-http
    url = "https://example.com/api"
    return requests.post(url, auth=("user", "pw"))
