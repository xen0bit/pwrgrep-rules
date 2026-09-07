# Pyramid global CSRF origin check disabled.
#
# Setting check_origin=False in set_default_csrf_options drops the
# referrer check everywhere. The finding lands on the call line. True
# is the ok.
import pyramid.config


def includeme(config):
    # ruleid: pyramid-csrf-origin-check-disabled-globally
    config.set_default_csrf_options(check_origin=False)


def setup_a(config):
    # ruleid: pyramid-csrf-origin-check-disabled-globally
    config.set_default_csrf_options(require_csrf=True, check_origin=False)


def setup_b(config):
    # ruleid: pyramid-csrf-origin-check-disabled-globally
    config.set_default_csrf_options(check_origin=False, require_csrf=True)


def fixed(config):
    # ok: pyramid-csrf-origin-check-disabled-globally
    config.set_default_csrf_options(check_origin=True)


def plain(config):
    # ok: pyramid-csrf-origin-check-disabled-globally
    config.set_default_csrf_options(require_csrf=True)


def helper():
    # ok: pyramid-csrf-origin-check-disabled-globally
    return {}
