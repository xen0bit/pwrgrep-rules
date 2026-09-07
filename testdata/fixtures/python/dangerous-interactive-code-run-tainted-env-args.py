# User-controlled data must not reach InteractiveConsole/InteractiveInterpreter.
# Each flagged call is reported three times (the call plus its argument spans),
# so every marker is repeated three times to mirror the rule. Literals are fine.
import code
import os
import sys


def flag_argv():
    payload = sys.argv[1]
    console = code.InteractiveConsole()
    # ruleid: dangerous-interactive-code-run-tainted-env-args
    # ruleid: dangerous-interactive-code-run-tainted-env-args
    # ruleid: dangerous-interactive-code-run-tainted-env-args
    console.push(payload)


def flag_environ():
    payload = os.environ.get("EXPR")
    console = code.InteractiveInterpreter()
    # ruleid: dangerous-interactive-code-run-tainted-env-args
    # ruleid: dangerous-interactive-code-run-tainted-env-args
    # ruleid: dangerous-interactive-code-run-tainted-env-args
    console.push(payload)


def safe_literal():
    console = code.InteractiveConsole()
    # ok: dangerous-interactive-code-run-tainted-env-args
    console.push("1 + 1")


def safe_source():
    console = code.InteractiveConsole()
    # ok: dangerous-interactive-code-run-tainted-env-args
    console.push("static")
