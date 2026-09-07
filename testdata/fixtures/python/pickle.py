# pickle (and cPickle, dill, shelve) execute code hidden in the data
# they load. Flag loads of anything but a constant; a literal cannot
# carry an attack. (Only the first id, avoid-pickle, is annotated.)
import pickle


def flag_data(payload):
    # ruleid: avoid-pickle
    obj = pickle.loads(payload)
    # ruleid: avoid-pickle
    obj = pickle.loads(payload, fix_imports=True)
    # ruleid: avoid-pickle
    obj = pickle.load(stream)


def safe_literal():
    # ok: avoid-pickle
    obj = pickle.loads("cos\nsystem\n(S'echo hi'\ntR.")
    # ok: avoid-pickle
    obj = pickle.loads("(lp0\n.")
    # ok: avoid-pickle
    obj = _pickle.loads("(lp0\n.")
