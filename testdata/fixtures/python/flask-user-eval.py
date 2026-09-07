# Flask eval of request or route data.
#
# The rule reads the eval argument as text: a request accessor or the
# route variable inside makes it the finding, which lands on the eval
# line. A literal (or unrelated value) is the ok.
import flask


@app.route("/eval")
def eval_a():
    # ruleid: eval-injection
    eval(flask.request.args.get("code"))
    return "ok"


@app.route("/evalb")
def eval_b():
    # ruleid: eval-injection
    eval(flask.request.args["code"])
    return "ok"


@app.route("/eval2", methods=["POST"])
def eval_c():
    code = flask.request.form.get("code")
    # ruleid: eval-injection
    eval(code)
    return "ok"


@app.route("/fixed")
def eval_fixed():
    # ok: eval-injection
    eval("1 + 1")
    return "ok"


@app.route("/const/<code>")
def eval_const(code):
    text = "1 + 1"
    # ok: eval-injection
    eval(text)
    return "ok"


def helper():
    # ok: eval-injection
    eval("1 + 1")
    return "ok"
