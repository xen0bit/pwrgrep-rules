# A `break` in `finally` swallows any in-flight error and can loop forever.
# Each flagged block uses only `break`: the sibling patterns look for
# `continue` or `return`, so a file mixing them would collapse every finding
# onto the first `try`. Clean `finally` blocks only tidy up.
def flag_break_one():
    for i in range(10):
        # ruleid: suppressed-exception-handling-finally-break
        try:
            x = i
        except ValueError:
            x = -1
        finally:
            print(x)
            break


def flag_break_two():
    for i in range(10):
        # ruleid: suppressed-exception-handling-finally-break
        try:
            y = i
        except ValueError:
            y = -1
        finally:
            print(x)
            break


def flag_break_three():
    for i in range(10):
        # ruleid: suppressed-exception-handling-finally-break
        try:
            z = i
        except ValueError:
            z = -1
        finally:
            print(x)
            break


def safe_cleanup():
    # ok: suppressed-exception-handling-finally-break
    try:
        x = compute()
    except ValueError:
        x = -1
    finally:
        print(x)


def safe_no_finally():
    # ok: suppressed-exception-handling-finally-break
    try:
        y = compute()
    except ValueError:
        y = -1


def safe_plain():
    # ok: suppressed-exception-handling-finally-break
    x = compute()
    print(x)
