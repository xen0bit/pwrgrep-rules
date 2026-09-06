import subprocess
import flask
app = flask.Flask(__name__)

@app.route("/route/<param>")
def route(param):
    # ruleid: dangerous-subprocess-use
    subprocess.call("prefix" + param, shell=True)
    return "oops"

@app.route("/r/<p>")
def r(p):
    # ok: dangerous-subprocess-use
    subprocess.call("static", shell=True)
    return "ok"

def django_view(request):
    x = request.POST.get("x")
    # ruleid: dangerous-subprocess-use
    subprocess.Popen("prefix" + x, shell=True)
    # ok: dangerous-subprocess-use
    subprocess.Popen("static", shell=True)
    return x

def ok_func():
    # ruleid: dangerous-subprocess-use
    subprocess.call("echo " + flask.request.args.get("q"), shell=True)
    # ok: dangerous-subprocess-use
    subprocess.call("echo static", shell=True)
