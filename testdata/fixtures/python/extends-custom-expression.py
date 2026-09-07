# Django classes extending custom ORM expressions.
#
# Subclassing Func/Expression/Value and friends drops to raw SQL, where
# the ORM's quoting no longer applies. The finding lands on the class
# line.
import django.db.models


# ruleid: extends-custom-expression
class MyFunc(django.db.models.Func):
    pass


# ruleid: extends-custom-expression
class MyExpr(django.db.models.Expression):
    pass


# ruleid: extends-custom-expression
class MyValue(django.db.models.Value):
    pass


# ok: extends-custom-expression
class Plain:
    pass


# ok: extends-custom-expression
class Item(django.db.models.Model):
    pass


# ok: extends-custom-expression
class MyError(Exception):
    pass
