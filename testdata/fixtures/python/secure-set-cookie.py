# Flask set_cookie without secure flags.
#
# Cookies without secure/httponly/samesite leak over http, to scripts,
# and cross-site. The rule only reads files building a Response, and the
# fix passes all three flags (or **options); its set_cookie line is the
# ok. The receiver must be a plain name bound from make_response.
import flask


def view_a():
    resp = flask.make_response("hi")
    # ruleid: secure-set-cookie
    resp.set_cookie("session", "abc")
    return resp


def view_b():
    resp = flask.make_response("hi")
    # ruleid: secure-set-cookie
    resp.set_cookie("prefs", "dark")
    return resp


def view_c():
    resp = flask.Response("hi")
    # ruleid: secure-set-cookie
    resp.set_cookie("theme", "light")
    return resp


def view_fixed():
    resp = flask.make_response("hi")
    # ok: secure-set-cookie
    resp.set_cookie("session", "abc", secure=True, httponly=True, samesite="Lax")
    return resp


def view_opts():
    opts = {"secure": True}
    resp = flask.make_response("hi")
    # ok: secure-set-cookie
    resp.set_cookie("session", "abc", **opts)
    return resp


def view_plain():
    resp = flask.make_response("hi")
    # ok: secure-set-cookie
    return resp
