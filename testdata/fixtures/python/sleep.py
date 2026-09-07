# A stray sleep slows the suite (or hides a race). The rule matches
# annotated sleep arguments; plain and computed sleeps are out of
# scope, as are sleeps of a call result.
import time


def flag_annotated(timeout, delay, secs):
    # ruleid: arbitrary-sleep
    time.sleep(timeout: float)
    # ruleid: arbitrary-sleep
    time.sleep(delay: int)
    # ruleid: arbitrary-sleep
    time.sleep(secs: float)


def safe_plain(x, y):
    # ok: arbitrary-sleep
    time.sleep(5)
    # ok: arbitrary-sleep
    time.sleep(int(x))
    # ok: arbitrary-sleep
    time.sleep(float(y))
