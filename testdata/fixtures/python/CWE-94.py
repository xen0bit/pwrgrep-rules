# CWE-94 / CWE-95: Code injection — eval/exec/compile run a string as code.
#
# A string the caller chose that reaches `eval`, `exec` or `compile` is code
# the caller chose. `request.args`, a route variable and `self.path` are all
# such strings, and `compile` plus `eval`/`exec` differ only in when the
# parsing happens. A literal string is safe.
import flask
from flask import request


@app.route("/eval/<code>")
def from_route(code):
    # ruleid: python-code-injection
    eval(code)
    # ruleid: python-code-injection
    exec(code)
    # ruleid: python-code-injection
    compile(code, "<string>", "exec")


def from_query():
    q = request.args.get("x")
    # ruleid: python-code-injection
    eval(q)
    y = request.args.get("y")
    tainted = y
    # ruleid: python-code-injection
    exec(tainted)
    # Propagation through a variable — reaching must follow it.
    prog = q
    # ruleid: python-code-injection
    eval(prog, {})
    # ruleid: python-code-injection
    compile(prog, "code.py", "eval")


def from_self_path(handler):
    # self.path in a BaseHTTP handler is the request path.
    data = handler.path  # not via self, but still path — handled via self.path source pattern
    _ = data


class Handler:
    def handle(self):
        # ruleid: python-code-injection
        exec(self.path)


def safe_literal():
    # ok: python-code-injection
    eval("2 + 2")
    # ok: python-code-injection
    exec("print(1)")
    # ok: python-code-injection
    compile("x = 1", "<string>", "exec")
    # ok: python-code-injection
    eval("hello".upper())
