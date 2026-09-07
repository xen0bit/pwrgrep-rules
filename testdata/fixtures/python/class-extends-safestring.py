# Django classes extending SafeString/SafeText/SafeData.
#
# Subclassing the safe-string markers opts the value out of escaping
# everywhere it renders. The finding lands on the class line.
import django.utils.safestring


# ruleid: class-extends-safestring
class Fragment(django.utils.safestring.SafeString):
    pass


# ruleid: class-extends-safestring
class Text(django.utils.safestring.SafeText):
    pass


# ruleid: class-extends-safestring
class Data(django.utils.safestring.SafeData):
    pass


# ok: class-extends-safestring
class Plain:
    pass


# ok: class-extends-safestring
class Item:
    def render(self):
        return "x"


# ok: class-extends-safestring
class MyError(Exception):
    pass
