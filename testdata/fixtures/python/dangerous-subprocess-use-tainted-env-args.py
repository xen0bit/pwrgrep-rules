# subprocess with argv/environ data runs whatever the caller chose.
# Flag tainted commands (quoting with shlex.quote clears them); fixed
# argv lists are fine.
import shlex
import subprocess
import sys


def flag_argv():
    cmd = sys.argv[1]
    # ruleid: dangerous-subprocess-use-tainted-env-args
    subprocess.run(cmd)


def flag_environ():
    import os

    cmd = os.environ["CMD"]
    # ruleid: dangerous-subprocess-use-tainted-env-args
    subprocess.Popen(cmd)


def flag_argv2():
    target = sys.argv[2]
    # ruleid: dangerous-subprocess-use-tainted-env-args
    subprocess.call("ls " + target)


def safe_quoted():
    cmd = sys.argv[1]
    # ok: dangerous-subprocess-use-tainted-env-args
    subprocess.run(shlex.quote(cmd))
    # ok: dangerous-subprocess-use-tainted-env-args
    subprocess.run("ls")
    # ok: dangerous-subprocess-use-tainted-env-args
    subprocess.run(["ls", "-l"])
