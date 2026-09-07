# A socket plus a shell is the shape of a reverse shell: data flows
# in from the network and commands flow out to it. Flag /bin/*sh run
# where a socket was opened; other programs are ordinary use.
import socket
import subprocess

import pty


def flag_shell(host, port):
    import socket
    s = socket.socket()
    s.connect((host, port))
    # ruleid: python-reverse-shell
    pty.spawn("/bin/bash")
    import socket
    s = socket.socket()
    s.connect((host, port))
    # ruleid: python-reverse-shell
    subprocess.call(["/bin/sh", "-i"])
    import socket
    s = socket.socket()
    s.connect((host, port))
    # ruleid: python-reverse-shell
    pty.spawn("/bin/zsh")


def safe_other(host, port):
    import socket
    s = socket.socket()
    s.connect((host, port))
    # ok: python-reverse-shell
    pty.spawn("/bin/ls")
    # ok: python-reverse-shell
    subprocess.call(["/bin/ls", "-l"])
    # ok: python-reverse-shell
    print("connected")
