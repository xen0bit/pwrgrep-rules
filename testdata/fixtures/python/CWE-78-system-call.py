import os
import flask
app = flask.Flask(__name__)

@app.route("/route/<param>")
def route(param):
    # ruleid: dangerous-system-call
    os.system("prefix" + param)
    return "oops"

@app.route("/r/<p>")
def r(p):
    # ok: dangerous-system-call
    os.system("static")
    return "ok"

def django_view(request):
    x = request.POST.get("x")
    # ruleid: dangerous-system-call
    os.popen("prefix" + x)
    # ok: dangerous-system-call
    os.popen("static")
    return x

from pyramid.view import view_config
from pyramid.request import Response
@view_config(route_name="bad", renderer="t.mako")
def my_bad_view(request):
    param = request.params.get("p", "")
    # ruleid: dangerous-system-call
    os.system("prefix" + param + "suffix")
    return Response("oops")

@view_config(route_name="good", renderer="t.mako")
def my_good_view(request):
    # ok: dangerous-system-call
    os.system("static")
    return Response("ok")
