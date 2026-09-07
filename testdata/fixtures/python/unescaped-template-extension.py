# Flask render_template with a non-HTML extension.
#
# Jinja autoescaping only applies to .html/.htm/.xml/.xhtml; any other
# extension renders raw. A template name with a safe extension is the
# fix, and its render line is the ok.
import flask


@app.route("/a")
def view_a():
    # ruleid: unescaped-template-extension
    return flask.render_template("page.txt", name="x")


@app.route("/b")
def view_b():
    # ruleid: unescaped-template-extension
    return flask.render_template("report", x=1)


@app.route("/c")
def view_c(name):
    # ruleid: unescaped-template-extension
    return flask.render_template("page.txt", name=name)


@app.route("/ok")
def view_html():
    # ok: unescaped-template-extension
    return flask.render_template("page.html")


@app.route("/xml")
def view_xml():
    # ok: unescaped-template-extension
    return flask.render_template("data.xml")


@app.route("/plain")
def view_plain():
    # ok: unescaped-template-extension
    return "hello"
