# Pyramid set_cookie with secure=False.
#
# An explicit False sends the cookie over http. True is the fix, and
# its call line is the ok.
import pyramid.httpexceptions
import pyramid.view


@pyramid.view.view_config(route_name="home")
def home(request):
    response = request.response
    # ruleid: pyramid-set-cookie-secure-unsafe-value
    response.set_cookie("session", "abc", secure=False)
    return response


@pyramid.view.view_config(route_name="prefs")
def prefs(request):
    response = request.response
    # ruleid: pyramid-set-cookie-secure-unsafe-value
    response.set_cookie("prefs", "dark", secure=False)
    return response


def found(request):
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ruleid: pyramid-set-cookie-secure-unsafe-value
    response.set_cookie("session", "abc", secure=False)
    return response


@pyramid.view.view_config(route_name="fixed")
def fixed(request):
    response = request.response
    # ok: pyramid-set-cookie-secure-unsafe-value
    response.set_cookie("session", "abc", secure=True)
    return response


def found_ok(request):
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ok: pyramid-set-cookie-secure-unsafe-value
    response.set_cookie("session", "abc", secure=True)
    return response


@pyramid.view.view_config(route_name="plain")
def plain(request):
    response = request.response
    # ok: pyramid-set-cookie-secure-unsafe-value
    return response
