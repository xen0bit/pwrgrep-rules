# A bare `pass` body usually means "not implemented yet" shipped by
# accident. Flag top-level pass functions (__init__ and methods are
# out of scope); real bodies are the fix. Only the first id,
# pass-body-fn, is marked.


# ruleid: pass-body-fn
def todo_one():
    pass


# ruleid: pass-body-fn
def todo_two(arg):
    pass


# ruleid: pass-body-fn
def todo_three(arg, key=None):
    pass


class Worker(object):
    def __init__(self):
        # ok: pass-body-fn
        pass

    def run(self):
        # ok: pass-body-fn
        pass


def done_one():
    # ok: pass-body-fn
    return 1
