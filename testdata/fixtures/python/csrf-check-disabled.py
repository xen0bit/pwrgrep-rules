# Pyramid view with CSRF check disabled.
#
# require_csrf=False removes the token check from the view. Per GUIDE
# this is not taint: the rule reads the decorator value, and the
# finding lands on the decorator line. True (or no flag) is the ok.
from pyramid.view import view_config


# ruleid: pyramid-csrf-check-disabled
@view_config(route_name="transfer", require_csrf=False)
def transfer(request):
    return {}


# ruleid: pyramid-csrf-check-disabled
@view_config(route_name="update", require_csrf=False)
def update(request):
    return {}


# ruleid: pyramid-csrf-check-disabled
@view_config(route_name="delete", require_csrf=False)
def delete(request):
    return {}


# ok: pyramid-csrf-check-disabled
@view_config(route_name="safe", require_csrf=True)
def safe(request):
    return {}


# ok: pyramid-csrf-check-disabled
@view_config(route_name="plain")
def plain(request):
    return {}


# ok: pyramid-csrf-check-disabled
def helper():
    return {}
