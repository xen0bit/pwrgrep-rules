# Django set_cookie without secure flags.
#
# Cookies without secure/httponly/samesite leak over http, to scripts,
# and cross-site. The rule only reads files that build responses (the
# import below), and the fix passes all three flags (or **options); its
# set_cookie line is the ok.
import django.http.HttpResponse


def view_a(request):
    response = django.http.HttpResponse("hi")
    # ruleid: django-secure-set-cookie
    response.set_cookie("session", "abc")
    return response


def view_b(request):
    response = django.http.HttpResponse("hi")
    # ruleid: django-secure-set-cookie
    response.set_cookie("prefs", "dark")
    return response


def view_c(request):
    response = django.http.HttpResponse("hi")
    # ruleid: django-secure-set-cookie
    response.set_cookie("theme", "light", max_age=60)
    return response


def view_fixed(request):
    response = django.http.HttpResponse("hi")
    # ok: django-secure-set-cookie
    response.set_cookie("session", "abc", secure=True, httponly=True, samesite="Lax")
    return response


def view_opts(request):
    opts = {"secure": True}
    response = django.http.HttpResponse("hi")
    # ok: django-secure-set-cookie
    response.set_cookie("session", "abc", **opts)
    return response


def view_plain(request):
    # ok: django-secure-set-cookie
    response = django.http.HttpResponse("hi")
    return response
