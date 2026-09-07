# multiprocessing Connection.recv unpickles what it receives: whoever
# sends to the socket runs code. Flag recv on multiprocessing
# connections; send-only use (or plain sockets) is fine.
import multiprocessing.connection
import socket


def flag_recv(address):
    # ruleid: multiprocessing-recv
    conn = multiprocessing.connection.Client(address)
    conn.recv()


def flag_bytes(address):
    conn = multiprocessing.connection.Client(address)
    # ruleid: multiprocessing-recv
    data = multiprocessing.connection.Client.recv(conn)


def flag_conn(address):
    # ruleid: multiprocessing-recv
    data = multiprocessing.connection.Connection.recv(address)


def safe_send(address):
    conn = multiprocessing.connection.Client(address)
    # ok: multiprocessing-recv
    conn.send({"cmd": "ping"})
    # ok: multiprocessing-recv
    conn.send_bytes(b"hello")
    # ok: multiprocessing-recv
    conn.close()


def safe_socket():
    s = socket.socket()
    # ok: multiprocessing-recv
    data = s.recv(1024)
