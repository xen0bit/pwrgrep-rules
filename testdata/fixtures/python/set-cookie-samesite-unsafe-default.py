# Pyramid set_cookie without samesite (unsafe default).
#
# Without samesite the cookie rides cross-site requests. Passing
# samesite='Lax' (or **options) is the fix, and its call line is the ok.
import pyramid.httpexceptions
import pyramid.view


@pyramid.view.view_config(route_name="home")
def home(request):
    response = request.response
    # ruleid: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie("session", "abc")
    return response


@pyramid.view.view_config(route_name="prefs")
def prefs(request):
    response = request.response
    # ruleid: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie("prefs", "dark")
    return response


def found(request):
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ruleid: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie("session", "abc")
    return response


@pyramid.view.view_config(route_name="fixed")
def fixed(request):
    response = request.response
    # ok: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie("session", "abc", samesite='Lax')
    return response


@pyramid.view.view_config(route_name="opts")
def opts_view(request):
    opts = {"samesite": "Lax"}
    response = request.response
    # ok: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie("session", "abc", **opts)
    return response


@pyramid.view.view_config(route_name="plain")
def plain(request):
    response = request.response
    # ok: pyramid-set-cookie-samesite-unsafe-default
    return response
