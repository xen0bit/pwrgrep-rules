# Pyramid global CSRF check disabled.
#
# Setting require_csrf=False in set_default_csrf_options drops the token
# check everywhere. The finding lands on the call line. True is the ok.
import pyramid.config


def includeme(config):
    # ruleid: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(require_csrf=False)


def setup_a(config):
    # ruleid: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(check_origin=True, require_csrf=False)


def setup_b(config):
    # ruleid: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(require_csrf=False, check_origin=True)


def fixed(config):
    # ok: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(require_csrf=True)


def plain(config):
    # ok: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(check_origin=True)


def helper():
    # ok: pyramid-csrf-check-disabled-globally
    return {}
