# time.sleep in async code blocks the whole event loop: nothing else
# runs until it returns. Flag it; asyncio.sleep (or sleeping in sync
# helpers) is the fix.
import asyncio
import time


async def flag_sleep():
    # ruleid: sync-sleep-in-async-code
    time.sleep(1)


async def flag_sleep_again():
    # ruleid: sync-sleep-in-async-code
    time.sleep(0.5)


async def flag_sleep_third():
    # ruleid: sync-sleep-in-async-code
    time.sleep(2)


async def safe_async():
    # ok: sync-sleep-in-async-code
    await asyncio.sleep(1)


async def safe_async_again():
    # ok: sync-sleep-in-async-code
    await asyncio.sleep(0.5)


def safe_sync():
    # ok: sync-sleep-in-async-code
    compute()
