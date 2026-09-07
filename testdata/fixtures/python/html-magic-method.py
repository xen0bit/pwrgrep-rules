# Django classes defining __html__.
#
# __html__ tells the template engine the value is safe to render raw,
# opting out of escaping everywhere it is used. The finding lands on
# the method's def line.
class Fragment(object):
    # ruleid: html-magic-method
    def __html__(self):
        return "<b>x</b>"


class Badge(object):
    # ruleid: html-magic-method
    def __html__(self):
        return "<i>y</i>"


class Stamp(object):
    label = "s"

    # ruleid: html-magic-method
    def __html__(self):
        return "<u>z</u>"


class Plain(object):
    # ok: html-magic-method
    def render(self):
        return "<b>x</b>"


class Other(object):
    # ok: html-magic-method
    def __str__(self):
        return "x"


# ok: html-magic-method
def helper():
    return "<b>x</b>"
