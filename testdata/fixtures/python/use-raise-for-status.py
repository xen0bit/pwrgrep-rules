# requests never raises for HTTP errors unless asked: a 500 reads like
# success. Flag requests without raise_for_status(); calling it (or an
# explicit status check) is the fix.
import requests


def flag_unchecked(url):
    # ruleid: use-raise-for-status
    requests.get(url)
    # ruleid: use-raise-for-status
    requests.post(url, data=data)
    # ruleid: use-raise-for-status
    requests.put(url, data=data)


def safe_checked(url):
    # ok: use-raise-for-status
    resp = requests.get(url)
    resp.raise_for_status()
    # ok: use-raise-for-status
    requests.post(url, data=data).raise_for_status()
    # ok: use-raise-for-status
    resp = requests.put(url, data=data)
    if resp.status_code != 200:
        raise RuntimeError("bad status")
