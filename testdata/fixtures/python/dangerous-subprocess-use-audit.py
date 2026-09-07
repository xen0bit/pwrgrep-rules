# subprocess with a computed program or argument runs whatever the
# caller chose. Flag non-literal forms; fixed argv lists are fine.
import subprocess


def flag_dynamic(cmd, prog, out):
    # ruleid: dangerous-subprocess-use-audit
    subprocess.run(cmd)
    # ruleid: dangerous-subprocess-use-audit
    subprocess.Popen("ls " + out)
    # ruleid: dangerous-subprocess-use-audit
    subprocess.call([prog, "-l"])


def safe_literal():
    # ok: dangerous-subprocess-use-audit
    subprocess.run("ls")
    # ok: dangerous-subprocess-use-audit
    subprocess.run(["ls", "-l"])
    # ok: dangerous-subprocess-use-audit
    subprocess.call(("ls", "-l"))
