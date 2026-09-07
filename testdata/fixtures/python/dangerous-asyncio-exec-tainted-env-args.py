# loop.subprocess_exec with argv/environ data runs whatever the caller
# chose. Flag tainted programs; fixed argv lists are fine.
import asyncio
import os
import sys


async def flag_argv(loop, protocol):
    prog = sys.argv[1]
    args = sys.argv[2:]
    # ruleid: dangerous-asyncio-exec-tainted-env-args
    await loop.subprocess_exec(protocol, prog, args)


async def flag_environ(loop, protocol):
    prog = os.environ["HELPER"]
    # ruleid: dangerous-asyncio-exec-tainted-env-args
    await loop.subprocess_exec(protocol, prog, ["--run"])


async def flag_argv2(loop, protocol):
    prog = sys.argv[2]
    # ruleid: dangerous-asyncio-exec-tainted-env-args
    await loop.subprocess_exec(protocol, prog, extra)


async def safe_literal(loop, protocol):
    # ok: dangerous-asyncio-exec-tainted-env-args
    await loop.subprocess_exec(protocol, "ls", "-l")
    # ok: dangerous-asyncio-exec-tainted-env-args
    await loop.subprocess_exec(protocol, ["ls", "-l"])
    # ok: dangerous-asyncio-exec-tainted-env-args
    await loop.subprocess_exec(protocol, "/bin/sh", "-c", "ls")
