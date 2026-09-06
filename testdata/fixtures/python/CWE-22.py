# CWE-22: Path traversal — a path the caller chose is used to open a file.
#
# `open` with a caller-controlled path lets the caller read outside the
# intended directory: `../../etc/passwd` walks up. `os.path.join` does not
# prevent it, and the same is true of `self.path` in a handler.
import os
from flask import request


@app.route("/files/<path>")
def from_route(path):
    # ruleid: python-path-traversal
    open(path)
    # ruleid: python-path-traversal
    open(os.path.join("/var/data", path))


def from_query():
    f = request.args.get("file")
    # ruleid: python-path-traversal
    open(f)
    # ruleid: python-path-traversal
    open(f, "r")
    # Propagation through a variable — reaching must follow it.
    p = f
    # ruleid: python-path-traversal
    open(os.path.join("/tmp/base", p), "rb")


class Handler:
    def do_GET(self):
        # ruleid: python-path-traversal
        open(self.path)
        # ruleid: python-path-traversal
        open(self.path, "r")


def safe_literal():
    # ok: python-path-traversal
    open("/etc/hosts")
    # ok: python-path-traversal
    open("/var/data/config.json", "r")
    # ok: python-path-traversal
    open(os.path.join("/var/data", "static.txt"))


def safe_constant():
    name = "report.csv"
    # ok: python-path-traversal
    open(os.path.join("/var/data", name))
