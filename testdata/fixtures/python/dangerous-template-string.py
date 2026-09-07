# Flask template string built by formatting, then rendered.
#
# Formatting into the template source makes it a template injection
# (SSTI) where any part is caller-controlled. The readings need the
# render as a bare statement tail, so each case renders bare and the
# finding lands on the assignment line that starts the match. Rendering
# a literal is the ok.
import flask


def view_a(name):
    # ruleid: dangerous-template-string
    template = "<p>%s</p>" % name
    flask.render_template_string(template)
    return template


def view_b(name):
    # ruleid: dangerous-template-string
    template = "<p>{}</p>".format(name)
    flask.render_template_string(template)
    return template


def view_c(name):
    # ruleid: dangerous-template-string
    template = f"<p>{name}</p>"
    flask.render_template_string(template)
    return template


def view_literal():
    template = "<p>hi</p>"
    # ok: dangerous-template-string
    flask.render_template_string(template)
    return template


def view_file():
    # ok: dangerous-template-string
    return flask.render_template("page.html")


def view_plain(name):
    # ok: dangerous-template-string
    return name
