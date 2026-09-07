# Django data rendered straight through HttpResponse.
#
# HttpResponse does not escape; caller input passed to it renders raw.
# Literals, empty responses and explicit statuses carry no input and are
# excluded. The finding lands on the response line.
import django.http


def view_a(body):
    # ruleid: direct-use-of-httpresponse
    return django.http.HttpResponse(body)


def view_b(body):
    # ruleid: direct-use-of-httpresponse
    return django.http.HttpResponseBadRequest(body)


def view_c(body):
    # ruleid: direct-use-of-httpresponse
    return django.http.HttpResponse(body, content_type="text/html")


def view_literal():
    # ok: direct-use-of-httpresponse
    return django.http.HttpResponse("hello")


def view_empty():
    # ok: direct-use-of-httpresponse
    return django.http.HttpResponse()


def view_status():
    # ok: direct-use-of-httpresponse
    return django.http.HttpResponse(status=200)
