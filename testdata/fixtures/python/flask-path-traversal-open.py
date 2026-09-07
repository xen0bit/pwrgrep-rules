# Flask open() with request or route data.
#
# A caller-chosen path escapes the intended directory. The rule reads
# the open argument as text, so each finding lands on the open line. A
# literal path is the ok.
import flask


@app.route("/read")
def read_a():
    # ruleid: path-traversal-open
    return open(flask.request.args.get("name")).read()


@app.route("/read2")
def read_b():
    # ruleid: path-traversal-open
    return open(flask.request.args["name"]).read()


@app.route("/read3", methods=["POST"])
def read_c():
    name = flask.request.form.get("name")
    # ruleid: path-traversal-open
    open(name)
    return name


@app.route("/fixed/<name>")
def read_fixed(name):
    # ok: path-traversal-open
    return open("report.txt").read()


@app.route("/lit")
def read_literal():
    # ok: path-traversal-open
    return open("report.txt").read()


def helper():
    # ok: path-traversal-open
    return open("report.txt").read()
