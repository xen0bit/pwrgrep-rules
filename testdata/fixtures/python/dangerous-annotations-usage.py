# typing.get_type_hints evaluates string annotations as code in the
# class namespace. Flag computed (non-literal, non-typing) annotation
# values; literals, builtins and typing forms are fine.
import typing


def flag_dynamic(hint):
    # ruleid: dangerous-annotations-usage
    MyClass.__annotations__["field"] = hint
    # ruleid: dangerous-annotations-usage
    MyClass.__annotations__["other"] = get_hint()
    # ruleid: dangerous-annotations-usage
    MyClass.__annotations__["third"] = module.Custom


def safe_static():
    # ok: dangerous-annotations-usage
    MyClass.__annotations__["a"] = "int"
    # ok: dangerous-annotations-usage
    MyClass.__annotations__["b"] = int
    # ok: dangerous-annotations-usage
    MyClass.__annotations__["c"] = typing.List
