"""host-header-injection-python: flask.request.host builds a URL.

Assembling a request URL from flask.request.host inside a route is
reported, whether directly or via a variable; the same code outside a
route, and URLs not built from the host, are not.
"""
import flask

app = flask.Flask(__name__)


@app.route("/go")
def go():
    # ruleid: host-header-injection-python
    target = "http://" + flask.request.host
    return target


@app.route("/via-var")
def via_var():
    # ruleid: host-header-injection-python
    host = flask.request.host
    # ruleid: host-header-injection-python
    target = "https://" + host + "/callback"
    return target


@app.route("/static")
def static():
    # ok: host-header-injection-python
    target = "https://example.com/fixed"
    return target


def helper():
    # ok: host-header-injection-python
    target = "http://" + flask.request.host
    return target
