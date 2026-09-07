# Flask explicit unescape through Markup.
#
# Markup() marks the value safe, rendering caller input raw wherever it
# flows. Escaped output is the fix.
import flask
import markupsafe


def view_a(body):
    # ruleid: explicit-unescape-with-markup
    html = flask.Markup(body)
    return html


def view_b(body):
    # ruleid: explicit-unescape-with-markup
    html = markupsafe.Markup(body)
    return html


def view_c(body):
    # ruleid: explicit-unescape-with-markup
    html = flask.Markup.unescape(body)
    return html


def view_escaped(body):
    import html
    # ok: explicit-unescape-with-markup
    text = html.escape(body)
    return text


def view_plain(body):
    # ok: explicit-unescape-with-markup
    text = "<p>" + body + "</p>"
    return text


def helper():
    # ok: explicit-unescape-with-markup
    return "hello"
