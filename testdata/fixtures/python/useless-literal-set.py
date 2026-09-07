# A duplicate set element is dead weight (and usually a typo).
# Flag it; distinct elements are fine.
def flag_dup():
    # ruleid: useless-literal-set
    items = set((1, "a"), (1, "b"))
    # ruleid: useless-literal-set
    items = set((2, "a"), (2, "b"), (3, "c"))
    # ruleid: useless-literal-set
    items = set((4, "a"), (4, "a"))


def safe_distinct():
    # ok: useless-literal-set
    items = {(1, "a"), (2, "b")}
    # ok: useless-literal-set
    items = set([(1, "a")])
    # ok: useless-literal-set
    items = set()
