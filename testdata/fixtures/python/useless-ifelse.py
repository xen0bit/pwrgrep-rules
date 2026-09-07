# Checking the same condition twice means the elif is dead: the first
# branch already took it. Flag same-condition elif; different
# conditions (and different bodies) are fine. Only the first id,
# useless-if-conditional, is marked.
def flag_same(a):
    # ruleid: useless-if-conditional
    if a:
        take(a)
    elif a:
        drop(a)


def flag_same_again(a):
    # ruleid: useless-if-conditional
    if a > 1:
        take(a)
    elif a > 1:
        drop(a)


def flag_same_third(a, b):
    # ruleid: useless-if-conditional
    if a == b:
        take(a)
    elif a == b:
        drop(a)


def safe_other(a, b):
    # ok: useless-if-conditional
    if a:
        take(a)
    elif b:
        drop(b)


def safe_else(a):
    # ok: useless-if-conditional
    if a:
        take(a)
    else:
        drop(a)


def safe_plain(a):
    # ok: useless-if-conditional
    if a:
        take(a)
