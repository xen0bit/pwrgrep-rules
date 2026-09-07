# Django mass assignment from request data.
#
# Expanding the whole request dict into create()/update() lets the caller
# set fields never shown on the form (e.g. is_staff). Naming each field
# is the fix, and its create line is the ok.
import django.db.models


class Account(django.db.models.Model):
    pass


def view_a(request):
    # ruleid: mass-assignment
    user = Account.objects.create(**request.POST)
    return user


def view_b(request):
    # ruleid: mass-assignment
    user = Account.objects.create(**request.GET)
    return user


def view_c(request):
    user = Account.objects.get(name="alice")
    # ruleid: mass-assignment
    user.update(**request.POST)
    user.save()
    return user


def view_fixed(request):
    # ok: mass-assignment
    user = Account.objects.create(name=request.POST.get("name"))
    return user


def view_fixed_two(request):
    # ok: mass-assignment
    user = Account.objects.create(name="alice")
    return user


def view_plain(request):
    # ok: mass-assignment
    user = Account.objects.get(name="alice")
    return user
