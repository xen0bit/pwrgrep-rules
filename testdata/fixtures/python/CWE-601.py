# CWE-601: Open Redirect — redirect with user-controlled URL.
#
# A redirect that uses a value the caller chose lets the caller send the victim
# to a site the attacker controls. The sink is flask.redirect / HttpResponseRedirect
# and the source is request.GET / request.args / query_string / route var.
# Safe cases use a literal or check is_safe_url first.

from flask import Flask, request, redirect
from django.http import HttpResponseRedirect
from django.shortcuts import redirect as django_redirect
from django.shortcuts import redirect

app = Flask(__name__)

@app.route('/go/<next_url>')
def from_route(next_url):
    # ruleid: python-open-redirect
    return redirect(next_url)

def from_query():
    url = request.args.get("next")
    # ruleid: python-open-redirect
    return redirect(url)

def from_get():
    url = request.GET.get("url")
    # ruleid: python-open-redirect
    return HttpResponseRedirect(url)

def from_post():
    target = request.POST["target"]
    # ruleid: python-open-redirect
    return redirect(target)

def via_variable():
    nxt = request.args["next"]
    combined = nxt
    # ruleid: python-open-redirect
    return redirect(combined)

def safe_literal():
    # ok: python-open-redirect
    return redirect("/home")

def safe_allowlist():
    url = request.args.get("next")
    if is_safe_url(url):
        # ok: python-open-redirect
        return redirect(url)
    return redirect("/home")

def safe_django_allowed():
    url = request.GET["next"]
    if url_has_allowed_host_and_scheme(url, allowed_hosts={"example.com"}):
        # ok: python-open-redirect
        return HttpResponseRedirect(url)
    return HttpResponseRedirect("/safe")

def helper_not_redirect():
    return "not a redirect: " + request.args.get("x", "")
