# ssl.wrap_socket is deprecated and easy to misconfigure. Flag it;
# wrapping via an SSLContext is the fix.
import socket
import ssl


def flag_wrap(sock):
    # ruleid: ssl-wrap-socket-is-deprecated
    conn = ssl.wrap_socket(sock)
    # ruleid: ssl-wrap-socket-is-deprecated
    conn = ssl.wrap_socket(sock, cert_reqs=ssl.CERT_REQUIRED)
    # ruleid: ssl-wrap-socket-is-deprecated
    conn = ssl.wrap_socket(sock, server_side=True)


def safe_context(sock, host):
    ctx = ssl.create_default_context()
    # ok: ssl-wrap-socket-is-deprecated
    conn = ctx.wrap_socket(sock, server_hostname=host)
    # ok: ssl-wrap-socket-is-deprecated
    plain = socket.create_connection((host, 443))
    # ok: ssl-wrap-socket-is-deprecated
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
