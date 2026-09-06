import os, flask
app = flask.Flask(__name__)

@app.route("/route/<param>")
def route(param):
    # ruleid: dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/sh", "-c", param)
    return "oops"

@app.route("/r/<p>")
def r(p):
    # ok: dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/sh", "-c", "static")
    return "ok"

def django_view(request):
    x = request.POST.get("x")
    # ruleid: dangerous-spawn-process
    os.spawnv(os.P_WAIT, "/bin/bash", ["-c", x])
    # ok: dangerous-spawn-process
    os.spawnv(os.P_WAIT, "/bin/bash", ["-c", "static"])
    return x

def ok_func():
    # ruleid: dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/bash", "-c", flask.request.args.get("q"))
    # ok: dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/bash", "-c", "static2")
