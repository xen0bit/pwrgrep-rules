# Jinja2 autoescape off renders {{ name }} raw: caller HTML becomes
# page HTML (XSS). Flag autoescape=False; True or select_autoescape
# is the fix.
import jinja2


def flag_disabled(loader):
    # ruleid: incorrect-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=False)
    # ruleid: incorrect-autoescape-disabled
    env = jinja2.Environment(autoescape=False)
    # ruleid: incorrect-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=False, undefined=None)


def safe_enabled(loader):
    # ok: incorrect-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=True)
    # ok: incorrect-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=jinja2.select_autoescape(["html"]))
    # ok: incorrect-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=True, undefined=None)
