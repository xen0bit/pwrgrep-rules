# Django ForeignKey(unique=True) that should be a OneToOneField.
#
# A foreign key constrained unique is a one-to-one relation spelled
# indirectly; OneToOneField says it directly and gives the reverse
# accessor. The finding lands on the field assignment line.
import django.db.models


class Profile(django.db.models.Model):
    # ruleid: use-onetoonefield
    user = django.db.models.ForeignKey("auth.User", unique=True, on_delete=django.db.models.CASCADE)


class Membership(django.db.models.Model):
    # ruleid: use-onetoonefield
    member = django.db.models.ForeignKey("auth.User", unique=True)


class Seat(django.db.models.Model):
    # ruleid: use-onetoonefield
    occupant = django.db.models.ForeignKey("auth.User", unique=True, null=True)


class PlainLink(django.db.models.Model):
    # ok: use-onetoonefield
    user = django.db.models.ForeignKey("auth.User", on_delete=django.db.models.CASCADE)


class Direct(django.db.models.Model):
    # ok: use-onetoonefield
    user = django.db.models.OneToOneField("auth.User", on_delete=django.db.models.CASCADE)


class NonUnique(django.db.models.Model):
    # ok: use-onetoonefield
    user = django.db.models.ForeignKey("auth.User", unique=False, on_delete=django.db.models.CASCADE)
