# Django mark_safe on non-literal strings.
#
# mark_safe tells the template engine the string needs no escaping, so
# caller input marked safe becomes stored XSS. Literals are excluded (no
# input to escape) as is format_html, which escapes its arguments. The
# finding lands on the mark_safe call line.
import django.utils.html
import django.utils.safestring


def view_a(user_input):
    # ruleid: avoid-mark-safe
    html = django.utils.safestring.mark_safe(user_input)
    return html


def view_b(user_input):
    name = user_input.strip()
    # ruleid: avoid-mark-safe
    html = django.utils.safestring.mark_safe(name)
    return html


def view_c(user_input):
    # ruleid: avoid-mark-safe
    return django.utils.safestring.mark_safe(user_input)


def view_literal():
    # ok: avoid-mark-safe
    html = django.utils.safestring.mark_safe("<b>hello</b>")
    return html


def view_format(user_input):
    # ok: avoid-mark-safe
    html = django.utils.html.format_html("<b>{}</b>", user_input)
    return html


def view_plain(user_input):
    # ok: avoid-mark-safe
    html = "<b>" + user_input + "</b>"
    return html
