# Lambda PyMySQL query built from event input.
#
# Concatenating caller input into the query puts its syntax into SQL.
# Parameterised queries keep code and data apart.
import pymysql


def handler(event, context):
    uid = event.get("uid")
    q = "SELECT * FROM users WHERE id=" + uid
    # ruleid: pymysql-sqli
    cursor.execute(q)


def handler_direct(event, context):
    uid = event.get("uid")
    # ruleid: pymysql-sqli
    cursor.execute("SELECT * FROM users WHERE id=" + uid)


def handler_format(event, context):
    uid = event.get("uid")
    # ruleid: pymysql-sqli
    cursor.execute("SELECT * FROM users WHERE id='%s'" % uid)


def handler_parameterised(event, context):
    uid = event.get("uid")
    # ok: pymysql-sqli
    cursor.execute("SELECT * FROM users WHERE id=%s", (uid,))


def handler_literal(event, context):
    # ok: pymysql-sqli
    cursor.execute("SELECT * FROM users WHERE id=1")


def unrelated():
    # ok: pymysql-sqli
    cursor.execute("SELECT * FROM users")
