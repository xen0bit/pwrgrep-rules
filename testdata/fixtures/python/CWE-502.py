# CWE-502: Deserialization — untrusted data is unpickled / yaml-loaded.
#
# `pickle.loads`, `yaml.load` and `marshal.loads` build arbitrary objects from
# the bytes given. If those bytes are the caller's, the caller chooses the
# object and, for pickle, the code that runs.
import pickle
import yaml
import marshal
from flask import request


@app.route("/load/<data>")
def from_route(data):
    # ruleid: python-deserialization
    pickle.loads(data)
    # ruleid: python-deserialization
    yaml.load(data, Loader=yaml.Loader)


def from_query():
    blob = request.args.get("data")
    # ruleid: python-deserialization
    pickle.loads(blob)
    # ruleid: python-deserialization
    pickle.load(blob)
    # ruleid: python-deserialization
    yaml.unsafe_load(blob)
    # ruleid: python-deserialization
    marshal.loads(blob)
    # Propagation through a variable — reaching must follow it.
    d = blob
    # ruleid: python-deserialization
    yaml.load(d)
    # ruleid: python-deserialization
    marshal.load(d)


def safe_literal():
    # ok: python-deserialization
    pickle.loads(b"cos\nsystem\n(S'ls -l'\ntR.")
    # ok: python-deserialization
    yaml.safe_load("a: 1")
    # ok: python-deserialization
    marshal.loads(b"\xe9\x01\x00\x00\x00")
    # ok: python-deserialization
    yaml.load("a: 1", Loader=yaml.SafeLoader)
