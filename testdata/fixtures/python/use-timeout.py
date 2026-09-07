# A requests call without a timeout can hang forever on a dead peer.
# Flag calls with no timeout; passing timeout= is the fix.
import requests


def flag_no_timeout(url):
    # ruleid: use-timeout
    requests.get(url)
    # ruleid: use-timeout
    requests.post(url, data=data)
    # ruleid: use-timeout
    requests.request("GET", url)


def safe_timeout(url):
    # ok: use-timeout
    requests.get(url, timeout=5)
    # ok: use-timeout
    requests.post(url, data=data, timeout=(3, 10))
    # ok: use-timeout
    requests.request("GET", url, timeout=5)
