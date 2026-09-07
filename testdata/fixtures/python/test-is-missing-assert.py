# A comparison sitting alone in a test checks nothing: the result is
# discarded. Flag bare ==; asserting (or returning/using) it is fine.
def test_math():
    # ruleid: test-is-missing-assert
    1 + 1 == 2
    # ruleid: test-is-missing-assert
    compute() == 42
    # ruleid: test-is-missing-assert
    "a".upper() == "A"


def test_ok():
    # ok: test-is-missing-assert
    assert 1 + 1 == 2
    # ok: test-is-missing-assert
    assert compute() == 42
    # ok: test-is-missing-assert
    assert "a".upper() == "A"
