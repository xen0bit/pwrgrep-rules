# Django request data reflected through HttpResponseBadRequest.
#
# Unescaped caller input in the 400 response is reflected XSS. The
# readings need bare-statement tails (returned forms match two readings
# at once), so each case responds bare and the finding lands on the
# request line that starts the match. A literal body is the ok.
import django.http


def view_a(request):
    # ruleid: reflected-data-httpresponsebadrequest
    name = request.GET.get("name")
    django.http.HttpResponseBadRequest(name)
    return name


def view_b(request):
    # ruleid: reflected-data-httpresponsebadrequest
    name = request.GET["name"]
    django.http.HttpResponseBadRequest("bad " + name)
    return name


def view_c(request):
    # ruleid: reflected-data-httpresponsebadrequest
    name = request.POST.get("name")
    body = "bad: " + name
    django.http.HttpResponseBadRequest(body)
    return body


def view_literal(request):
    # ok: reflected-data-httpresponsebadrequest
    django.http.HttpResponseBadRequest("bad input")
    return "bad"


def view_empty(request):
    # ok: reflected-data-httpresponsebadrequest
    django.http.HttpResponseBadRequest()
    return "empty"


def view_plain(request):
    # ok: reflected-data-httpresponsebadrequest
    x = 1
    return x
