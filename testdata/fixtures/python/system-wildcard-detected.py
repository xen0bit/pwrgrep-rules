# A * in a shell command expands to filenames: unexpected files get
# archived, chmodded or synced. Flag wildcards in tar/chmod/chown/rsync
# shell calls; fixed paths are fine.
import os
import subprocess


def flag_wildcard():
    # ruleid: system-wildcard-detected
    os.system("tar cf archive.tar *.log")
    # ruleid: system-wildcard-detected
    subprocess.call("chmod 644 *", shell=True)
    # ruleid: system-wildcard-detected
    os.popen("rsync -a src/* dst/")


def safe_fixed():
    # ok: system-wildcard-detected
    os.system("ls -l")
    # ok: system-wildcard-detected
    subprocess.call("echo hi", shell=True)
    # ok: system-wildcard-detected
    os.system("tar cf archive.tar app.log")
