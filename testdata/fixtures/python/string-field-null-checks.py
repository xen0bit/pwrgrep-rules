# Django string field with null=True (first id: no-null-string-field).
#
# NULL and the empty string are two ways of saying "no value" for text,
# so null=True on CharField/TextField is banned. This fixture covers the
# first id only; the sibling id (unique+blank without null) is a separate
# spelling of the same cleanup and shares this rule.
import django.db.models


class A(django.db.models.Model):
    # ruleid: no-null-string-field
    name = django.db.models.CharField(max_length=100, null=True)


class B(django.db.models.Model):
    # ruleid: no-null-string-field
    bio = django.db.models.TextField(null=True)


class C(django.db.models.Model):
    # ruleid: no-null-string-field
    title = django.db.models.CharField(max_length=50, null=True, blank=True)


class Plain(django.db.models.Model):
    # ok: no-null-string-field
    name = django.db.models.CharField(max_length=100)


class UniquePlain(django.db.models.Model):
    # ok: no-null-string-field
    code = django.db.models.CharField(max_length=10, unique=True)


class NonText(django.db.models.Model):
    # ok: no-null-string-field
    count = django.db.models.IntegerField(null=True)
