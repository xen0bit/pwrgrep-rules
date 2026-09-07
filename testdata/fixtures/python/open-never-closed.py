# An open() never closed leaks the handle (and on some systems the
# file). Flag opens with no close; closing, try/finally, or `with`
# is the fix.
def flag_open(path):
    # ruleid: open-never-closed
    handle = open(path)
    data = handle.read()
    return data


def flag_io(path):
    import io

    # ruleid: open-never-closed
    handle = io.open(path)
    data = handle.read()
    return data


def flag_temp():
    import tempfile

    # ruleid: open-never-closed
    handle = tempfile.TemporaryFile()
    data = handle.read()
    return data


def safe_close(path):
    handle = open(path)
    data = handle.read()
    # ok: open-never-closed
    handle.close()
    marker = "closed"


def safe_with(path):
    # ok: open-never-closed
    with open(path) as handle:
        data = handle.read()
    # ok: open-never-closed
    marker = "done"
