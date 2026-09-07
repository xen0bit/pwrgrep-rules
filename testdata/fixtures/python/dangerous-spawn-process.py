# Lambda os.spawn* with event-tainted command.
#
# The `event` object carries caller input. Passing it as the command of an
# os.spawn* call runs attacker-chosen bytes. Fixed code passes only
# literals.
import os


def handler(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-spawn-process
    os.spawnl(os.P_WAIT, cmd)


def handler_direct(event, context):
    # ruleid: dangerous-spawn-process
    os.spawnlp(os.P_WAIT, event["cmd"])


def handler_v(event, context):
    cmd = event.get("cmd")
    args = ["echo", cmd]
    # ruleid: dangerous-spawn-process
    os.spawnv(os.P_WAIT, cmd, args)


def handler_literal(event, context):
    # ok: dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/echo", "hello")


def handler_literal_v(event, context):
    # ok: dangerous-spawn-process
    os.spawnv(os.P_WAIT, "/bin/echo", ["/bin/echo", "hello"])


def unrelated():
    # ok: dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/echo", "hello")
