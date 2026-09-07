# os.exec* replaces the process with whatever program it names.
# Flag computed programs and shell -c payloads; fixed argv lists of
# literals are fine.
import os


def flag_dynamic(prog, target, cmd):
    # ruleid: dangerous-os-exec-audit
    os.execlp(prog, target)
    # ruleid: dangerous-os-exec-audit
    os.execv("/bin/sh", ["/bin/sh", "-c", cmd])
    # ruleid: dangerous-os-exec-audit
    os.execl("/bin/sh", "/bin/sh", "-c", cmd)


def safe_literal():
    # ok: dangerous-os-exec-audit
    os.execlp("ls", "ls", "-l")
    # ok: dangerous-os-exec-audit
    os.execv("/bin/sh", ["/bin/sh", "-c", "ls"])
    # ok: dangerous-os-exec-audit
    os.execl("/bin/ls", "/bin/ls", "-l")
