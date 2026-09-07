# A leftover debugger stops the program waiting for input. Flag the
# import and set_trace; other imports (and calling nothing) are fine.
# ruleid: python-debugger-found
import pdb


def flag_trace():
    # ruleid: python-debugger-found
    pdb.set_trace()


def flag_trace_again(cond):
    if cond:
        # ruleid: python-debugger-found
        pdb.set_trace()


def safe_imports():
    # ok: python-debugger-found
    import sys
    # ok: python-debugger-found
    import ipdb
    # ok: python-debugger-found
    breakpoint()
