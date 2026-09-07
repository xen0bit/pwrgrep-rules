# User-controlled data must not reach `run_in_subinterp`: it executes arbitrary
# code in a subinterpreter. Each flagged call is reported three times (the call
# plus its argument spans), so every marker is repeated three times to mirror
# the rule. Literals are fine.
import _testcapi
import os
import sys


def flag_argv():
    payload = sys.argv[1]
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp(payload)


def flag_environ():
    payload = os.environ.get("CODE")
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp(payload)


def safe_literal():
    # ok: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp("1 + 1")


def safe_static():
    # ok: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp("static")
