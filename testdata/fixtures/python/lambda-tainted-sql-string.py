# Lambda SQL string manually built from event input.
#
# Interpolating caller input into a SQL keyword string puts its syntax
# into the query. Bound parameters keep code and data apart. The finding
# lands on the line that builds the string.
def handler(event, context):
    uid = event.get("uid")
    # ruleid: tainted-sql-string
    q = "SELECT * FROM users WHERE id=" + uid
    cursor.execute(q)


def handler_format(event, context):
    uid = event.get("uid")
    # ruleid: tainted-sql-string
    q = "SELECT * FROM users WHERE id='%s'" % uid
    cursor.execute(q)


def handler_fstring(event, context):
    uid = event.get("uid")
    # ruleid: tainted-sql-string
    q = f"SELECT * FROM users WHERE id='{uid}'"
    cursor.execute(q)


def handler_parameterised(event, context):
    uid = event.get("uid")
    # ok: tainted-sql-string
    q = "SELECT * FROM users WHERE id=%s"
    cursor.execute(q, (uid,))


def handler_literal(event, context):
    # ok: tainted-sql-string
    q = "SELECT * FROM users WHERE id=1"
    cursor.execute(q)


def handler_nonsql(event, context):
    uid = event.get("uid")
    # ok: tainted-sql-string
    q = "hello " + uid
    print(q)
