# Django format_html given a pre-formatted string.
#
# format_html escapes its arguments; formatting first (f-string, % or
# .format) disables that encoding for the interpolated parts. Passing
# the template and the values separately is the fix, and its call line
# is the ok.
from django.utils.html import format_html


def view_a(name):
    # ruleid: formathtml-fstring-parameter
    return format_html(f"<b>{name}</b>")


def view_b(name):
    # ruleid: formathtml-fstring-parameter
    return format_html("<b>%s</b>" % name)


def view_c(name):
    # ruleid: formathtml-fstring-parameter
    return format_html("<b>{}</b>".format(name))


def view_fixed(name):
    # ok: formathtml-fstring-parameter
    return format_html("<b>{}</b>", name)


def view_fixed_two(first, last):
    # ok: formathtml-fstring-parameter
    return format_html("<b>{} {}</b>", first, last)


def view_literal():
    # ok: formathtml-fstring-parameter
    return format_html("<b>alice</b>")
