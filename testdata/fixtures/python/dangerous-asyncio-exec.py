# Lambda loop.subprocess_exec with event-tainted command.
#
# The `event` object carries caller input. Passing it as the command of
# loop.subprocess_exec runs attacker-chosen bytes. Fixed code passes only
# literals.
import asyncio


class Proto(asyncio.SubprocessProtocol):
    pass


def handler(event, context):
    cmd = event.get("cmd")
    loop = asyncio.get_event_loop()
    # ruleid: dangerous-asyncio-exec
    loop.subprocess_exec(Proto, cmd)


def handler_direct(event, context):
    loop = asyncio.get_event_loop()
    # ruleid: dangerous-asyncio-exec
    loop.subprocess_exec(Proto, event["cmd"])


def handler_propagated(event, context):
    data = event.get("cmd")
    cmd = data
    loop = asyncio.get_event_loop()
    # ruleid: dangerous-asyncio-exec
    loop.subprocess_exec(Proto, cmd)


def handler_literal(event, context):
    loop = asyncio.get_event_loop()
    # ok: dangerous-asyncio-exec
    loop.subprocess_exec(Proto, "echo")


def handler_shell_literal(event, context):
    loop = asyncio.get_event_loop()
    # ok: dangerous-asyncio-exec
    loop.subprocess_exec(Proto, "sh", "-c", "uptime")


def unrelated():
    loop = asyncio.get_event_loop()
    # ok: dangerous-asyncio-exec
    loop.subprocess_exec(Proto, "echo")
