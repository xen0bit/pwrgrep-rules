# return in __init__ silently drops the half-built object (and hints
# at confused control flow). The rule reports the __init__ def and each
# return inside it; returns elsewhere are fine. Only the first id,
# return-in-init, is marked.
class One(object):
    # ruleid: return-in-init
    def __init__(self, flag):
        if flag:
            # ruleid: return-in-init
            return
        self.flag = flag


class Two(object):
    # ruleid: return-in-init
    def __init__(self, flag):
        if not flag:
            # ruleid: return-in-init
            return None
        self.flag = flag


class Three(object):
    # ruleid: return-in-init
    def __init__(self, items):
        for item in items:
            # ruleid: return-in-init
            return
        self.items = items


class Safe(object):
    def check(self):
        # ok: return-in-init
        if self.flag:
            return True
        # ok: return-in-init
        return False


def standalone(flag):
    # ok: return-in-init
    if flag:
        return 1
    # ok: return-in-init
    return 0
