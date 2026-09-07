# Lambda pickle/dill/shelve deserialization of event input.
#
# Unpickling caller input runs attacker-chosen code during decoding.
# Fixed code deserializes only trusted literals.
import pickle


def handler(event, context):
    data = event.get("data")
    # ruleid: tainted-pickle-deserialization
    pickle.loads(data)


def handler_direct(event, context):
    # ruleid: tainted-pickle-deserialization
    pickle.load(event["file"])


def handler_dill(event, context):
    import dill
    data = event.get("data")
    # ruleid: tainted-pickle-deserialization
    dill.loads(data)


def handler_literal(event, context):
    # ok: tainted-pickle-deserialization
    pickle.loads(b"trusted-bytes")


def unrelated():
    import pickle as p
    # ok: tainted-pickle-deserialization
    p.loads(b"trusted-bytes")


def handler_open_literal(event, context):
    # ok: tainted-pickle-deserialization
    pickle.load(open("/tmp/trusted.pkl", "rb"))
