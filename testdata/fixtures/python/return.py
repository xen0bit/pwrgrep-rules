"""code-after-unconditional-return: statements after return never run.

A function whose body has code under a `return` is reported at the
`def`; a `return` that ends its function (even with a trailing
comment) is not.
"""

# ruleid: code-after-unconditional-return
def after_return(x):
    return x
    print("unreachable")


# ruleid: code-after-unconditional-return
def after_return_two(x):
    return x
    x += 1
    return x


# ok: code-after-unconditional-return
def clean_return(x):
    return x + 1


# ok: code-after-unconditional-return
def trailing_comment(x):
    return x
    # nothing follows but this comment


# ok: code-after-unconditional-return
def no_return(x):
    print(x)
