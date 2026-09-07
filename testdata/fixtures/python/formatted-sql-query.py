# Formatting values into SQL re-parses them as syntax. Flag execute
# of %-formatted, .format and f-string queries; bound parameters (or a
# fixed query) keep code and data apart.
import sqlite3


def flag_formatted(user):
    # ruleid: formatted-sql-query
    cur.execute("SELECT * FROM users WHERE name='%s'" % user)
    # ruleid: formatted-sql-query
    cur.execute("SELECT * FROM users WHERE name='{}'".format(user))
    # ruleid: formatted-sql-query
    cur.execute(f"SELECT * FROM users WHERE name='{user}'")


def safe_parameterised(user):
    # ok: formatted-sql-query
    cur.execute("SELECT * FROM users WHERE name=%s", (user,))
    # ok: formatted-sql-query
    cur.execute("SELECT * FROM users WHERE name=?", (user,))
    # ok: formatted-sql-query
    cur.execute("SELECT * FROM users WHERE id IN %s", (ids,))
