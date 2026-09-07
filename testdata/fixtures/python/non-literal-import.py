# importlib.import_module with a computed name loads whatever module
# the caller chose. Flag non-literal names; a constant loads a fixed
# module.
import importlib


def flag_dynamic(name, mod):
    # ruleid: non-literal-import
    module = importlib.import_module(name)
    # ruleid: non-literal-import
    module = importlib.import_module(mod)
    # ruleid: non-literal-import
    module = importlib.import_module("pkg." + name)


def safe_literal():
    # ok: non-literal-import
    module = importlib.import_module("os")
    # ok: non-literal-import
    module = importlib.import_module("json")
    # ok: non-literal-import
    module = importlib.import_module("pkg.plugin")
