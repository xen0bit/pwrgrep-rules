# Django empty-string password default that reaches set_password.
#
# A default of "" becomes the account's password whenever the caller
# omits it. The rule focuses the "" literal, so each finding lands on
# its request line. Only the request.get-with-default shape fires: the
# def-parameter-default alternative matches nothing as written, so all
# three cases use request defaults. None (unusable password) is the fix.
import django.contrib.auth.models


def register_a(request):
    user = django.contrib.auth.models.User(username="x")
    # ruleid: use-none-for-password-default
    password = request.POST.get("password", "")
    user.set_password(password)
    user.save()


def register_b(request):
    user = django.contrib.auth.models.User(username="x")
    # ruleid: use-none-for-password-default
    password = request.GET.get("password", "")
    user.set_password(password)
    user.save()


def register_c(request):
    user = django.contrib.auth.models.User(username="x")
    # ruleid: use-none-for-password-default
    passwd = request.POST.get("passwd", "")
    user.set_password(passwd)
    user.save()


def register_fixed(request):
    user = django.contrib.auth.models.User(username="x")
    # ok: use-none-for-password-default
    password = request.POST.get("password")
    user.set_password(password)
    user.save()


def register_none(request):
    user = django.contrib.auth.models.User(username="x")
    # ok: use-none-for-password-default
    password = request.POST.get("password", None)
    user.set_password(password)
    user.save()


def register_plain(name):
    # ok: use-none-for-password-default
    user = django.contrib.auth.models.User(username=name)
    user.save()
