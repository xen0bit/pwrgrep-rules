# importlib.source_hash arrived in 3.7: calling it breaks older
# Pythons. Flag it; older importlib helpers are fine. Only the first id,
# python37-compatibility-importlib, is marked (no other 3.7-only calls
# appear: those report under sibling ids).
import importlib


def flag_hash(path):
    # ruleid: python37-compatibility-importlib
    digest = importlib.source_hash()
    # ruleid: python37-compatibility-importlib
    return importlib.source_hash()
    # ruleid: python37-compatibility-importlib
    print(importlib.source_hash())


def safe_importlib(mod):
    # ok: python37-compatibility-importlib
    importlib.reload(mod)
    # ok: python37-compatibility-importlib
    importlib.invalidate_caches()
    # ok: python37-compatibility-importlib
    return importlib.import_module("json")
