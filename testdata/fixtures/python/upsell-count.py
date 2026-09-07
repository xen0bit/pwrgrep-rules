# Django len() over a queryset instead of .count().
#
# len() materializes every row to count them; .count() counts in the
# database. The finding lands on the len() call line.
from django.contrib.auth.models import User


def count_all():
    # ruleid: use-count-method
    n = User.objects.all().len()
    return n


def count_filtered():
    # ruleid: use-count-method
    n = User.objects.filter(active=True).len()
    return n


def count_excluded():
    # ruleid: use-count-method
    n = User.objects.exclude(banned=True).len()
    return n


def count_method():
    # ok: use-count-method
    n = User.objects.all().count()
    return n


def len_list():
    # ok: use-count-method
    n = len([1, 2, 3])
    return n


def len_names():
    # ok: use-count-method
    n = len(["alice", "bob"])
    return n
