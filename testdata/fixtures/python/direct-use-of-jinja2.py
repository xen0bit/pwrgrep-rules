# Flask direct use of jinja2 instead of render_template.
#
# Rendering through jinja2 directly skips Flask's autoescaping context.
# The environment, the render call, and the template read are each the
# finding where they appear. render_template is the fix.
import jinja2


def view_a():
    # ruleid: direct-use-of-jinja2
    env = jinja2.Environment(loader="loader")
    return env


def view_b():
    tpl = jinja2.Template("<p>hi</p>")
    # ruleid: direct-use-of-jinja2
    text = tpl.render()
    return text


def view_c():
    # ruleid: direct-use-of-jinja2
    env = jinja2.Environment(loader="loader")
    tpl = env.get_template("page.html")
    # ruleid: direct-use-of-jinja2
    text = tpl.render()
    return text


def view_file(name):
    import flask
    # ok: direct-use-of-jinja2
    return flask.render_template("page.html", name=name)


def view_plain():
    # ok: direct-use-of-jinja2
    return "hello"


def helper():
    # ok: direct-use-of-jinja2
    x = 1
    return x
