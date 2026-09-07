# Django model overriding save without calling super().save().
#
# Skipping the super call silently drops the row write (and any mixin
# behaviour). The finding lands on the `def save` line that starts the
# match; the fix spells super().save() and its def line is the ok.
import django.db.models


class Item(django.db.models.Model):
    # ruleid: django-db-model-save-super
    def save(self, *args, **kwargs):
        self.slug = "item"


class Order(django.db.models.Model):
    # ruleid: django-db-model-save-super
    def save(self):
        self.total = 0


class Plain(django.db.models.Model):
    value = 1


class Fixed(django.db.models.Model):
    # ok: django-db-model-save-super
    def save(self, *args, **kwargs):
        self.slug = "fixed"
        super().save(*args, **kwargs)


class FixedOld(django.db.models.Model):
    # ok: django-db-model-save-super
    def save(self, *args, **kwargs):
        self.slug = "fixed"
        super(FixedOld, self).save(*args, **kwargs)


class NoSave(django.db.models.Model):
    # ok: django-db-model-save-super
    name = django.db.models.CharField(max_length=100)
