# A Jinja2 Environment without autoescape renders {{ name }} raw:
# caller HTML becomes page HTML (XSS). Flag the missing argument;
# passing autoescape explicitly is the fix.
import jinja2


def flag_missing(loader):
    # ruleid: missing-autoescape-disabled
    env = jinja2.Environment(loader=loader)
    # ruleid: missing-autoescape-disabled
    env = jinja2.Environment(loader)
    # ruleid: missing-autoescape-disabled
    env = jinja2.Environment(loader=loader, undefined=None)


def safe_explicit(loader):
    # ok: missing-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=True)
    # ok: missing-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=jinja2.select_autoescape(["html"]))
    # ok: missing-autoescape-disabled
    env = jinja2.Environment(loader=loader, autoescape=False)
