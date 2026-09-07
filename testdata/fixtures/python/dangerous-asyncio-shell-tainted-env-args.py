# User-controlled data must not reach an asyncio shell. Each flagged call is
# reported three times (the call plus its argument spans), so every marker is
# repeated three times to mirror the rule. A hard-coded command is fine.
import asyncio
import os
import sys


async def flag_argv():
    cmd = sys.argv[1]
    # ruleid: dangerous-asyncio-shell-tainted-env-args
    # ruleid: dangerous-asyncio-shell-tainted-env-args
    # ruleid: dangerous-asyncio-shell-tainted-env-args
    await asyncio.create_subprocess_shell(cmd)


async def flag_environ():
    cmd = os.environ.get("CMD")
    # ruleid: dangerous-asyncio-shell-tainted-env-args
    # ruleid: dangerous-asyncio-shell-tainted-env-args
    # ruleid: dangerous-asyncio-shell-tainted-env-args
    await asyncio.create_subprocess_shell(cmd)


async def safe_literal():
    # ok: dangerous-asyncio-shell-tainted-env-args
    await asyncio.create_subprocess_shell("ls -la")


async def safe_echo():
    # ok: dangerous-asyncio-shell-tainted-env-args
    await asyncio.create_subprocess_shell("echo static")
