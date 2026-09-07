# _xxsubinterpreters.run_string runs its argument as Python in another
# interpreter. Flag computed (non-literal) code; constant snippets
# cannot carry an attack.
import _xxsubinterpreters


def flag_dynamic(first, second, third):
    # ruleid: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(0, first)
    # ruleid: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(1, second)
    # ruleid: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(2, third)


def safe_literal():
    # ok: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(0, "print(1)")
    # ok: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(1, "x = 1")
    # ok: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(2, "y = 2")
