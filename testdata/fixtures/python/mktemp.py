# tempfile.mktemp is a TOCTOU race: the name can be taken between the
# check and the use. Flag it; NamedTemporaryFile is the fix.
import tempfile


def flag_mktemp():
    # ruleid: tempfile-insecure
    path = tempfile.mktemp()
    # ruleid: tempfile-insecure
    path = tempfile.mktemp(suffix=".tmp")
    # ruleid: tempfile-insecure
    path = tempfile.mktemp(prefix="work")


def safe_named():
    # ok: tempfile-insecure
    handle = tempfile.NamedTemporaryFile()
    # ok: tempfile-insecure
    handle = tempfile.NamedTemporaryFile(suffix=".tmp")
    # ok: tempfile-insecure
    handle = tempfile.NamedTemporaryFile(delete=False)
