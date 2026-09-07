# Flask route deserializing with pickle/yaml/dill.
#
# These formats execute code while decoding, so request-adjacent data
# becomes RCE. The rule is audit-style (no source tracked): any such
# call inside a route fires. Literals loaded from constants and code
# outside routes are the oks.
import dill
import pickle
import yaml


@app.route("/a")
def view_a(payload):
    # ruleid: insecure-deserialization
    data = pickle.loads(payload)
    return data


@app.route("/b")
def view_b(payload):
    # ruleid: insecure-deserialization
    data = yaml.load(payload)
    return data


@app.route("/c")
def view_c(payload):
    # ruleid: insecure-deserialization
    data = dill.loads(payload)
    return data


@app.route("/lit")
def view_literal():
    # ok: insecure-deserialization
    data = pickle.loads("trusted-bytes")
    return data


@app.route("/file")
def view_file():
    # ok: insecure-deserialization
    data = pickle.load(open("/tmp/trusted.pkl", "rb"))
    return data


def helper(payload):
    # ok: insecure-deserialization
    data = pickle.loads(payload)
    return data
