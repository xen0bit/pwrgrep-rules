# create_subprocess_exec with argv/environ data runs whatever the
# caller chose. Flag tainted programs; fixed argv lists are fine.
import asyncio
import os
import sys


async def flag_argv():
    prog = sys.argv[1]
    args = sys.argv[2:]
    # ruleid: dangerous-asyncio-create-exec-tainted-env-args
    await asyncio.create_subprocess_exec(prog, args)


async def flag_environ():
    prog = os.environ["HELPER"]
    # ruleid: dangerous-asyncio-create-exec-tainted-env-args
    await asyncio.create_subprocess_exec(prog, extra)


async def flag_argv2():
    prog = sys.argv[2]
    # ruleid: dangerous-asyncio-create-exec-tainted-env-args
    await asyncio.subprocess.create_subprocess_exec(prog, extra)


async def safe_literal():
    # ok: dangerous-asyncio-create-exec-tainted-env-args
    await asyncio.create_subprocess_exec("ls", "-l")
    # ok: dangerous-asyncio-create-exec-tainted-env-args
    await asyncio.create_subprocess_exec("ls", ["-l"])
    # ok: dangerous-asyncio-create-exec-tainted-env-args
    await asyncio.create_subprocess_exec("/bin/sh", "-c", "ls")
