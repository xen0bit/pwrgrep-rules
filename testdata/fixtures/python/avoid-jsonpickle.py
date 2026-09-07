# jsonpickle.decode on data (not a constant) can execute code hidden
# in the payload. Flag decode of anything but a literal; constants
# cannot carry an attack.
import jsonpickle


def flag_data(payload):
    # ruleid: avoid-jsonpickle
    obj = jsonpickle.decode(payload)
    # ruleid: avoid-jsonpickle
    obj = jsonpickle.decode(payload, keys=True)
    # ruleid: avoid-jsonpickle
    obj = jsonpickle.decode(request_body)


def safe_literal():
    # ok: avoid-jsonpickle
    obj = jsonpickle.decode("{}", keys=True)
    # ok: avoid-jsonpickle
    obj = jsonpickle.decode("[]", keys=True)
    # ok: avoid-jsonpickle
    obj = jsonpickle.decode("[1, 2]", keys=True)
