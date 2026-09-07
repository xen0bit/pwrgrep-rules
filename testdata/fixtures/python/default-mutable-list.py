# A [] default mutated in place is shared across calls: later callers
# see earlier callers' items. Flag mutations of a list default with no
# copy in the file; read-only use is fine.
def add_item(items=[], value=None):
    # ruleid: default-mutable-list
    items.append(value)
    return items


def add_many(items=[], values=None):
    # ruleid: default-mutable-list
    items.extend(values)
    return items


def add_first(items=[], value=None):
    # ruleid: default-mutable-list
    items.insert(0, value)
    return items


def count_items(items=[]):
    # ok: default-mutable-list
    return len(items)


def first_item(items=[]):
    # ok: default-mutable-list
    return items[0] if items else None


def has_item(items=[], value=None):
    # ok: default-mutable-list
    return value in items
