# Assigning the same key twice keeps only the last value: the first
# is dead. Flag double key assignment; distinct keys (and dicts) are
# fine.
def flag_double():
    # ruleid: useless-assignment-keyed
    config["a"] = 1
    config["a"] = 2
    # ruleid: useless-assignment-keyed
    config["b"] = 1
    config["b"] = 2
    # ruleid: useless-assignment-keyed
    config["c"]["d"] = 1
    config["c"]["d"] = 2


def safe_distinct():
    # ok: useless-assignment-keyed
    config["a"] = 1
    # ok: useless-assignment-keyed
    config["b"] = 2
    # ok: useless-assignment-keyed
    other["a"] = 3
