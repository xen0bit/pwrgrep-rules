# Building a defaultdict by hand (setdefault/if-missing) is verbose
# and slow. Flag the manual dict-of-dict shapes; collections.defaultdict
# (or plain dict code) is the fix. Only the first id,
# manual-defaultdict-dict-create, is marked. Findings land on the
# `grouped = {}` line that opens each shape.
import collections


def flag_setdefault(other):
    # ruleid: manual-defaultdict-dict-create
    grouped = {}
    for key, value in other.items():
        grouped.setdefault(key, {}).update(value)
    return grouped


def flag_missing(other):
    # ruleid: manual-defaultdict-dict-create
    grouped = {}
    for key, value in other.items():
        if key not in grouped:
            grouped[key] = {}
        grouped[key].update(value)
    return grouped


def flag_setdefault_again(other):
    # ruleid: manual-defaultdict-dict-create
    grouped = {}
    for key, value in other.items():
        grouped.setdefault(key, {}).update(value)
    return len(grouped)


def safe_defaultdict(other):
    # ok: manual-defaultdict-dict-create
    grouped = collections.defaultdict(dict)
    for key, value in other.items():
        grouped[key].update(value)
    return grouped


def safe_plain(other):
    # ok: manual-defaultdict-dict-create
    result = dict()
    for key, value in other.items():
        result[key] = value
    return result


def safe_comp(other):
    # ok: manual-defaultdict-dict-create
    return {key: dict(value) for key, value in other.items()}
