"""useless-literal: the same mapping key assigned twice.

A dict display or dict() call binding one key twice is reported; distinct
keys are not. Only adjacent duplicate pairs have a reading, so the
fixture keeps the duplicates adjacent.
"""


def show():
    # ruleid: useless-literal
    d = {"alpha": 1, "alpha": 2}
    # ruleid: useless-literal
    e = dict((("beta", 1), ("beta", 2)))
    # ok: useless-literal
    f = {"alpha": 1, "beta": 2}
    # ok: useless-literal
    g = dict((("alpha", 1), ("beta", 2)))
    return d, e, f, g
