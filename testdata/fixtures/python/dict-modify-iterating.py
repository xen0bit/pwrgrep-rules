# Deleting dict entries while iterating skips items (or raises):
# the loop sees a changing dict. Flag del-in-loop; a list() copy (or
# collecting keys first) is the fix.
def flag_items(mapping):
    # ruleid: dict-del-while-iterate
    for key, value in mapping.items():
        del mapping[key]


def flag_keys(mapping):
    # ruleid: dict-del-while-iterate
    for key in mapping.keys():
        del mapping[key]


def flag_items_del(mapping):
    # ruleid: dict-del-while-iterate
    for key, value in mapping.items():
        seen = value
        del mapping[key]


def safe_copy(mapping):
    # ok: dict-del-while-iterate
    for key, value in list(mapping.items()):
        del mapping[key]


def safe_keys(mapping, drop):
    # ok: dict-del-while-iterate
    for key in [k for k in mapping.keys() if k in drop]:
        del mapping[key]


def safe_collect(mapping):
    gone = [k for k, v in mapping.items() if v is None]
    # ok: dict-del-while-iterate
    removed = len(gone)
