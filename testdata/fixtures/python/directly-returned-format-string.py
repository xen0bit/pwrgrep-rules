# Flask route directly returning a formatted string.
#
# Returning request input formatted into HTML reflects it unescaped
# (XSS). Route parameters and request accessors are the sources; a
# literal return is excluded. The finding lands on the return line.
import flask


@app.route("/hi/<name>")
def hi(name):
    # ruleid: directly-returned-format-string
    return "hello %s" % name


@app.route("/yo/<name>")
def yo(name):
    # ruleid: directly-returned-format-string
    return "hello " + name


@app.route("/sup")
def sup():
    # ruleid: directly-returned-format-string
    return "hello %s" % request.args.get("name")


@app.route("/var/<name>")
def var(name):
    greeting = "hello %s" % name
    # ruleid: directly-returned-format-string
    return greeting


@app.route("/lit")
def lit():
    # ok: directly-returned-format-string
    return "hello"


@app.route("/fixed")
def fixed():
    # ok: directly-returned-format-string
    return flask.render_template("hi.html")


@app.route("/const")
def const():
    # ok: directly-returned-format-string
    return "constant"
