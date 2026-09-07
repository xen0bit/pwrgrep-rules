# Rebinding a file handle without closing leaks the first file (and
# on Windows locks it). Flag open-over-open; closing (or `with`) first
# is the fix.
def flag_reopen(first, second):
    # ruleid: file-object-redefined-before-close
    handle = open(first)
    handle = open(second)


def flag_reopen_mode(first, second):
    # ruleid: file-object-redefined-before-close
    handle = open(first, "r")
    handle = open(second, "w")


def flag_reopen_again(first, second):
    # ruleid: file-object-redefined-before-close
    handle = open(first)
    handle = open(second)


def safe_close(first, second):
    # ok: file-object-redefined-before-close
    handle = open(first)
    handle.close()
    handle = open(second)


def safe_with(first, second):
    # ok: file-object-redefined-before-close
    with open(first) as handle:
        data = handle.read()
    # ok: file-object-redefined-before-close
    handle = open(second)
