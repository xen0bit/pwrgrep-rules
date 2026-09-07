# os.exec* with argv/environ data replaces the process with whatever
# the caller chose. Flag tainted programs; fixed argv lists are fine.
import os
import sys


def flag_argv(target):
    prog = sys.argv[1]
    # ruleid: dangerous-os-exec-tainted-env-args
    os.execlp(prog, target)


def flag_argv2():
    prog = sys.argv[2]
    args = sys.argv[3:]
    # ruleid: dangerous-os-exec-tainted-env-args
    os.execvp(prog, args)


def flag_environ():
    prog = os.environ["HELPER"]
    # ruleid: dangerous-os-exec-tainted-env-args
    os.execvpe(prog, [prog, "--run"], os.environ)


def safe_literal():
    # ok: dangerous-os-exec-tainted-env-args
    os.execlp("ls", "ls", "-l")
    # ok: dangerous-os-exec-tainted-env-args
    os.execv("/bin/sh", ["/bin/sh", "-c", "ls"])
    # ok: dangerous-os-exec-tainted-env-args
    os.execl("/bin/ls", "/bin/ls", "-l")
