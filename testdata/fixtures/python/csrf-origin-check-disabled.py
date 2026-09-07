# Pyramid view with CSRF origin check disabled.
#
# check_origin=False skips the referrer check for the token. The finding
# lands on the decorator line. True (or no flag) is the ok.
from pyramid.view import view_config


# ruleid: pyramid-csrf-origin-check-disabled
@view_config(route_name="transfer", check_origin=False)
def transfer(request):
    return {}


# ruleid: pyramid-csrf-origin-check-disabled
@view_config(route_name="update", check_origin=False)
def update(request):
    return {}


# ruleid: pyramid-csrf-origin-check-disabled
@view_config(route_name="delete", check_origin=False)
def delete(request):
    return {}


# ok: pyramid-csrf-origin-check-disabled
@view_config(route_name="safe", check_origin=True)
def safe(request):
    return {}


# ok: pyramid-csrf-origin-check-disabled
@view_config(route_name="plain")
def plain(request):
    return {}


# ok: pyramid-csrf-origin-check-disabled
def helper():
    return {}
