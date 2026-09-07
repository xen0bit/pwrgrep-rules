# Flask SQL string manually built from request or route data.
#
# Interpolating caller input into a SQL keyword string puts its syntax
# into the query. The finding lands on the line that builds the string.
# A bound parameter is the fix. Shares the tainted-sql-string id with
# the Django and Lambda rules: one finding reached three ways.
import flask


@app.route("/user")
def view_a():
    uid = flask.request.args.get("uid")
    # ruleid: tainted-sql-string
    query = "SELECT * FROM users WHERE id=" + uid
    return query


@app.route("/user/<uid>")
def view_b(uid):
    # ruleid: tainted-sql-string
    query = "SELECT * FROM users WHERE id='%s'" % uid
    return query


@app.route("/u", methods=["POST"])
def view_c():
    uid = flask.request.form.get("uid")
    # ruleid: tainted-sql-string
    query = f"SELECT * FROM users WHERE id='{uid}'"
    return query


@app.route("/fixed")
def view_fixed():
    uid = flask.request.args.get("uid")
    # ok: tainted-sql-string
    query = "SELECT * FROM users WHERE id=%s"
    return query, uid


@app.route("/lit")
def view_literal():
    # ok: tainted-sql-string
    query = "SELECT * FROM users WHERE id=1"
    return query


@app.route("/plain/<uid>")
def view_nonsql(uid):
    # ok: tainted-sql-string
    text = "hello " + uid
    return text
