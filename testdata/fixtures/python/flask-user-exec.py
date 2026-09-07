# Flask exec of request or route data.
#
# The rule reads the exec argument as text: a request accessor or the
# route variable inside makes it the finding, which lands on the exec
# line. A literal (or unrelated value) is the ok.
import flask


@app.route("/exec")
def exec_a():
    # ruleid: exec-injection
    exec(flask.request.args.get("code"))
    return "ok"


@app.route("/execb")
def exec_b():
    # ruleid: exec-injection
    exec(flask.request.args["code"])
    return "ok"


@app.route("/exec2", methods=["POST"])
def exec_c():
    code = flask.request.form.get("code")
    # ruleid: exec-injection
    exec(code)
    return "ok"


@app.route("/fixed")
def exec_fixed():
    # ok: exec-injection
    exec("x = 1")
    return "ok"


@app.route("/const/<code>")
def exec_const(code):
    text = "x = 1"
    # ok: exec-injection
    exec(text)
    return "ok"


def helper():
    # ok: exec-injection
    exec("x = 1")
    return "ok"
