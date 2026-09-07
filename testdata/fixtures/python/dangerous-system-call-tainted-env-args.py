# os.system hands its string to /bin/sh, so argv data inside runs
# attacker commands. Flag tainted commands; fixed strings are fine.
import os
import sys


def flag_argv():
    cmd = sys.argv[1]
    # ruleid: dangerous-system-call-tainted-env-args
    os.system(cmd)


def flag_environ():
    cmd = os.environ.get("CMD")
    # ruleid: dangerous-system-call-tainted-env-args
    os.popen(cmd)


def flag_argv2():
    cmd = sys.argv[2]
    # ruleid: dangerous-system-call-tainted-env-args
    os.system("run " + cmd)


def safe_literal():
    # ok: dangerous-system-call-tainted-env-args
    os.system("ls -l")
    # ok: dangerous-system-call-tainted-env-args
    os.popen("uptime")
    # ok: dangerous-system-call-tainted-env-args
    os.system("uptime | head")
