# CWE-89: SQL injection — the query is a string the caller chose.
#
# Building a query with `+` or an `f"..."` that contains the request value
# interpolates the caller's text into SQL. A `'`, a `;` or a `--` in the
# middle ends the value and starts new syntax. Parameterised queries keep
# the code and the data apart.
import sqlite3
from flask import request


@app.route("/user/<uid>")
def from_route(uid):
    conn = sqlite3.connect("db.sqlite")
    cur = conn.cursor()
    # ruleid: python-sql-injection
    cur.execute("SELECT * FROM users WHERE id=" + uid)
    # ruleid: python-sql-injection
    cur.execute(f"SELECT * FROM users WHERE id='{uid}'")


def from_query():
    user = request.args.get("user")
    conn = sqlite3.connect("db.sqlite")
    cur = conn.cursor()
    # ruleid: python-sql-injection
    cur.execute("SELECT * FROM users WHERE name='" + user + "'")
    # ruleid: python-sql-injection
    cur.execute(f"SELECT * FROM users WHERE name='{user}'")
    # Propagation through a variable — reaching must follow it.
    q = "SELECT * FROM t WHERE id=" + user
    # ruleid: python-sql-injection
    cur.execute(q)
    # Also executemany with tainted query.
    # ruleid: python-sql-injection
    cur.executemany("DELETE FROM t WHERE id=" + user, [])


def safe_literal():
    conn = sqlite3.connect("db.sqlite")
    cur = conn.cursor()
    # ok: python-sql-injection
    cur.execute("SELECT * FROM users WHERE id=1")
    # ok: python-sql-injection
    cur.execute("SELECT * FROM users")


def safe_parameterised():
    user = request.args.get("user")
    conn = sqlite3.connect("db.sqlite")
    cur = conn.cursor()
    # ok: python-sql-injection
    cur.execute("SELECT * FROM users WHERE id=%s", (user,))
    # ok: python-sql-injection
    cur.execute("SELECT * FROM users WHERE name=?", (user,))
    # ok: python-sql-injection
    cur.executemany("INSERT INTO t VALUES (?)", [(user,)])
