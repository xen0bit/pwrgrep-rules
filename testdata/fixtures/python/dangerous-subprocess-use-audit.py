# subprocess with a command assembled from a value the program did not
# write runs through a shell, so the value is command syntax. A literal
# command, or a fixed argv list, is not this finding.
import os
import subprocess


def flag_dynamic(host, path, prog, cmd):
    # ruleid: dangerous-subprocess-use-audit
    subprocess.run("ping " + host, shell=True)
    # ruleid: dangerous-subprocess-use-audit
    subprocess.Popen(f"cat {path}", shell=True)
    # ruleid: dangerous-subprocess-use-audit
    subprocess.call("ls {}".format(path), shell=True)
    # ruleid: dangerous-subprocess-use-audit
    os.system("rm " + path)
    # ruleid: dangerous-subprocess-use-audit
    os.popen(cmd % path)


def safe_literal():
    # ok: dangerous-subprocess-use-audit
    subprocess.run("ls", shell=True)
    # ok: dangerous-subprocess-use-audit
    subprocess.run(["ls", "-l"])
    # ok: dangerous-subprocess-use-audit
    subprocess.call(("ls", "-l"))
    # ok: dangerous-subprocess-use-audit
    os.system("ls")
