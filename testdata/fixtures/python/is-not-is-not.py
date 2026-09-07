# `X is (not ...)` compares identity with a freshly built bool, which
# is never what `X is not ...` means. Flag the parenthesised form;
# `is not` is the fix.
def flag_paren(a, b, c):
    # ruleid: is-not-is-not
    same = a is (not b)
    # ruleid: is-not-is-not
    same = b is (not c)
    # ruleid: is-not-is-not
    return a is (not c)


def safe_is_not(a, b, c):
    # ok: is-not-is-not
    same = a is not b
    # ok: is-not-is-not
    same = b is not c
    # ok: is-not-is-not
    return a is not c
