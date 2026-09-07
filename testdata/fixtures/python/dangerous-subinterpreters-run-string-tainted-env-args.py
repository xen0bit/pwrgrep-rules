# User-controlled data must not reach `run_string`: it executes arbitrary code
# in a subinterpreter. Each flagged call is reported three times (the call plus
# its argument spans), so every marker is repeated three times. Literals are fine.
import _xxsubinterpreters
import os
import sys


def flag_argv():
    payload = sys.argv[1]
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(0, payload)


def flag_environ():
    payload = os.environ.get("CODE")
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(0, payload)


def safe_literal():
    # ok: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(0, "1 + 1")


def safe_static():
    # ok: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(0, "static")
