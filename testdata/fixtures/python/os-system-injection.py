# Flask os.system with request or route data.
#
# The string is interpreted by /bin/sh. The rule reads the system
# argument as text (request accessor or route variable inside), so each
# finding lands on the os.system line. A literal command is the ok.
import flask
import os


@app.route("/run")
def run_a():
    # ruleid: os-system-injection
    os.system(flask.request.args.get("cmd"))
    return "ok"


@app.route("/run2")
def run_b():
    # ruleid: os-system-injection
    os.system(flask.request.args["cmd"])
    return "ok"


@app.route("/run2", methods=["POST"])
def run_c():
    cmd = flask.request.form.get("cmd")
    # ruleid: os-system-injection
    os.system(cmd)
    return "ok"


@app.route("/fixed/<cmd>")
def run_fixed(cmd):
    # ok: os-system-injection
    os.system("uptime")
    return "ok"


@app.route("/lit")
def run_literal():
    # ok: os-system-injection
    os.system("uptime")
    return "ok"


def helper():
    # ok: os-system-injection
    os.system("uptime")
    return "ok"
