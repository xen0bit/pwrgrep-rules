# raise needs a BaseException: strings and numbers fail at runtime
# with TypeError instead of the intended error. Flag those; real
# exception classes are the fix.
def flag_string():
    # ruleid: raise-not-base-exception
    raise "boom"


def flag_number():
    # ruleid: raise-not-base-exception
    raise 42


def flag_float():
    # ruleid: raise-not-base-exception
    raise 4.5


def safe_class():
    # ok: raise-not-base-exception
    raise ValueError("boom")


def safe_bare():
    # ok: raise-not-base-exception
    raise


def safe_reraise():
    try:
        work()
    except ValueError as exc:
        # ok: raise-not-base-exception
        raise exc
