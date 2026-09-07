# Django render with globals() as the template context.
#
# globals() exposes every module-level name (settings, secrets, helpers)
# to the template. Only the direct forms are shown: the via-variable
# reading joins file-wide, so any render in a file holding
# `ctx = globals()` fires and safe renders cannot be marked ok beside
# it. Non-render code is therefore the ok.
import django.shortcuts
import django.template


def view_a(request):
    # ruleid: globals-as-template-context
    return django.shortcuts.render(request, "page.html", globals())


def view_b(request):
    tpl = django.template.Template("hello")
    # ruleid: globals-as-template-context
    return django.template.Template.render(tpl, globals())


def view_c(request):
    # ruleid: globals-as-template-context
    return django.shortcuts.render(request, "other.html", globals())


def view_fixed(request):
    # ok: globals-as-template-context
    return django.shortcuts.redirect("/home/")


def view_plain(request):
    # ok: globals-as-template-context
    x = 1
    return x


def view_other(request):
    # ok: globals-as-template-context
    return "alice"
