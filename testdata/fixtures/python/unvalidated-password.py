# Django set_password without validate_password (not taint: no value
# is followed; the question is whether the guard call is in the file).
# The guard test is file-level (in_files_without), so this fixture cannot
# contain validate_password anywhere: the guarded fix is unshowable here
# and the oks are the sibling exclusion (UserModel) and code that sets no
# password at all.
import django.contrib.auth.models
from django.contrib.auth.models import UserModel


def register_a(name, password):
    user = django.contrib.auth.models.User(username=name)
    # ruleid: unvalidated-password
    user.set_password(password)
    user.save()


def register_b(name, password):
    user = django.contrib.auth.models.User(username=name)
    # ruleid: unvalidated-password
    user.set_password(password.strip())
    user.save()


def register_c(name, password):
    account = django.contrib.auth.models.User(username=name)
    # ruleid: unvalidated-password
    account.set_password(password)
    account.save()


def make_usermodel(password):
    # ok: unvalidated-password
    UserModel().set_password(password)


def lookup(name):
    # ok: unvalidated-password
    user = django.contrib.auth.models.User.objects.get(username=name)
    return user


def plain(name):
    # ok: unvalidated-password
    user = django.contrib.auth.models.User(username=name)
    user.save()
