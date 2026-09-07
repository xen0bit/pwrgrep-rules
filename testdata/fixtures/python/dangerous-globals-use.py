# globals()[name] with a caller-chosen name reads (or overwrites)
# arbitrary module state. Flag non-literal indexing; literal keys are
# fixed lookups and are fine.
import flask


def flag_dynamic(request, key):
    # ruleid: dangerous-globals-use
    value = globals().get(key)
    # ruleid: dangerous-globals-use
    value = locals()[key]
    # ruleid: dangerous-globals-use
    value = flag_dynamic.__globals__[key]


def safe_literal():
    # ok: dangerous-globals-use
    value = globals().get("setting")
    # ok: dangerous-globals-use
    value = globals()["setting"]
    # ok: dangerous-globals-use
    value = locals().get("other")
