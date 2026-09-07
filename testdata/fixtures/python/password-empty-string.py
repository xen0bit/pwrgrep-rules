# Django set_password with the empty string.
#
# An empty password is no password; the account is left open. The match
# spans set_password through save, so the finding lands on the
# set_password line. A real password (or no save) is the ok.
import django.contrib.auth.models


def register_a(name):
    user = django.contrib.auth.models.User(username=name)
    # ruleid: password-empty-string
    user.set_password("")
    user.save()


def register_b(name):
    user = django.contrib.auth.models.User(username=name)
    # ruleid: password-empty-string
    user.set_password('')
    user.save()


def register_c(name, password):
    user = django.contrib.auth.models.User(username=name)
    # ruleid: password-empty-string
    pwd = ""
    user.set_password(pwd)
    user.save()


def register_real(name, password):
    user = django.contrib.auth.models.User(username=name)
    # ok: password-empty-string
    user.set_password(password)
    user.save()


def register_none(name):
    user = django.contrib.auth.models.User(username=name)
    # ok: password-empty-string
    user.set_password(None)
    user.save()


def register_plain(name):
    # ok: password-empty-string
    user = django.contrib.auth.models.User(username=name)
    user.save()
