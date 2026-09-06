# CWE-79: Cross-site scripting — a template string the caller chose is rendered.
#
# `flask.render_template_string`, `markupsafe.Markup` and `jinja2.Template`
# treat the string as a template. A `{{ }}` or `{% %}` in the caller's text
# becomes code. A literal template is safe.
import flask
from flask import request
import markupsafe
import jinja2


@app.route("/hello/<name>")
def from_route(name):
    # ruleid: python-xss
    flask.render_template_string(name)
    # ruleid: python-xss
    markupsafe.Markup(name)


def from_query():
    t = request.args.get("template")
    # ruleid: python-xss
    flask.render_template_string(t)
    # ruleid: python-xss
    jinja2.Template(t)
    # ruleid: python-xss
    markupsafe.Markup(t)
    # Propagation through a variable — reaching must follow it.
    tmpl = t
    # ruleid: python-xss
    flask.render_template_string(tmpl)


def safe_literal():
    # ok: python-xss
    flask.render_template_string("Hello {{ name }}")
    # ok: python-xss
    markupsafe.Markup("<b>hello</b>")
    # ok: python-xss
    jinja2.Template("Hello {{ user }}")
    # ok: python-xss
    flask.render_template_string("static template")


def safe_render():
    tmpl = "Hello {{ name }}"
    user = request.args.get("user")
    # ok: python-xss — user data is passed as variable, not template string
    flask.render_template_string(tmpl, name=user)
