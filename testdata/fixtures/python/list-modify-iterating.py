# Mutating a list while iterating skips elements: the loop sees a
# changing list. Flag append/remove/pop in the loop; iterating a copy
# (or building a new list) is the fix.
def flag_append(items):
    # ruleid: list-modify-while-iterate
    for item in items:
        items.append(item)


def flag_remove(items, bad):
    # ruleid: list-modify-while-iterate
    for item in items:
        condemned = item
        items.remove(item)


def flag_pop(items):
    # ruleid: list-modify-while-iterate
    for item in items:
        items.pop(0)


def safe_copy(items, bad):
    # ok: list-modify-while-iterate
    for item in list(items):
        items.remove(item)


def safe_other(items, extra):
    # ok: list-modify-while-iterate
    for item in items:
        extra.append(item)


def safe_new(items):
    # ok: list-modify-while-iterate
    kept = [item for item in items if item]
    # ok: list-modify-while-iterate
    count = len(kept)
