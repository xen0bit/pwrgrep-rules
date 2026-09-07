"""hardcoded-tmp-path: hard-coded /tmp paths in open().

open() on a literal /tmp/... path is reported; paths built at run time
and files outside /tmp are not.
"""

BASE = "/var/data/results.csv"


def write_tmp():
    # ruleid: hardcoded-tmp-path
    f = open("/tmp/results.csv", "w")
    return f


def read_tmp():
    # ruleid: hardcoded-tmp-path
    f = open("/tmp/input.txt")
    return f


def write_data(path):
    # ok: hardcoded-tmp-path
    f = open(path, "w")
    return f


def write_var():
    # ok: hardcoded-tmp-path
    f = open(BASE, "w")
    return f
