# Django extra query via item.user.id instead of item.user_id.
#
# Crossing the relation fetches the whole user row to read its key; the
# _id attribute is already on the row. Request users are excluded: they
# are the current user, not a foreign key walk. The finding lands on the
# attribute line.
from django.db import models


def view_a(item):
    # ruleid: access-foreign-keys
    uid = item.user.id
    return uid


def view_b(comment):
    # ruleid: access-foreign-keys
    uid = comment.user.id
    return uid


def view_c(photo):
    # ruleid: access-foreign-keys
    uid = photo.user.id
    return uid


def view_direct(item):
    # ok: access-foreign-keys
    uid = item.user_id
    return uid


def view_request(request):
    # ok: access-foreign-keys
    uid = request.user.id
    return uid


def view_self_request(self):
    # ok: access-foreign-keys
    uid = self.request.user.id
    return uid
