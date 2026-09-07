# Lambda pymssql query built from event input.
#
# Concatenating caller input into the query puts its syntax into SQL.
# Parameterised queries keep code and data apart.
import pymssql


def handler(event, context):
    uid = event.get("uid")
    q = "SELECT * FROM users WHERE id=" + uid
    # ruleid: pymssql-sqli
    cursor.execute(q)


def handler_direct(event, context):
    uid = event.get("uid")
    # ruleid: pymssql-sqli
    cursor.execute("SELECT * FROM users WHERE id=" + uid)


def handler_format(event, context):
    uid = event.get("uid")
    # ruleid: pymssql-sqli
    cursor.execute("SELECT * FROM users WHERE id='%s'" % uid)


def handler_parameterised(event, context):
    uid = event.get("uid")
    # ok: pymssql-sqli
    cursor.execute("SELECT * FROM users WHERE id=%s", (uid,))


def handler_literal(event, context):
    # ok: pymssql-sqli
    cursor.execute("SELECT * FROM users WHERE id=1")


def unrelated():
    # ok: pymssql-sqli
    cursor.execute("SELECT * FROM users")
