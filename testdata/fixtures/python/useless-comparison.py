# A non-empty string is always truthy: `if "x"` never branches on
# data. Flag strings as conditions; real booleans are the fix.
def flag_literal(flag):
    # ruleid: no-strings-as-booleans
    if "debug":
        print(1)
    # ruleid: no-strings-as-booleans
    if "yes" and flag:
        print(2)
    # ruleid: no-strings-as-booleans
    if "no" or flag:
        print(3)


def safe_bool(flag, name):
    # ok: no-strings-as-booleans
    if flag:
        print(1)
    # ok: no-strings-as-booleans
    if name in "abc":
        print(2)
    # ok: no-strings-as-booleans
    if flag and name:
        print(3)
