# Django app reading os.environ instead of django-environ.
#
# Reading the process environment directly in a Django app bypasses the
# typed, defaulted access django-environ provides. The rule matches the
# whole span from the imports to the access, so all three findings land
# on the `import django` line that starts it; the annotations stack there.
# The fix is django-environ, which this file must not import (the rule
# only fires in files without `import environ`), so the ok cases avoid
# environ access instead.
# ruleid: use-django-environ
# ruleid: use-django-environ
# ruleid: use-django-environ
import django
import os

FOO = os.environ["FOO"]
BAR = os.environ["BAR"]
BAZ = os.environ["BAZ"]


def use_getenv():
    # ok: use-django-environ
    val = os.getenv("FOO")


def use_plain():
    # ok: use-django-environ
    val = "constant"


def use_django():
    # ok: use-django-environ
    name = django.get_version()
