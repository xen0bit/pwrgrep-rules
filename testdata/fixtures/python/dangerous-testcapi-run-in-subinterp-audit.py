# run_in_subinterp runs its argument as Python in another interpreter.
# Flag computed (non-literal) code; constant snippets cannot carry an
# attack.
import _testcapi
import test.support


def flag_dynamic(first, second, third):
    # ruleid: dangerous-testcapi-run-in-subinterp-audit
    _testcapi.run_in_subinterp(first)
    # ruleid: dangerous-testcapi-run-in-subinterp-audit
    _testcapi.run_in_subinterp(second)
    # ruleid: dangerous-testcapi-run-in-subinterp-audit
    test.support.run_in_subinterp(third)


def safe_literal():
    # ok: dangerous-testcapi-run-in-subinterp-audit
    _testcapi.run_in_subinterp("print(1)")
    # ok: dangerous-testcapi-run-in-subinterp-audit
    _testcapi.run_in_subinterp("x = 1")
    # ok: dangerous-testcapi-run-in-subinterp-audit
    test.support.run_in_subinterp("y = 2")
