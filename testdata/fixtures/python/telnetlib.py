# Telnet sends everything, credentials included, in cleartext. Flag
# any telnetlib use; an SSH (or TLS) client is the fix.
import socket
import ssl
import telnetlib


def flag_telnet(host):
    # ruleid: telnetlib
    tn = telnetlib.Telnet(host)
    # ruleid: telnetlib
    tn = telnetlib.Telnet(host, 23, timeout=5)
    # ruleid: telnetlib
    tn = telnetlib.Telnet()
    tn.open(host)


def safe_other(host):
    # ok: telnetlib
    s = socket.create_connection((host, 22))
    # ok: telnetlib
    ctx = ssl.create_default_context()
    # ok: telnetlib
    data = b"noop"
