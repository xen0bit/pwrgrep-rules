# Old TLS/SSL versions are broken (POODLE, BEAST, weak ciphers).
# Flag the legacy version constants; modern TLS is the fix.
import ssl


def flag_old(ctx):
    # ruleid: weak-ssl-version
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
    # ruleid: weak-ssl-version
    ctx = ssl.SSLContext(ssl.PROTOCOL_SSLv3)
    # ruleid: weak-ssl-version
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)


def safe_modern():
    # ok: weak-ssl-version
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS)
    # ok: weak-ssl-version
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    # ok: weak-ssl-version
    ctx = ssl.create_default_context()
