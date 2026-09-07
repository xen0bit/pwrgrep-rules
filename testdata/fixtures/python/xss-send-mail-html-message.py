# Django send_mail with request data as html_message.
#
# html_message is rendered as HTML by the recipient's client, so caller
# input there is stored XSS. A literal message (or no html part) is
# the ok.
import django.core.mail


def view_a(request):
    # ruleid: xss-send-mail-html-message
    django.core.mail.send_mail("hi", "text", "a@x.com", ["b@x.com"], html_message=request.GET.get("body"))
    return 1


def view_b(request):
    # ruleid: xss-send-mail-html-message
    body = request.POST.get("body")
    django.core.mail.send_mail("hi", "text", "a@x.com", ["b@x.com"], html_message=body)
    return 1


def view_c(request):
    # ruleid: xss-send-mail-html-message
    body = request.GET["body"]
    django.core.mail.send_mail("hi", "text", "a@x.com", ["b@x.com"], html_message=body)
    return 1


def view_literal(request):
    # ok: xss-send-mail-html-message
    django.core.mail.send_mail("hi", "text", "a@x.com", ["b@x.com"], html_message="<p>hi</p>")
    return 1


def view_text(request):
    # ok: xss-send-mail-html-message
    django.core.mail.send_mail("hi", "text", "a@x.com", ["b@x.com"])
    return 1


def view_plain(request):
    # ok: xss-send-mail-html-message
    x = 1
    return x
