# Flask GET handler reading the request body.
#
# GET has no body, so request.json/form/data inside a GET route throws.
# The rule names the singular method="GET" spelling. The finding lands
# on the request line inside the handler.
import flask


@app.route("/a", method="GET")
def view_a():
    # ruleid: avoid-accessing-request-in-wrong-handler
    data = flask.request.json
    return data


@app.route("/b", method="GET")
def view_b():
    # ruleid: avoid-accessing-request-in-wrong-handler
    form = flask.request.form
    return form


@app.route("/c", method="GET")
def view_c():
    # ruleid: avoid-accessing-request-in-wrong-handler
    payload = flask.request.data
    return payload


@app.route("/d", method="POST")
def view_post():
    # ok: avoid-accessing-request-in-wrong-handler
    data = flask.request.json
    return data


@app.route("/e", method="GET")
def view_plain():
    # ok: avoid-accessing-request-in-wrong-handler
    return "hello"


def helper():
    # ok: avoid-accessing-request-in-wrong-handler
    data = flask.request.json
    return data
