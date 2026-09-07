# Pyramid set_cookie without secure (unsafe default).
#
# Without secure the cookie travels over http. Passing secure=True (or
# **options) is the fix, and its call line is the ok.
import pyramid.httpexceptions
import pyramid.view


@pyramid.view.view_config(route_name="home")
def home(request):
    response = request.response
    # ruleid: pyramid-set-cookie-secure-unsafe-default
    response.set_cookie("session", "abc")
    return response


@pyramid.view.view_config(route_name="prefs")
def prefs(request):
    response = request.response
    # ruleid: pyramid-set-cookie-secure-unsafe-default
    response.set_cookie("prefs", "dark")
    return response


def found(request):
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ruleid: pyramid-set-cookie-secure-unsafe-default
    response.set_cookie("session", "abc")
    return response


@pyramid.view.view_config(route_name="fixed")
def fixed(request):
    response = request.response
    # ok: pyramid-set-cookie-secure-unsafe-default
    response.set_cookie("session", "abc", secure=True)
    return response


@pyramid.view.view_config(route_name="opts")
def opts_view(request):
    opts = {"secure": True}
    response = request.response
    # ok: pyramid-set-cookie-secure-unsafe-default
    response.set_cookie("session", "abc", **opts)
    return response


@pyramid.view.view_config(route_name="plain")
def plain(request):
    response = request.response
    # ok: pyramid-set-cookie-secure-unsafe-default
    return response
