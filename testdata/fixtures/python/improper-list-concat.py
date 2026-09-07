# `[a] + [b] if c else [d]` parses as `([a] + [b]) if c else [d]`...
# but reads as `[a] + ([b] if c else [d])`: the else-branch replaces the
# whole concat when c is false. Flag it; unconditional concats (and
# plain ternaries) are fine.
def flag_concat(cond):
    # ruleid: improper-list-concat
    items = [1] + [2] if cond else [3]
    # ruleid: improper-list-concat
    items = ["a"] + ["b"] if cond else ["c"]
    # ruleid: improper-list-concat
    return [1] + [2] if cond else [3]


def safe_plain(cond, a, b):
    # ok: improper-list-concat
    items = [1] + [2]
    # ok: improper-list-concat
    choice = a if cond else b
    # ok: improper-list-concat
    items = [1, 2, 3]
