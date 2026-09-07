# Reading f.name before flush/close races the writer: the file may
# not exist yet. Flag .name without a flush or close. The rule matches
# the .name statement itself, so the ok lines below read it bare after
# flushing or closing.
import tempfile


def flag_write():
    handle = tempfile.NamedTemporaryFile()
    handle.write(b"data")
    # ruleid: tempfile-without-flush
    path = handle.name


def flag_bare():
    handle = tempfile.NamedTemporaryFile()
    # ruleid: tempfile-without-flush
    path = handle.name


def flag_again():
    handle = tempfile.NamedTemporaryFile(suffix=".tmp")
    handle.write(b"more")
    # ruleid: tempfile-without-flush
    path = handle.name


def safe_flush():
    handle = tempfile.NamedTemporaryFile()
    handle.write(b"data")
    handle.flush()
    # ok: tempfile-without-flush
    handle.name


def safe_close():
    handle = tempfile.NamedTemporaryFile()
    handle.write(b"data")
    handle.close()
    # ok: tempfile-without-flush
    handle.name


def safe_nodelete():
    handle = tempfile.NamedTemporaryFile(delete=False)
    handle.close()
    # ok: tempfile-without-flush
    handle.name
