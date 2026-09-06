# CWE-295 / CWE-319: Unverified SSL and cleartext — verification is disabled.
#
# `ssl._create_unverified_context` and `verify=False` turn off certificate
# checks, so a man-in-the-middle can read or change the traffic. Plain `http://`
# without TLS is the same. Leave verification on.
import ssl
import requests

# ruleid: python-unverified-ssl
ctx = ssl._create_unverified_context()
# ruleid: python-unverified-ssl
ssl._create_default_https_context = ssl._create_unverified_context


def fetch():
    # ruleid: python-unverified-ssl
    requests.get("https://example.com", verify=False)
    # ruleid: python-unverified-ssl
    requests.post("https://example.com/api", verify=False, timeout=5)
    # ruleid: python-unverified-ssl
    requests.request("GET", "https://example.com/data", verify=False)
    # ruleid: python-unverified-ssl
    requests.get("https://example.com/other", verify=False, headers={})


def safe():
    # ok: python-unverified-ssl
    requests.get("https://example.com", verify=True)
    # ok: python-unverified-ssl
    requests.get("https://example.com")
    # ok: python-unverified-ssl
    ctx = ssl.create_default_context()
    # ok: python-unverified-ssl
    requests.post("https://example.com/api", timeout=5)
