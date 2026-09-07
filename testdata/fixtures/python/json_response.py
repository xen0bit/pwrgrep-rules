# Django view building HttpResponse from json.dumps instead of JsonResponse.
#
# Serializing with json.dumps and wrapping in HttpResponse skips the
# content-type and safety handling JsonResponse provides. The rule reads
# the dumps assignment and the bare HttpResponse call as one match, so
# the finding lands on the json.dumps line that starts it.
import django.http
import json


def view(request):
    payload = {"ok": True}
    # ruleid: use-json-response
    body = json.dumps(payload)
    django.http.HttpResponse(body)


def view_two(request):
    # ruleid: use-json-response
    text = json.dumps({"user": "alice"})
    django.http.HttpResponse(text)


def view_three(request):
    data = [1, 2, 3]
    # ruleid: use-json-response
    out = json.dumps(data)
    django.http.HttpResponse(out)


def view_json_response(request):
    payload = {"ok": True}
    # ok: use-json-response
    return django.http.JsonResponse(payload)


def view_plain(request):
    # ok: use-json-response
    django.http.HttpResponse("hello")


def view_dumps_only(request):
    payload = {"ok": True}
    # ok: use-json-response
    text = json.dumps(payload)
    print(text)
