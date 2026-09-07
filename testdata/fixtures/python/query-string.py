# Flask cached route reading the query string.
#
# Flask-Caching keys on the path by default, so a cached handler that
# reads request.args serves one user's query to everyone. The match
# spans the decorators to the args read, so each finding lands on its
# route decorator line. Note the first case uses the bare request name
# the rule spells (no flask prefix). Passing query_string=True is the
# fix, and its handler is the ok.
import flask


# ruleid: flask-cache-query-string
@app.route("/items")
@cache.cached(timeout=60)
def list_items():
    request.args.get("name")


# ruleid: flask-cache-query-string
@app.route("/orders", methods=["POST"])
@cache.cached(timeout=60)
def create_order():
    total = flask.request.args.get("total")
    return total


# ruleid: flask-cache-query-string
@app.route("/users", methods=["PUT"])
@cache.cached(timeout=60)
def update_user():
    age = flask.request.args.get("age")
    return age


@app.route("/fixed")
@cache.cached(timeout=60, query_string=True)
def list_fixed():
    # ok: flask-cache-query-string
    name = flask.request.args.get("name")
    return name


@app.route("/plain")
def view_plain():
    # ok: flask-cache-query-string
    name = flask.request.args.get("name")
    return name


@app.route("/nocache")
@cache.cached(timeout=60)
def view_nocache():
    # ok: flask-cache-query-string
    return "hello"
