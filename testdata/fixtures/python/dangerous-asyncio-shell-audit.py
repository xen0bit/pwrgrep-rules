# Asyncio shell functions hand the string to /bin/sh: data inside
# becomes commands. Flag computed commands; the exec forms take an
# argv list instead of a shell string. This file carries no string
# literals at all: the rule only reports in files without any.
import asyncio


async def flag_create(cmd):
    # ruleid: dangerous-asyncio-shell-audit
    await asyncio.create_subprocess_shell(cmd)
    # ruleid: dangerous-asyncio-shell-audit
    await asyncio.subprocess.create_subprocess_shell(cmd)


async def flag_method(loop, protocol, cmd):
    # ruleid: dangerous-asyncio-shell-audit
    await loop.subprocess_shell(protocol, cmd)


async def safe_exec(program, arg, delay):
    # ok: dangerous-asyncio-shell-audit
    await asyncio.create_subprocess_exec(program, arg)
    # ok: dangerous-asyncio-shell-audit
    await asyncio.subprocess.create_subprocess_exec(program, arg)
    # ok: dangerous-asyncio-shell-audit
    await asyncio.sleep(delay)
