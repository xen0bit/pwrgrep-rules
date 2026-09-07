# Defining __eq__ without __hash__ makes instances unhashable (and
# breaks sets/dicts silently). Flag eq-without-hash classes; adding
# __hash__ (or neither) is the fix. The rule matches classes named A.
# ruleid: missing-hash-with-eq
class A(object):
    def __eq__(self, other):
        return self.x == other.x


# ruleid: missing-hash-with-eq
class A(object):
    def __eq__(self, other):
        return str(self) == str(other)


# ruleid: missing-hash-with-eq
class A(object):
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y


# ok: missing-hash-with-eq
class B(object):
    def __hash__(self):
        return hash(self.x)

    def __eq__(self, other):
        return self.x == other.x


# ok: missing-hash-with-eq
class C(object):
    def __eq__(self, other):
        return self.x == other.x


# ok: missing-hash-with-eq
class D(object):
    def method(self):
        return 1
