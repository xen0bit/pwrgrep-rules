# A nested function that is never called is dead code (and a fresh
# closure per call). The rule reports the outer and the inner def, so
# both lines are marked; called, decorated or missing inners are fine.
# ruleid: useless-inner-function
def flag_unused():
    # ruleid: useless-inner-function
    def helper():
        return 1


# ruleid: useless-inner-function
def flag_unused_again(x):
    # ruleid: useless-inner-function
    def helper():
        return x


# ruleid: useless-inner-function
def flag_unused_third(x, y):
    # ruleid: useless-inner-function
    def helper():
        return x + y


def safe_called():
    # ok: useless-inner-function
    total = compute()
    # ok: useless-inner-function
    return total


def safe_plain():
    # ok: useless-inner-function
    value = 1
    return value


def safe_other():
    # ok: useless-inner-function
    total = compute()
    return total
