# loop.subprocess_exec with a computed program or argument runs
# whatever the caller chose. Flag non-literal forms; fixed argv lists
# are fine.
import asyncio


async def flag_dynamic(loop, protocol, program, arg, args):
    # ruleid: dangerous-asyncio-exec-audit
    await loop.subprocess_exec(protocol, program, arg)
    # ruleid: dangerous-asyncio-exec-audit
    await loop.subprocess_exec(protocol, [program, arg])
    # ruleid: dangerous-asyncio-exec-audit
    await loop.subprocess_exec(protocol, program, *args)


async def safe_literal(loop, protocol):
    # ok: dangerous-asyncio-exec-audit
    await loop.subprocess_exec(protocol, "ls", "-l")
    # ok: dangerous-asyncio-exec-audit
    await loop.subprocess_exec(protocol, ["ls", "-l"])
    # ok: dangerous-asyncio-exec-audit
    await loop.subprocess_exec(protocol, "/bin/sh", "-c", "ls")
