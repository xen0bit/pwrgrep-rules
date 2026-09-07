# Flask subprocess with request or route data.
#
# Shell-less subprocess still runs the named program with attacker
# arguments. Literal commands and argv lists are excluded; anything else
# carrying request or route data is the finding, which lands on the call
# line.
import flask
import subprocess


@app.route("/run")
def run_a():
    # ruleid: subprocess-injection
    subprocess.run(flask.request.args.get("cmd"))
    return "ok"


@app.route("/run/<cmd>")
def run_b(cmd):
    # ruleid: subprocess-injection
    subprocess.call(cmd)
    return "ok"


@app.route("/run2", methods=["POST"])
def run_c():
    cmd = flask.request.form.get("cmd")
    # ruleid: subprocess-injection
    subprocess.Popen(cmd)
    return "ok"


@app.route("/fixed")
def run_fixed():
    # ok: subprocess-injection
    subprocess.run("uptime")
    return "ok"


@app.route("/argv")
def run_argv():
    # ok: subprocess-injection
    subprocess.run(["uptime"])
    return "ok"


@app.route("/argvvar")
def run_argv_var():
    cmd = ["uptime"]
    # ok: subprocess-injection
    subprocess.run(cmd)
    return "ok"
