# Pyramid set_cookie with an unsafe samesite value.
#
# Only 'Lax' (single-quoted, as the rule spells it) is accepted; any
# other value leaves the cookie on cross-site requests. The finding
# lands on the call line.
import pyramid.httpexceptions
import pyramid.view


@pyramid.view.view_config(route_name="home")
def home(request):
    response = request.response
    # ruleid: pyramid-set-cookie-samesite-unsafe-value
    response.set_cookie("session", "abc", samesite="None")
    return response


@pyramid.view.view_config(route_name="prefs")
def prefs(request):
    response = request.response
    # ruleid: pyramid-set-cookie-samesite-unsafe-value
    response.set_cookie("prefs", "dark", samesite="Strict")
    return response


def found(request):
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ruleid: pyramid-set-cookie-samesite-unsafe-value
    response.set_cookie("session", "abc", samesite="None")
    return response


@pyramid.view.view_config(route_name="fixed")
def fixed(request):
    opts = {"samesite": "Lax"}
    response = request.response
    # ok: pyramid-set-cookie-samesite-unsafe-value
    response.set_cookie("session", "abc", **opts)
    return response


def found_ok(request):
    opts = {"samesite": "Lax"}
    response = pyramid.httpexceptions.HTTPFound(location="/")
    # ok: pyramid-set-cookie-samesite-unsafe-value
    response.set_cookie("session", "abc", **opts)
    return response


@pyramid.view.view_config(route_name="plain")
def plain(request):
    response = request.response
    # ok: pyramid-set-cookie-samesite-unsafe-value
    return response
