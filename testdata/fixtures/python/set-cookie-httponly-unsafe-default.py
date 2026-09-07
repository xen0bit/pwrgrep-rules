# Pyramid set_cookie without httponly (unsafe default).
#
# Without httponly, scripts can read the cookie. The rule reads the
# set_cookie call inside a view that builds its response from the
# request (or an HTTPFound); passing httponly=True (or **options) is
# the fix, and its call line is the ok.
import pyramid.httpexceptions
import pyramid.view


@pyramid.view.view_config(route_name="home")
def home(request):
    response = request.response
    # ruleid: pyramid-set-cookie-httponly-unsafe-default
    response.set_cookie("session", "abc")
    return response


@pyramid.view.view_config(route_name="prefs")
def prefs(request):
    response = request.response
    # ruleid: pyramid-set-cookie-httponly-unsafe-default
    response.set_cookie("prefs", "dark")
    return response


def found(request):
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ruleid: pyramid-set-cookie-httponly-unsafe-default
    response.set_cookie("session", "abc")
    return response


@pyramid.view.view_config(route_name="fixed")
def fixed(request):
    response = request.response
    # ok: pyramid-set-cookie-httponly-unsafe-default
    response.set_cookie("session", "abc", httponly=True)
    return response


@pyramid.view.view_config(route_name="opts")
def opts_view(request):
    opts = {"httponly": True}
    response = request.response
    # ok: pyramid-set-cookie-httponly-unsafe-default
    response.set_cookie("session", "abc", **opts)
    return response


@pyramid.view.view_config(route_name="plain")
def plain(request):
    response = request.response
    # ok: pyramid-set-cookie-httponly-unsafe-default
    return response
