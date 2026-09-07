# open() without encoding uses the locale default: the same file reads
# differently on two machines. Flag encoding-less opens; passing
# encoding (or binary mode) is the fix.
def flag_bare(path):
    # ruleid: unspecified-open-encoding
    handle = open(path)
    return handle.read()


def flag_text(path):
    # ruleid: unspecified-open-encoding
    handle = open(path, "r")
    return handle.read()


def flag_write(path):
    # ruleid: unspecified-open-encoding
    handle = open(path, "w")
    return handle.read()


def safe_encoding(path):
    # ok: unspecified-open-encoding
    handle = open(path, encoding="utf-8")
    return handle.read()


def safe_binary(path):
    # ok: unspecified-open-encoding
    handle = open(path, "rb")
    return handle.read()


def safe_both(path):
    # ok: unspecified-open-encoding
    handle = open(path, "r", encoding="utf-8")
    return handle.read()
