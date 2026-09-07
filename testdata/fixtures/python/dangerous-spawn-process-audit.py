# os.spawn* runs whatever program it names. Flag computed programs
# and shell -c payloads; fixed argv lists of literals are fine.
import os


def flag_dynamic(prog, target, cmd):
    # ruleid: dangerous-spawn-process-audit
    os.spawnlp(os.P_WAIT, prog, target)
    # ruleid: dangerous-spawn-process-audit
    os.spawnv(os.P_WAIT, "/bin/sh", ["-c", cmd])
    # ruleid: dangerous-spawn-process-audit
    os.spawnl(os.P_WAIT, "/bin/sh", "-c", cmd)


def safe_literal():
    # ok: dangerous-spawn-process-audit
    os.spawnlp(os.P_WAIT, "ls", "-l")
    # ok: dangerous-spawn-process-audit
    os.spawnv(os.P_WAIT, "/bin/sh", ["-c", "ls"])
    # ok: dangerous-spawn-process-audit
    os.spawnl(os.P_WAIT, "/bin/ls", "-l")
