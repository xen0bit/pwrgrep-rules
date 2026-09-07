# `obj.is_ready` without () is the method object (always truthy), not
# the check. Flag is_* attribute reads that are never called; calling
# them (or other attributes) is fine.
def flag_nocall(user, items):
    # ruleid: is-function-without-parentheses
    ready = user.is_ready
    # ruleid: is-function-without-parentheses
    valid = items.is_valid
    # ruleid: is-function-without-parentheses
    empty = items.is_empty


def safe_called(user, items):
    # ok: is-function-without-parentheses
    ready = user.is_ready()
    # ok: is-function-without-parentheses
    valid = items.is_valid(True)
    # ok: is-function-without-parentheses
    name = user.name
