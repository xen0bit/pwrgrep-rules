# Django html_safe decorator and calls.
#
# html_safe adds __html__ to the class, opting its rendering out of
# escaping. The finding lands on the decorator (or call) line.
import django.utils.html


# ruleid: html-safe
@django.utils.html.html_safe
class Fragment(object):
    pass


# ruleid: html-safe
@django.utils.html.html_safe
class Badge(object):
    pass


def make(value):
    # ruleid: html-safe
    return django.utils.html.html_safe(value)


class Plain(object):
    # ok: html-safe
    pass


class Other(object):
    # ok: html-safe
    def render(self):
        return "x"


def plain():
    # ok: html-safe
    return "x"
