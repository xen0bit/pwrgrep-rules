"""attr-mutable-initializer: mutable class-level default in attrs classes.

A mutable initializer (`[]`, `{}`, ...) at class level under
@attr.s(auto_attribs=True) or @attrs.define is reported; the same
initializers inside functions, or immutable ones, are not.
"""
import attr
import attrs


@attr.s(auto_attribs=True)
class Point(object):
    # ruleid: attr-mutable-initializer
    x = []
    # ruleid: attr-mutable-initializer
    y = {}


@attrs.define
class Frozen(object):
    # ruleid: attr-mutable-initializer
    tags = []
    # ok: attr-mutable-initializer
    name = "point"


def make():
    # ok: attr-mutable-initializer
    tmp = []
    return tmp
