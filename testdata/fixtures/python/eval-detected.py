# eval() parses its argument as Python code, so a caller-chosen string
# becomes code. Flag eval() of anything but a constant; a string literal
# cannot carry input.
from flask import request


def from_query():
    user = request.args.get("expr")
    # ruleid: eval-detected
    eval(user)
    # ruleid: eval-detected
    eval("1 + " + user)
    # ruleid: eval-detected
    result = eval(compile(user, "<expr>", "eval"))


def safe_literal():
    # ok: eval-detected
    eval("1 + 1")
    # ok: eval-detected
    eval("sorted([3, 1, 2])")
    # ok: eval-detected
    eval("")
