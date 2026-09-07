# Django template Context with autoescape disabled.
#
# Turning autoescape off renders caller input unescaped. The rule focuses
# the False literal, which sits on the assignment line, so the finding
# lands there. Only the subscript shape fires: the dict-literal
# alternative ({..., "autoescape": False, ...}) matches nothing as
# written, so every vulnerable case below uses subscript assignment.
# True (or a non-False value) keeps escaping and is the ok.
import django.template


def render_a(text):
    ctx = django.template.Context({"text": text})
    # ruleid: context-autoescape-off
    ctx["autoescape"] = False
    return ctx


def render_b(text):
    context = django.template.Context({"text": text})
    # ruleid: context-autoescape-off
    context["autoescape"] = False
    return context


def render_c(other):
    ctx = django.template.Context({"other": other})
    # ruleid: context-autoescape-off
    ctx["autoescape"] = False
    return ctx


def render_on(text):
    ctx = django.template.Context({"text": text})
    # ok: context-autoescape-off
    ctx["autoescape"] = True
    return ctx


def render_var(text, flag):
    ctx = django.template.Context({"text": text})
    # ok: context-autoescape-off
    ctx["autoescape"] = flag
    return ctx


def render_other(text):
    # ok: context-autoescape-off
    ctx = {"text": text, "debug": False}
    return ctx
