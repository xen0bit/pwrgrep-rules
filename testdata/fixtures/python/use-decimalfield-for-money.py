# Django FloatField holding money (should be DecimalField).
#
# Binary floating point cannot represent most decimal fractions, so money
# in a FloatField drifts. The rule asks the field's name: price, amount,
# total and kin are money. The finding lands on the field line.
import django.db.models


class Product(django.db.models.Model):
    # ruleid: use-decimalfield-for-money
    price = django.db.models.FloatField()


class Cart(django.db.models.Model):
    # ruleid: use-decimalfield-for-money
    amount = django.db.models.FloatField()


class Invoice(django.db.models.Model):
    # ruleid: use-decimalfield-for-money
    subtotal = django.db.models.FloatField()


class Priced(django.db.models.Model):
    # ok: use-decimalfield-for-money
    price = django.db.models.DecimalField(max_digits=10, decimal_places=2)


class Rated(django.db.models.Model):
    # ok: use-decimalfield-for-money
    rating = django.db.models.FloatField()


class Weighed(django.db.models.Model):
    # ok: use-decimalfield-for-money
    weight = django.db.models.FloatField()
