# marshal.load on data executes whatever the bytes describe. Flag
# every marshal entry point; json (or a constant) is the fix.
import json
import marshal


def flag_marshal(blob):
    # ruleid: marshal-usage
    obj = marshal.loads(blob)
    # ruleid: marshal-usage
    obj = marshal.load(fh)
    # ruleid: marshal-usage
    data = marshal.dumps(obj)


def safe_other(blob):
    # ok: marshal-usage
    obj = json.loads(blob)
    # ok: marshal-usage
    data = json.dumps({"a": 1})
    # ok: marshal-usage
    text = blob.decode("utf-8")
