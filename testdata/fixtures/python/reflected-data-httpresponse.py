# Django request data reflected through HttpResponse.
#
# Unescaped caller input in the response is reflected XSS. The readings
# need bare-statement tails (returned forms match two readings at once),
# so each case responds bare and the finding lands on the request line
# that starts the match. A literal body is the ok.
import django.http


def view_a(request):
    # ruleid: reflected-data-httpresponse
    name = request.GET.get("name")
    django.http.HttpResponse(name)
    return name


def view_b(request):
    # ruleid: reflected-data-httpresponse
    name = request.GET["name"]
    django.http.HttpResponse("hello " + name)
    return name


def view_c(request):
    # ruleid: reflected-data-httpresponse
    name = request.POST.get("name")
    body = "hello " + name
    django.http.HttpResponse(body)
    return body


def view_literal(request):
    # ok: reflected-data-httpresponse
    django.http.HttpResponse("hello")
    return "hello"


def view_empty(request):
    # ok: reflected-data-httpresponse
    django.http.HttpResponse()
    return "empty"


def view_plain(request):
    # ok: reflected-data-httpresponse
    x = 1
    return x
