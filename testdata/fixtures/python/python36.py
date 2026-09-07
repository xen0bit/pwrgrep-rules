# ssl.get_ciphers was added in 3.6: calling it breaks older Pythons.
# Flag it; older-version-safe ssl calls are fine. Only the first id,
# python36-compatibility-ssl, is marked (no Popen calls appear: those
# report under sibling ids).
import ssl


def flag_ciphers():
    # ruleid: python36-compatibility-ssl
    names = ssl.get_ciphers()
    # ruleid: python36-compatibility-ssl
    return ssl.get_ciphers()
    # ruleid: python36-compatibility-ssl
    print(ssl.get_ciphers())


def safe_ssl():
    # ok: python36-compatibility-ssl
    ctx = ssl.create_default_context()
    # ok: python36-compatibility-ssl
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    # ok: python36-compatibility-ssl
    cert = ssl.get_server_certificate(("example.com", 443))
