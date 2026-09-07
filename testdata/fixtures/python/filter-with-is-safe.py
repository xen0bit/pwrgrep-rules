# Django template filters registered with is_safe=True.
#
# is_safe=True tells the engine the filter's output needs no escaping,
# so any markup it returns renders raw. The finding lands on the
# decorator line.
from django import template

register = template.Library()


# ruleid: filter-with-is-safe
@register.filter(is_safe=True)
def shout(value):
    return value.upper()


# ruleid: filter-with-is-safe
@register.filter(name="whisper", is_safe=True)
def whisper(value):
    return value.lower()


# ruleid: filter-with-is-safe
@register.filter(is_safe=True, needs_autoescape=True)
def glow(value):
    return value


# ok: filter-with-is-safe
@register.filter(is_safe=False)
def plain(value):
    return value


# ok: filter-with-is-safe
@register.filter(name="echo")
def echo(value):
    return value


# ok: filter-with-is-safe
def bare(value):
    return value
