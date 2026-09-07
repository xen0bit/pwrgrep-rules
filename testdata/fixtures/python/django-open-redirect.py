# Django open redirect through redirect()/HttpResponseRedirect.
#
# Sending the caller to a URL they chose enables phishing. The readings
# need bare-statement tails (assigned or returned forms match two
# readings at once and report twice), so each case redirects bare and
# the finding lands on the request line that starts the match. Per GUIDE
# the ok is the allowlist helper (is_safe_url), not a literal: the
# guarded redirect is the ok alongside the constant target.
import django.http
import django.shortcuts
import django.utils.http


def view_a(request):
    # ruleid: open-redirect
    target = request.GET.get("next")
    django.shortcuts.redirect(target)
    return target


def view_b(request):
    # ruleid: open-redirect
    target = request.POST.get("next")
    django.http.HttpResponseRedirect(target)
    return target


def view_c(request):
    # ruleid: open-redirect
    target = request.GET["next"]
    url = "/prefix/" + target
    django.shortcuts.redirect(url)
    return url


def view_guarded(request):
    target = request.GET.get("next")
    if django.utils.http.is_safe_url(target, allowed_hosts={"x.com"}):
        # ok: open-redirect
        django.shortcuts.redirect(target)
    return django.http.HttpResponse("bad")


def view_guarded_two(request):
    target = request.GET.get("next")
    if django.utils.http.url_has_allowed_host_and_scheme(target, allowed_hosts={"x.com"}):
        # ok: open-redirect
        django.http.HttpResponseRedirect(target)
    return django.http.HttpResponse("bad")


def view_literal(request):
    # ok: open-redirect
    django.shortcuts.redirect("/home/")
    return django.http.HttpResponse("home")
