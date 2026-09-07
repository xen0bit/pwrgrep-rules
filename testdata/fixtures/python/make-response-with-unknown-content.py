# Flask make_response with unknown content.
#
# make_response with a bare variable sends whatever content type the
# value implies; literals, dicts and the known render helpers are
# excluded. The finding lands on the make_response line.
import flask
import json


@app.route("/a")
def view_a(body):
    # ruleid: make-response-with-unknown-content
    return flask.make_response(body)


@app.route("/b")
def view_b(name):
    # ruleid: make-response-with-unknown-content
    return flask.make_response("hi " + name)


@app.route("/c")
def view_c(name):
    text = "hi " + name
    # ruleid: make-response-with-unknown-content
    return flask.make_response(text)


@app.route("/lit")
def view_literal():
    # ok: make-response-with-unknown-content
    return flask.make_response("hello")


@app.route("/json")
def view_json():
    # ok: make-response-with-unknown-content
    return flask.make_response(flask.jsonify({"ok": True}))


@app.route("/tpl")
def view_template():
    # ok: make-response-with-unknown-content
    return flask.make_response(flask.render_template("page.html"))
