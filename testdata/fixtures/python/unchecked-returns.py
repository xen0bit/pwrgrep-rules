# subprocess.call returns the exit status: ignoring it hides failure.
# Flag unchecked calls; checking (or returning) the status is the fix.
import subprocess


def flag_bare(cmd):
    # ruleid: unchecked-subprocess-call
    subprocess.call(cmd)
    # ruleid: unchecked-subprocess-call
    subprocess.call(["ls", "-l"])
    # ruleid: unchecked-subprocess-call
    subprocess.call("uptime")


def safe_checked(cmd):
    # ok: unchecked-subprocess-call
    status = subprocess.call(cmd)
    # ok: unchecked-subprocess-call
    ok = subprocess.call(["ls", "-l"]) == 0
    # ok: unchecked-subprocess-call
    return subprocess.call(cmd)
