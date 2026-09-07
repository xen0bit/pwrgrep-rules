# Django raw()/RawSQL with non-literal queries.
#
# raw and RawSQL execute SQL the ORM does not quote; a literal query has
# nothing injected into it and is excluded. The finding lands on the call
# line.
import django.db.models
import django.db.models.expressions


class MyModel(django.db.models.Model):
    pass


def view_a(query):
    # ruleid: avoid-raw-sql
    rows = MyModel.objects.raw(query)
    return rows


def view_b(query):
    # ruleid: avoid-raw-sql
    rows = MyModel.objects.raw(query, [])
    return rows


def view_c(query):
    # ruleid: avoid-raw-sql
    expr = django.db.models.expressions.RawSQL(query, [])
    return expr


def view_literal():
    # ok: avoid-raw-sql
    rows = MyModel.objects.raw("SELECT * FROM app_mymodel")
    return rows


def view_raw_literal():
    # ok: avoid-raw-sql
    expr = django.db.models.expressions.RawSQL("SELECT 1")
    return expr


def view_filter(name):
    # ok: avoid-raw-sql
    qs = MyModel.objects.filter(name=name)
    return qs
