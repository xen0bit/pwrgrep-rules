# Flask duplicate handler names across routes.
#
# Two routes registering the same function name silently override each
# other. The rule reads both decorators and defs as one match, so each
# finding lands on the first decorator line of the pair. Distinct names
# are the fix.
import flask


# ruleid: flask-duplicate-handler-name
@app.route("/a", methods=["GET"])
def dup_a():
    return "a"


@app.route("/b", methods=["GET"])
def dup_a():
    return "b"


# ruleid: flask-duplicate-handler-name
@app.route("/c", methods=["GET"])
def dup_c():
    return "c"


@app.route("/d", methods=["GET"])
def dup_c():
    return "d"


# ruleid: flask-duplicate-handler-name
@app.route("/e", methods=["GET"])
def dup_e():
    return "e"


@app.route("/f", methods=["GET"])
def dup_e():
    return "f"


@app.route("/g", methods=["GET"])
def view_g():
    # ok: flask-duplicate-handler-name
    return "g"


@app.route("/h", methods=["GET"])
def view_h():
    # ok: flask-duplicate-handler-name
    return "h"


def helper():
    # ok: flask-duplicate-handler-name
    return "plain"
