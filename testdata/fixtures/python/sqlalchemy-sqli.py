# Lambda SQLAlchemy query built from event input.
#
# Concatenating caller input into the query puts its syntax into SQL.
# Bound parameters keep code and data apart.
import sqlalchemy


def handler(event, context):
    uid = event.get("uid")
    q = "SELECT * FROM users WHERE id=" + uid
    # ruleid: sqlalchemy-sqli
    cursor.execute(q)


def handler_direct(event, context):
    uid = event.get("uid")
    # ruleid: sqlalchemy-sqli
    cursor.execute("SELECT * FROM users WHERE id=" + uid)


def handler_format(event, context):
    uid = event.get("uid")
    # ruleid: sqlalchemy-sqli
    cursor.execute("SELECT * FROM users WHERE id='%s'" % uid)


def handler_bound(event, context):
    uid = event.get("uid")
    # ok: sqlalchemy-sqli
    cursor.execute("SELECT * FROM users WHERE id=:uid", {"uid": uid})


def handler_literal(event, context):
    # ok: sqlalchemy-sqli
    cursor.execute("SELECT * FROM users WHERE id=1")


def unrelated():
    # ok: sqlalchemy-sqli
    cursor.execute("SELECT * FROM users")
