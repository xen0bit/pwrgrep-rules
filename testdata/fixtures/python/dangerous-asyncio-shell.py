# Lambda asyncio subprocess_shell with event-tainted command.
#
# The shell form hands the string to /bin/sh, so event input becomes shell
# syntax. Fixed code passes only literals (or avoids the shell form).
import asyncio


def handler(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-asyncio-shell
    asyncio.create_subprocess_shell(cmd)


def handler_direct(event, context):
    # ruleid: dangerous-asyncio-shell
    asyncio.create_subprocess_shell(event["cmd"])


def handler_loop(event, context):
    cmd = event.get("cmd")
    loop = asyncio.get_event_loop()
    # ruleid: dangerous-asyncio-shell
    loop.subprocess_shell(DummyProto, cmd)


class DummyProto(asyncio.SubprocessProtocol):
    pass


def handler_literal(event, context):
    # ok: dangerous-asyncio-shell
    asyncio.create_subprocess_shell("echo hello")


def handler_exec_literal(event, context):
    # ok: dangerous-asyncio-shell
    asyncio.create_subprocess_exec("echo", "hello")


def unrelated():
    # ok: dangerous-asyncio-shell
    asyncio.create_subprocess_shell("uptime")
