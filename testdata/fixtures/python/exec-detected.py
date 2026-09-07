# exec() parses its argument as Python code, so a caller-chosen string
# becomes code. Flag exec() of anything but a constant; a string literal
# cannot carry input.
from flask import request


def from_query():
    user = request.args.get("cmd")
    # ruleid: exec-detected
    exec(user)
    # ruleid: exec-detected
    exec("result = " + user)
    # ruleid: exec-detected
    exec(compile(user, "<cmd>", "exec"))


def safe_literal():
    # ok: exec-detected
    exec("x = 1")
    # ok: exec-detected
    exec("print('hello')")
    # ok: exec-detected
    exec("")
