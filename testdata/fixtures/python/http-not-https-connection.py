# HTTPConnectionPool speaks cleartext HTTP. Flag it; the HTTPS pool
# is the fix.
import urllib3


def flag_http(host):
    # ruleid: http-not-https-connection
    pool = urllib3.HTTPConnectionPool(host)
    # ruleid: http-not-https-connection
    pool = urllib3.HTTPConnectionPool(host, port=80)
    # ruleid: http-not-https-connection
    pool = urllib3.connectionpool.HTTPConnectionPool(host)


def safe_https(host):
    # ok: http-not-https-connection
    pool = urllib3.HTTPSConnectionPool(host)
    # ok: http-not-https-connection
    pool = urllib3.HTTPSConnectionPool(host, port=443)
    # ok: http-not-https-connection
    pool = urllib3.connectionpool.HTTPSConnectionPool(host)
