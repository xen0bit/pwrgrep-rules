# execute() with a formatted string re-parses values as SQL. Flag
# concatenated/formatted queries; bound parameters keep code and
# data apart.
def flag_concat(engine, user):
    # ruleid: sqlalchemy-execute-raw-query
    engine.execute("SELECT * FROM users WHERE name=" + user)
    # ruleid: sqlalchemy-execute-raw-query
    engine.execute("SELECT * FROM users WHERE name=%s" % (user,))
    # ruleid: sqlalchemy-execute-raw-query
    engine.execute("SELECT * FROM users WHERE name={}".format(user))


def safe_bound(engine, user):
    # ok: sqlalchemy-execute-raw-query
    engine.execute("SELECT * FROM users WHERE name=:name", {"name": user})
    # ok: sqlalchemy-execute-raw-query
    engine.execute("SELECT * FROM users WHERE id=:id", {"id": 1})
    # ok: sqlalchemy-execute-raw-query
    engine.execute("SELECT * FROM users")
