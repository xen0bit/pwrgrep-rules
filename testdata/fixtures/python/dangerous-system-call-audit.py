# os.system and friends hand the string to /bin/sh: data inside
# becomes commands. Flag computed (non-literal) commands; fixed
# strings are fine.
import os


def flag_dynamic(cmd):
    # ruleid: dangerous-system-call-audit
    os.system(cmd)
    # ruleid: dangerous-system-call-audit
    os.popen(cmd)
    # ruleid: dangerous-system-call-audit
    runner = getattr(os, "system")
    runner(cmd)


def safe_literal():
    # ok: dangerous-system-call-audit
    os.system("ls -l")
    # ok: dangerous-system-call-audit
    os.popen("uptime")
    # ok: dangerous-system-call-audit
    os.system("uptime | head")
