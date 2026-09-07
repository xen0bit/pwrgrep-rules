# Lambda asyncio create_subprocess_exec with event-tainted command.
#
# The `event` object carries caller input. Passing it (or a value built
# from it) as the command of create_subprocess_exec runs attacker-chosen
# bytes. Fixed code passes only literals.
import asyncio


def handler(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-asyncio-create-exec
    asyncio.create_subprocess_exec("echo", cmd)


def handler_direct(event, context):
    # ruleid: dangerous-asyncio-create-exec
    asyncio.create_subprocess_exec("echo", event["cmd"])


def handler_list(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-asyncio-create-exec
    asyncio.subprocess.create_subprocess_exec("echo", cmd)


def handler_literal(event, context):
    # ok: dangerous-asyncio-create-exec
    asyncio.create_subprocess_exec("echo", "hello")


def handler_literal_list(event, context):
    # ok: dangerous-asyncio-create-exec
    asyncio.create_subprocess_exec("echo", ["hello", "--flag"])


def unrelated():
    cmd = "hello"
    # ok: dangerous-asyncio-create-exec
    asyncio.create_subprocess_exec("echo", cmd)
