# Flask route returning json.dumps instead of jsonify.
#
# jsonify sets the content type and handles encoding; raw dumps does
# neither. The rule reports each dumps twice (the return reading and
# the focused call reading share the line), so every vulnerable line
# carries two annotations. The fix is jsonify, and its lines are the ok.
import flask
import json


@app.route("/a")
def view_a():
    # ruleid: use-jsonify
    # ruleid: use-jsonify
    return json.dumps({"ok": True})


@app.route("/b")
def view_b():
    data = {"ok": True}
    # ruleid: use-jsonify
    # ruleid: use-jsonify
    return json.dumps(data)


@app.route("/c")
def view_c():
    # ruleid: use-jsonify
    # ruleid: use-jsonify
    return json.dumps([1, 2, 3])


@app.route("/ok")
def view_fixed():
    # ok: use-jsonify
    return flask.jsonify({"ok": True})


@app.route("/plain")
def view_plain():
    # ok: use-jsonify
    return "hello"


def helper():
    # ok: use-jsonify
    return json.dumps({"ok": True})
