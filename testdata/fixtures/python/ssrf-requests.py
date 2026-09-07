# Flask requests call with request or route data as URL (SSRF).
#
# The server fetches a caller-chosen URL. The rule reads the requests
# argument as text inside a route (any HTTP method decorator), so each
# finding lands on the requests line. A literal URL is the ok.
import flask
import requests


@app.route("/fetch")
def fetch_a():
    # ruleid: ssrf-requests
    return requests.get(flask.request.args.get("url")).text


@app.route("/fetch2")
def fetch_b():
    # ruleid: ssrf-requests
    return requests.get(flask.request.args["url"]).text


@app.post("/fetch3")
def fetch_c():
    target = flask.request.form.get("url")
    # ruleid: ssrf-requests
    requests.post(target)
    return target


@app.route("/fixed/<url>")
def fetch_fixed(url):
    # ok: ssrf-requests
    return requests.get("https://api.x.com/health").text


@app.route("/lit")
def fetch_literal():
    # ok: ssrf-requests
    return requests.get("https://api.x.com/health").text


def helper():
    # ok: ssrf-requests
    return requests.get("https://api.x.com/health").text
