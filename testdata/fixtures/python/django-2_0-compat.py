# Django 2.0 removals: weak argument to Signal.disconnect.
#
# This fixture covers the first id of the five this rule reports
# (django-compat-2_0-signals-weak); the other four ids are sibling
# spellings of the same Django 2.0 cleanup and share this rule.
import django.dispatch.signals


def disconnect_old(receiver):
    # ruleid: django-compat-2_0-signals-weak
    django.dispatch.signals.Signal.disconnect(receiver, weak=True)


def disconnect_old_false(receiver):
    # ruleid: django-compat-2_0-signals-weak
    django.dispatch.signals.Signal.disconnect(receiver, weak=False)


def disconnect_old_sender(sender, receiver):
    # ruleid: django-compat-2_0-signals-weak
    django.dispatch.signals.Signal.disconnect(sender, receiver, weak=True)


def disconnect_plain(receiver):
    # ok: django-compat-2_0-signals-weak
    django.dispatch.signals.Signal.disconnect(receiver)


def connect_signal(receiver):
    # ok: django-compat-2_0-signals-weak
    django.dispatch.signals.Signal.connect(receiver, weak=True)


def other_call(receiver):
    # ok: django-compat-2_0-signals-weak
    django.dispatch.signals.Signal.send(sender=None)
