# Flask render_template_string with a constant template.
#
# render_template_string renders its argument as a template; a constant
# is safe but still better spelled as a template file. The rule fires on
# any use, so the oks below are other render calls, not fixes.
import flask


@app.route("/a")
def view_a():
    # ruleid: render-template-string
    return flask.render_template_string("<p>hi</p>")


@app.route("/b")
def view_b():
    # ruleid: render-template-string
    return flask.render_template_string("<p>{{ name }}</p>")


@app.route("/c")
def view_c(name):
    # ruleid: render-template-string
    return flask.render_template_string("<p>hi</p>", name=name)


@app.route("/ok")
def view_file():
    # ok: render-template-string
    return flask.render_template("page.html")


@app.route("/plain")
def view_plain():
    # ok: render-template-string
    return "hello"


def helper():
    # ok: render-template-string
    return flask.render_template("other.html")
