# Dask's Security() without require_encryption may silently run with
# no TLS. Flag require_encryption=False; True (or omitting it) is fine.
import distributed.security


def flag_plain():
    # ruleid: require-encryption
    sec = distributed.security.Security(require_encryption=False)
    # ruleid: require-encryption
    sec = distributed.security.Security(require_encryption=False, tls_ca_file="ca.pem")
    # ruleid: require-encryption
    sec = distributed.security.Security(tls_key="k.pem", require_encryption=False)


def safe_tls():
    # ok: require-encryption
    sec = distributed.security.Security(require_encryption=True)
    # ok: require-encryption
    sec = distributed.security.Security(require_encryption=True, tls_ca_file="ca.pem")
    # ok: require-encryption
    sec = distributed.security.Security()
