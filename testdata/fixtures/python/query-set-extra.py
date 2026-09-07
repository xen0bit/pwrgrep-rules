# Django QuerySet.extra with caller-controlled SQL.
#
# extra() splices its arguments into SQL without safeguards. A literal
# select dict is excluded; anything else is the finding, which lands on
# the extra call line.
import django.db.models


class MyModel(django.db.models.Model):
    pass


def view_a(where):
    # ruleid: avoid-query-set-extra
    qs = MyModel.objects.extra(where=[where])
    return qs


def view_b(tables):
    # ruleid: avoid-query-set-extra
    qs = MyModel.objects.extra(tables=[tables])
    return qs


def view_c(order):
    # ruleid: avoid-query-set-extra
    qs = MyModel.objects.extra(order_by=[order])
    return qs


def view_literal():
    # ok: avoid-query-set-extra
    qs = MyModel.objects.extra(select={"total": "count(*)"})
    return qs


def view_filter(name):
    # ok: avoid-query-set-extra
    qs = MyModel.objects.filter(name=name)
    return qs


def plain():
    # ok: avoid-query-set-extra
    qs = MyModel.objects.all()
    return qs
