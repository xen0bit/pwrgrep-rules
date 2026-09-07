# Django EmailMessage with request data as the HTML body.
#
# The second positional argument is the body, but the rule only reports
# it where the message is marked HTML via content_subtype in the same
# function. The call must stay a bare statement tail: assigned or
# returned forms match two readings at once and report twice. A literal
# body, or a message never marked HTML, is the ok.
import django.core.mail


def view_a(request):
    # ruleid: xss-html-email-body
    django.core.mail.EmailMessage("hi", request.GET.get("body"), "a@x.com", ["b@x.com"]).content_subtype = "html"
    return 1


def view_b(request):
    # ruleid: xss-html-email-body
    body = request.GET["body"]
    django.core.mail.EmailMessage("hi", body, "a@x.com", ["b@x.com"])
    msg = django.core.mail.EmailMessage("hi", "x")
    msg.content_subtype = "html"
    return 1


def view_c(request):
    # ruleid: xss-html-email-body
    data = request.POST.get("body")
    text = "prefix:%s" % data
    django.core.mail.EmailMessage("hi", text, "a@x.com", ["b@x.com"])
    msg = django.core.mail.EmailMessage("hi", "x")
    msg.content_subtype = "html"
    return 1


def view_literal(request):
    # ok: xss-html-email-body
    django.core.mail.EmailMessage("hi", "hello", "a@x.com", ["b@x.com"]).content_subtype = "html"
    return 1


def view_plain_html(request):
    # ok: xss-html-email-body
    django.core.mail.EmailMessage("hi", request.GET.get("body"), "a@x.com", ["b@x.com"])
    return 1


def view_plain(request):
    # ok: xss-html-email-body
    x = 1
    return x
