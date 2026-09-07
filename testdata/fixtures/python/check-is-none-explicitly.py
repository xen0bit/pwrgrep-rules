# `x and x == 0` is always False: a falsy `x` short-circuits the `and`,
# and 0 itself is falsy, so the comparison never passes. Flag the plain
# and the `.get()`/subscript shapes; other comparisons are fine.
def flag_plain(x):
    # ruleid: check-is-none-explicitly
    return x and x == 0


def flag_getitem(data, key):
    # ruleid: check-is-none-explicitly
    return data.get(key) and data[key] == 0


def flag_branch(count):
    # ruleid: check-is-none-explicitly
    if count and count == 0:
        return "zero"
    return "other"


def safe_eq_zero(x):
    # ok: check-is-none-explicitly
    return x == 0


def safe_is_none(x):
    # ok: check-is-none-explicitly
    return x is None


def safe_other_value(x):
    # ok: check-is-none-explicitly
    return x and x == 1
