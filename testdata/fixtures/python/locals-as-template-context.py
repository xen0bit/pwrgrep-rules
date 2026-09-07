# Django render with locals() as the template context.
#
# locals() exposes every local name to the template, including values
# never meant for display. Only the direct forms are shown: the
# via-variable reading joins file-wide, so any render in a file holding
# `ctx = locals()` fires and safe renders cannot be marked ok beside it.
# Non-render code is therefore the ok.
import django.shortcuts
import django.template


def view_a(request):
    name = "alice"
    # ruleid: locals-as-template-context
    return django.shortcuts.render(request, "page.html", locals())


def view_b(request):
    name = "alice"
    tpl = django.template.Template("hello")
    # ruleid: locals-as-template-context
    return django.template.Template.render(tpl, locals())


def view_c(request):
    name = "alice"
    # ruleid: locals-as-template-context
    return django.shortcuts.render(request, "other.html", locals())


def view_fixed(request):
    # ok: locals-as-template-context
    return django.shortcuts.redirect("/home/")


def view_plain(request):
    # ok: locals-as-template-context
    x = 1
    return x


def view_other(request):
    # ok: locals-as-template-context
    return "alice"
