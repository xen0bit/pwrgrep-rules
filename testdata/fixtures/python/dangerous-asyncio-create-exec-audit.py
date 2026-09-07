# create_subprocess_exec with a computed program or argument runs
# whatever the caller chose. Flag non-literal forms; fixed argv lists
# are fine.
import asyncio


async def flag_dynamic(program, arg, opt, args):
    # ruleid: dangerous-asyncio-create-exec-audit
    await asyncio.create_subprocess_exec(program, arg)
    # ruleid: dangerous-asyncio-create-exec-audit
    await asyncio.create_subprocess_exec(program, arg, opt)
    # ruleid: dangerous-asyncio-create-exec-audit
    await asyncio.create_subprocess_exec(program, *args)


async def safe_literal():
    # ok: dangerous-asyncio-create-exec-audit
    await asyncio.create_subprocess_exec("ls", "-l")
    # ok: dangerous-asyncio-create-exec-audit
    await asyncio.create_subprocess_exec("ls", ["-l"])
    # ok: dangerous-asyncio-create-exec-audit
    await asyncio.create_subprocess_exec("/bin/sh", "-c", "ls")
