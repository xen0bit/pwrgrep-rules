# subprocess with a command assembled from a value, or reached by request
# data, runs what the value says. A literal command or a fixed argv list is
# not this finding.
import os
import subprocess

from flask import request


def direct_request():
    # ruleid: subprocess-injection
    subprocess.run(request.args.get("cmd"))
    # ruleid: subprocess-injection
    subprocess.call(request.form["cmd"])
    # ruleid: subprocess-injection
    subprocess.Popen(request.json["cmd"])


def assigned_request():
    cmd = request.form.get("cmd")
    # ruleid: subprocess-injection
    subprocess.Popen(cmd)


def shell_forms(host, path, cmd):
    # ruleid: subprocess-injection
    subprocess.run("ping " + host, shell=True)
    # ruleid: subprocess-injection
    subprocess.Popen(f"cat {path}", shell=True)
    # ruleid: subprocess-injection
    subprocess.call("ls {}".format(path), shell=True)
    # ruleid: subprocess-injection
    os.system("rm " + path)
    # ruleid: subprocess-injection
    os.popen(cmd % path)


def safe_literal():
    # ok: subprocess-injection
    subprocess.run("uptime")
    # ok: subprocess-injection
    subprocess.run(["uptime"])
    # ok: subprocess-injection
    subprocess.run("ls", shell=True)
    # ok: subprocess-injection
    os.system("ls")
