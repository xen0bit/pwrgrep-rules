# Django SECRET_KEY used as the Hashids salt.
#
# The secret key signs sessions and tokens; reusing it as a hash salt
# means a leaked hash oracle works against every use. A random per-use
# salt is the fix.
import django.conf.settings
import hashids


def make_a():
    # ruleid: hashids-with-django-secret
    h = hashids.Hashids(salt=django.conf.settings.SECRET_KEY)
    return h


def make_b():
    # ruleid: hashids-with-django-secret
    h = hashids.Hashids(django.conf.settings.SECRET_KEY)
    return h


def make_c(min_length):
    # ruleid: hashids-with-django-secret
    h = hashids.Hashids(salt=django.conf.settings.SECRET_KEY, min_length=min_length)
    return h


def make_random():
    # ok: hashids-with-django-secret
    h = hashids.Hashids(salt="random-salt-value")
    return h


def make_env(secret):
    # ok: hashids-with-django-secret
    h = hashids.Hashids(salt=secret)
    return h


def make_plain():
    # ok: hashids-with-django-secret
    h = hashids.Hashids()
    return h
