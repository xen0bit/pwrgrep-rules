# Django order_by(...)[0] instead of .earliest()/.latest().
#
# Slicing the first row off an ordered queryset spells earliest/latest
# indirectly. The finding lands on the subscript line.
from django.contrib.auth.models import User


def first_created():
    # ruleid: use-earliest-or-latest
    u = User.objects.order_by("created")[0]
    return u


def first_filtered():
    # ruleid: use-earliest-or-latest
    u = User.objects.filter(active=True).order_by("created")[0]
    return u


def last_login():
    # ruleid: use-earliest-or-latest
    u = User.objects.all().order_by("-last_login")[0]
    return u


def earliest():
    # ok: use-earliest-or-latest
    u = User.objects.earliest("created")
    return u


def latest():
    # ok: use-earliest-or-latest
    u = User.objects.latest("created")
    return u


def first_method():
    # ok: use-earliest-or-latest
    u = User.objects.order_by("created").first()
    return u
