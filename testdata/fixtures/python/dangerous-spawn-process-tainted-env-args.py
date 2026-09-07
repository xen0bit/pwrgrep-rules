"""dangerous-spawn-process-tainted-env-args: user input into os.spawn*.

os.spawnlp/os.spawnv with a shell redirect ("sh -c") whose command comes
from argv or the environment is reported; the same calls with literal
commands are not.
"""
import os
import sys


def run_argv():
    # ruleid: dangerous-spawn-process-tainted-env-args
    os.spawnlp(os.P_WAIT, "sh", "-c", sys.argv[1])


def run_env():
    cmd = os.environ.get("APP_CMD")
    # ruleid: dangerous-spawn-process-tainted-env-args
    os.spawnlp(os.P_WAIT, "sh", "-c", cmd)


def run_literal():
    # ok: dangerous-spawn-process-tainted-env-args
    os.spawnlp(os.P_WAIT, "sh", "-c", "ls -l")


def run_echo():
    # ok: dangerous-spawn-process-tainted-env-args
    os.spawnl(os.P_WAIT, "echo", "hello")
