# Mako has no global autoescaping: ${name} renders raw HTML (XSS).
# Flag mako.template.Template; engines with escaping are the fix.
import mako.template


def flag_mako():
    # ruleid: mako-templates-detected
    t = mako.template.Template("Hello ${name}")
    # ruleid: mako-templates-detected
    t = mako.template.Template(filename="page.html")
    # ruleid: mako-templates-detected
    t = mako.template.Template(text, input_encoding="utf-8")


def safe_other():
    # ok: mako-templates-detected
    t = string.Template("Hello $name")
    # ok: mako-templates-detected
    t = jinja2.Template("Hello {{ name }}")
    # ok: mako-templates-detected
    t = mako.lookup.TemplateLookup(directories=["/templates"])
