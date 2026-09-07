# A {} default mutated in place is shared across calls: later callers
# see earlier callers' keys. Flag mutations of a dict default with no
# copy in the file; read-only use is fine.
def add_user(mapping={}, key=None):
    # ruleid: default-mutable-dict
    mapping.setdefault(key, [])
    return mapping


def put_all(mapping={}, values=None):
    # ruleid: default-mutable-dict
    mapping.update(values)
    return mapping


def set_name(mapping={}, key=None):
    # ruleid: default-mutable-dict
    mapping[key] = True
    return mapping


def count_keys(mapping={}):
    # ok: default-mutable-dict
    return len(mapping)


def has_key(mapping={}, key=None):
    # ok: default-mutable-dict
    return key in mapping


def keys_of(mapping={}):
    # ok: default-mutable-dict
    return list(mapping)
