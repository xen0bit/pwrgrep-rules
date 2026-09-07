# `shutdown` can raise (peer already gone), so a bare `shutdown` followed by
# `close` leaks the descriptor on the error path. The rule matches a bare
# two-statement function body, hence the finding lands on the `def` line;
# each guarded variant closes a different socket so the file-level `outside`
# guards of one case never hide another.
import socket

bare = socket.socket()
guarded = socket.socket()
solo = socket.socket()


# ruleid: socket-shutdown-close
def flag_bare():
    bare.shutdown(socket.SHUT_WR)
    bare.close()


# ruleid: socket-shutdown-close
def flag_bare_read():
    bare.shutdown(socket.SHUT_RD)
    bare.close()


# ruleid: socket-shutdown-close
def flag_bare_rdwr():
    bare.shutdown(socket.SHUT_RDWR)
    bare.close()


# ok: socket-shutdown-close
def safe_except():
    try:
        guarded.shutdown(socket.SHUT_RDWR)
    except OSError:
        pass
    guarded.close()


# ok: socket-shutdown-close
def safe_finally():
    try:
        guarded.shutdown(socket.SHUT_RDWR)
    finally:
        guarded.close()


# ok: socket-shutdown-close
def safe_close_only():
    solo.close()
