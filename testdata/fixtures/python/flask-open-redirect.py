# Flask redirect with request data.
#
# Sending the caller to a URL they chose enables phishing. The finding
# lands on the redirect line for direct use. The guarded (allowlisted)
# redirect and the constant target are the oks.
import flask


@app.route("/go")
def go_a():
    # ruleid: open-redirect
    return flask.redirect(flask.request.args.get("next"))


@app.route("/gob")
def go_b():
    # ruleid: open-redirect
    return flask.redirect(flask.request.args["next"])


@app.route("/go2", methods=["POST"])
def go_c():
    # ruleid: open-redirect
    target = flask.request.form.get("next")
    flask.redirect(target)
    return target


@app.route("/fixed")
def go_fixed():
    target = flask.request.args.get("next")
    if target.startswith("/"):
        # ok: open-redirect
        return flask.redirect(target)
    return "bad"


@app.route("/lit")
def go_literal():
    # ok: open-redirect
    return flask.redirect("/home/")


def helper():
    # ok: open-redirect
    return flask.redirect("/home/")
