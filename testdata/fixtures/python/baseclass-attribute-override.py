"""baseclass-attribute-override: diamond inheritance, same method twice.

class C(A, B) where A and B define the same method is reported (the
second base's method silently wins); single inheritance and diamonds
with distinct methods are not.
"""


class A(object):
    def render(self):
        return "a"


class B(object):
    def render(self):
        return "b"


# ruleid: baseclass-attribute-override
class C(A, B):
    pass


class D(A):
    pass


# ok: baseclass-attribute-override
class D2(A):
    pass


class E(object):
    def paint(self):
        return "e"


# ok: baseclass-attribute-override
class F(B, E):
    pass


class G(object):
    def load(self):
        return "g"


class H(object):
    def load(self):
        return "h"


# ruleid: baseclass-attribute-override
class I(G, H):
    pass
