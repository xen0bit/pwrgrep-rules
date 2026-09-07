# Django request.POST used after form.is_valid() instead of cleaned_data.
#
# After is_valid the sanitized values live on form.cleaned_data; reading
# request.POST again takes the raw input. The finding lands on the
# request.POST line inside the is_valid block.
import django.forms


class NameForm(django.forms.Form):
    pass


def view_a(request):
    form = NameForm(request.POST)
    if form.is_valid():
        # ruleid: django-using-request-post-after-is-valid
        name = request.POST.get("name")
        return name


def view_b(request):
    form = NameForm(request.POST)
    if form.is_valid():
        # ruleid: django-using-request-post-after-is-valid
        age = request.POST["age"]
        return age


def view_c(request):
    form = NameForm(request.POST)
    if form.is_valid():
        # ruleid: django-using-request-post-after-is-valid
        city = request.POST.get("city", "")
        return city


def view_fixed(request):
    form = NameForm(request.POST)
    if form.is_valid():
        # ok: django-using-request-post-after-is-valid
        name = form.cleaned_data["name"]
        return name


def view_outside(request):
    # ok: django-using-request-post-after-is-valid
    name = request.POST.get("name")
    return name


def view_get(request):
    form = NameForm(request.GET)
    if form.is_valid():
        # ok: django-using-request-post-after-is-valid
        name = request.GET.get("name")
        return name
