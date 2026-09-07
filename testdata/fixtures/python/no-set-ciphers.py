# Calling set_ciphers is worth a second look: the defaults already
# drop the broken suites. Flag the call; building a context without
# it is the plain case.
import ssl


def flag_ciphers():
    ctx = ssl.create_default_context()
    # ruleid: no-set-ciphers
    ctx.set_ciphers("ECDHE-RSA-AES256-GCM-SHA384")
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    # ruleid: no-set-ciphers
    ctx.set_ciphers("AES256-SHA")
    # ruleid: no-set-ciphers
    context.set_ciphers("ECDHE+AESGCM")


def safe_default():
    # ok: no-set-ciphers
    ctx = ssl.create_default_context()
    # ok: no-set-ciphers
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    # ok: no-set-ciphers
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
