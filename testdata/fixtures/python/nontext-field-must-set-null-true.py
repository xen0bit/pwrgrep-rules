# Django non-text field with blank=True but no null=True.
#
# For non-text fields blank=True without null=True stores the empty value
# inconsistently. Text fields are excluded by construction, as is the
# pair null=True with blank=True. The finding lands on the field line.
import django.db.models


class Event(django.db.models.Model):
    # ruleid: nontext-field-must-set-null-true
    when = django.db.models.DateTimeField(blank=True)


class Ticket(django.db.models.Model):
    # ruleid: nontext-field-must-set-null-true
    count = django.db.models.IntegerField(blank=True)


class Flag(django.db.models.Model):
    # ruleid: nontext-field-must-set-null-true
    active = django.db.models.BooleanField(blank=True)


class Label(django.db.models.Model):
    # ok: nontext-field-must-set-null-true
    name = django.db.models.CharField(max_length=100, blank=True)


class Timed(django.db.models.Model):
    # ok: nontext-field-must-set-null-true
    when = django.db.models.DateTimeField(null=True, blank=True)


class Bare(django.db.models.Model):
    # ok: nontext-field-must-set-null-true
    when = django.db.models.DateTimeField()
