# `is` checks identity: two equal variables can still be different
# objects. Flag `x is x` (only the first id, identical-is-comparison,
# is annotated); None/singleton checks are the intended use.
def flag_identical(a, b):
    # ruleid: identical-is-comparison
    same = a is a
    # ruleid: identical-is-comparison
    same = b is b
    # ruleid: identical-is-comparison
    return a is a


def safe_distinct(a, b):
    # ok: identical-is-comparison
    same = a is b
    # ok: identical-is-comparison
    same = a is None
    # ok: identical-is-comparison
    same = type(a) is type(b)
