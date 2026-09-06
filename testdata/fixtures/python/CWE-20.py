# CWE-20: Improper input validation — input() without validation reaches sink.
import sqlite3

def vuln_eval():
    x = input()
    # ruleid: python-input-validation
    eval(x)

def vuln_exec():
    data = input("enter: ")
    # ruleid: python-input-validation
    exec(data)

def vuln_sql():
    user = input()
    conn = sqlite3.connect("db.sqlite")
    cur = conn.cursor()
    # ruleid: python-input-validation
    cur.execute("SELECT * FROM users WHERE name = '" + user + "'")

def safe_regex():
    x = input()
    import re
    if not re.match(r"^[a-z]+$", x):
        raise ValueError("bad")
    # ok: python-input-validation
    eval("fixed_string")

def safe_no_input():
    y = "fixed"
    # ok: python-input-validation
    eval(y)
    # ok: python-input-validation
    cur = sqlite3.connect("a").cursor()
    cur.execute("SELECT * FROM t WHERE id=1")

def vuln_request_sql():
    from flask import request
    name = request.args.get("name")
    cur = sqlite3.connect("db.sqlite").cursor()
    # ruleid: python-input-validation
    cur.execute("SELECT * FROM users WHERE name = '" + name + "'")

def vuln_request_open():
    from flask import request
    path = request.form["path"]
    # ruleid: python-input-validation
    open(path)

def safe_request_literal():
    from flask import request
    _ = request.args.get("ignored")
    # ok: python-input-validation
    open("/etc/hostname")
