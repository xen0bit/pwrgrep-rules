# CWE-78: OS command injection — the shell gets a string the caller chose.
#
# `os.system`, `os.popen`, `subprocess` with `shell=True`, and `eval` of a
# shell command all hand the whole command line to `/bin/sh`. A `;`, a
# backtick or a `$(...)` in the middle starts a second command.
# Passing the program and its arguments separately — `subprocess.run([prog, arg])`
# with `shell=False` — never involves a shell, so a semicolon is just a character.
import os
import subprocess
from flask import request


@app.route("/run/<cmd>")
def from_route(cmd):
    # ruleid: python-os-command-injection
    os.system(cmd)
    # ruleid: python-os-command-injection
    subprocess.call(cmd, shell=True)
    # ruleid: python-os-command-injection
    subprocess.Popen("echo " + cmd, shell=True)


def from_query():
    q = request.args.get("q")
    # ruleid: python-os-command-injection
    os.popen(q)
    # ruleid: python-os-command-injection
    subprocess.run(q, shell=True)
    # Propagation through a variable — reaching must follow it.
    cmd = q
    # ruleid: python-os-command-injection
    os.system(cmd)


def from_form():
    data = request.form.get("data")
    tainted = data
    # ruleid: python-os-command-injection
    subprocess.call(tainted, shell=True)


def safe_literal():
    # ok: python-os-command-injection
    os.system("ls -l")
    # ok: python-os-command-injection
    subprocess.call(["ls", "-l"])
    # ok: python-os-command-injection
    subprocess.run(["echo", "hello"], shell=False)
    # ok: python-os-command-injection
    subprocess.Popen(["/bin/ls", "-l"])


def safe_constant():
    cmd = "uptime"
    # ok: python-os-command-injection
    os.system("uptime | head")


# `input()` is the other way a caller chooses a command, and it is the same
# weakness: a prompt is untrusted for exactly the reason a query string is.
def from_a_prompt():
    cmd = input()
    # ruleid: python-os-command-injection
    os.system(cmd)


def from_a_prompt_concatenated():
    data = input("enter: ")
    # ruleid: python-os-command-injection
    os.system(data + "; echo hi")


def from_a_literal():
    x = "fixed"
    # ok: python-os-command-injection
    os.system(x)
