# HTTPSConnection's options shifted across releases; calling it at
# all is worth a look. Flag the constructor; plain HTTPConnection is
# a different (cleartext) matter.
import http.client


def flag_https(host):
    # ruleid: httpsconnection-detected
    conn = http.client.HTTPSConnection(host)
    # ruleid: httpsconnection-detected
    conn = http.client.HTTPSConnection(host, context=ctx)
    # ruleid: httpsconnection-detected
    conn = http.client.HTTPSConnection(host, timeout=5)


def safe_http(host):
    # ok: httpsconnection-detected
    conn = http.client.HTTPConnection(host)
    # ok: httpsconnection-detected
    conn = http.client.HTTPConnection(host, timeout=5)
    # ok: httpsconnection-detected
    conn = http.client.HTTPResponse(host)
