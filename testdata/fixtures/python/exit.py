# exit() is the REPL helper: it may not even exist in a script, and
# cleanup is skipped. Flag exit(); sys.exit is the fix.
import sys


def flag_exit(code):
    # ruleid: use-sys-exit
    exit(code)
    # ruleid: use-sys-exit
    exit(1)
    # ruleid: use-sys-exit
    exit("message")


def safe_sys(code):
    # ok: use-sys-exit
    sys.exit(code)
    # ok: use-sys-exit
    sys.exit(1)
    # ok: use-sys-exit
    sys.exit("message")
