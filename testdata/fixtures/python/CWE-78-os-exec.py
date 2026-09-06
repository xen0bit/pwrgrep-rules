import os
import flask
app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    # ruleid: dangerous-os-exec
    os.execl("/bin/bash", "/bin/bash", "-c", route_param)
    return "oops"

@app.route("/route_param/<route_param>")
def route_param2(route_param):
    # ok: dangerous-os-exec
    os.execl("static", "ok")
    return "ok"

def other():
    x = flask.request.args.get("q")
    # ruleid: dangerous-os-exec
    os.execve("/bin/bash", ["/bin/bash", "-c", x], os.environ)
    # ok: dangerous-os-exec
    os.execve("/bin/bash", ["/bin/bash", "-c", "static"], os.environ)

@app.route("/test/<param>")
def test(param):
    # ruleid: dangerous-os-exec
    os.execl("/bin/sh", "/bin/sh", "-c", param)
    return "x"

def okfunc():
    # ok: dangerous-os-exec
    os.execl("/bin/sh", "/bin/sh", "-c", "static")
