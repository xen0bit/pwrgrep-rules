# `x == x` is always true (and `x != x` always false, NaN aside):
# usually a copy-paste slip. Flag self-comparison; comparing two
# different values (or asserting) is fine.
def flag_self(a, b):
    # ruleid: useless-eqeq
    same = a == a
    # ruleid: useless-eqeq
    same = b != b
    # ruleid: useless-eqeq
    return a == a


def safe_other(a, b):
    # ok: useless-eqeq
    same = a == b
    # ok: useless-eqeq
    same = a != b
    # ok: useless-eqeq
    assert a == b
