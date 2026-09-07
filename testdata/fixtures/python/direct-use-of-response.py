# Pyramid request data rendered through the response body.
#
# Assigning caller input to response.body/text serves it raw. Any body
# assignment in a view fires (the request on the left already counts as
# the source), so the safe cases below never assign the body: headers,
# status and plain returns are the oks.
import pyramid.view


@pyramid.view.view_config(route_name="hi")
def hi(request):
    name = request.params.get("name")
    # ruleid: pyramid-direct-use-of-response
    request.response.body = name
    return request.response


@pyramid.view.view_config(route_name="yo")
def yo(request):
    name = request.params.get("name")
    # ruleid: pyramid-direct-use-of-response
    request.response.text = name
    return request.response


@pyramid.view.view_config(route_name="sup")
def sup(request):
    name = request.params.get("name")
    # ruleid: pyramid-direct-use-of-response
    request.response.ubody = name
    return request.response


@pyramid.view.view_config(route_name="headers")
def headers(request):
    # ok: pyramid-direct-use-of-response
    request.response.headers["X-A"] = "b"
    return request.response


@pyramid.view.view_config(route_name="status")
def status(request):
    # ok: pyramid-direct-use-of-response
    request.response.status = 200
    return request.response


@pyramid.view.view_config(route_name="plain")
def plain(request):
    # ok: pyramid-direct-use-of-response
    return {"hello": "world"}
