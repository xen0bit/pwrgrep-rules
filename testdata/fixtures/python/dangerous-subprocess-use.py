# Lambda subprocess with shell=True and event-tainted command.
#
# With shell=True the string is interpreted by /bin/sh, so event input
# becomes shell syntax. Quoting with shlex.quote or passing a literal is
# the fix.
import shlex
import subprocess


def handler(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-subprocess-use
    subprocess.run(cmd, shell=True)


def handler_direct(event, context):
    # ruleid: dangerous-subprocess-use
    subprocess.call(event["cmd"], shell=True)


def handler_popen(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-subprocess-use
    subprocess.Popen(cmd, shell=True)


def handler_quoted(event, context):
    cmd = event.get("cmd")
    # ok: dangerous-subprocess-use
    subprocess.run(shlex.quote(cmd), shell=True)


def handler_literal(event, context):
    # ok: dangerous-subprocess-use
    subprocess.run("ls -l", shell=True)


def handler_no_shell(event, context):
    cmd = event.get("cmd")
    # ok: dangerous-subprocess-use
    subprocess.run(["echo", cmd])
