# cert_reqs=CERT_NONE (or NOT verifying) lets any presenter in the
# middle read and alter the stream. Flag disabled verification;
# CERT_REQUIRED (or leaving the default) is the fix.
import ssl

import urllib3


def flag_disabled(host):
    # ruleid: disabled-cert-validation
    pool = urllib3.PoolManager(cert_reqs=ssl.CERT_NONE)
    # ruleid: disabled-cert-validation
    pool = urllib3.PoolManager(cert_reqs="NONE")
    # ruleid: disabled-cert-validation
    conn = ssl.wrap_socket(sock, cert_reqs=ssl.CERT_OPTIONAL)


def safe_required(host):
    # ok: disabled-cert-validation
    pool = urllib3.PoolManager(cert_reqs=ssl.CERT_REQUIRED)
    # ok: disabled-cert-validation
    pool = urllib3.PoolManager()
    # ok: disabled-cert-validation
    ctx = ssl.create_default_context()
