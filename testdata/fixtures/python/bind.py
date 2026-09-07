# Binding 0.0.0.0 (or "" or ::) exposes the server on every interface,
# including the public one. Flag those binds; loopback (or a fixed
# address) is the fix.
import socket


def flag_all(port):
    # ruleid: avoid-bind-to-all-interfaces
    s = socket.socket()
    s.bind(("0.0.0.0", port))


def flag_empty(port):
    # ruleid: avoid-bind-to-all-interfaces
    s = socket.socket()
    s.bind(("", port))


def flag_v6(port):
    # ruleid: avoid-bind-to-all-interfaces
    s = socket.socket(socket.AF_INET6)
    s.bind(("::", port))


def safe_loopback(port):
    # ok: avoid-bind-to-all-interfaces
    s = socket.socket()
    s.bind(("127.0.0.1", port))


def safe_name(port):
    # ok: avoid-bind-to-all-interfaces
    s = socket.socket()
    s.bind(("localhost", port))


def safe_fixed(port):
    # ok: avoid-bind-to-all-interfaces
    s = socket.socket()
    s.bind(("10.0.0.5", port))
