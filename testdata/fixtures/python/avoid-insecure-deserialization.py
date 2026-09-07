# Django insecure deserialization of request data.
#
# Unpickling (or yaml-loading) caller input runs attacker-chosen code
# during decoding. The sources are request accessors inside a view; the
# fix is SafeLoader for yaml and trusted bytes for pickle.
import pickle

import yaml


def view_pickle(request):
    name = request.GET.get("name")
    # ruleid: avoid-insecure-deserialization
    pickle.loads(name)


def view_yaml(request):
    data = request.POST.get("data")
    # ruleid: avoid-insecure-deserialization
    yaml.load(data)


def view_pickle_load(request):
    blob = request.FILES.get("blob")
    # ruleid: avoid-insecure-deserialization
    pickle.load(blob)


def view_safe_yaml(request):
    data = request.POST.get("data")
    # ok: avoid-insecure-deserialization
    yaml.load(data, Loader=yaml.SafeLoader)


def view_literal(request):
    # ok: avoid-insecure-deserialization
    pickle.loads(b"trusted-bytes")


def view_safe_load(request):
    data = request.POST.get("data")
    # ok: avoid-insecure-deserialization
    yaml.safe_load(data)
