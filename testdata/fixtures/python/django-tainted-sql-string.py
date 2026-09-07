# Django SQL string manually built from request data.
#
# Interpolating caller input into a SQL keyword string puts its syntax
# into the query; request.build_absolute_uri is excluded (a URL the app
# built, not raw input). The finding lands on the line that builds the
# string. A bound parameter is the fix, and its query line is the ok.
# Shares the tainted-sql-string id with the Flask and Lambda rules: one
# finding reached three ways, so no new id here.
def view_a(request):
    uid = request.GET.get("uid")
    # ruleid: tainted-sql-string
    query = "SELECT * FROM users WHERE id=" + uid
    return query


def view_b(request):
    uid = request.GET["uid"]
    # ruleid: tainted-sql-string
    query = "SELECT * FROM users WHERE id='%s'" % uid
    return query


def view_c(request):
    uid = request.POST.get("uid")
    # ruleid: tainted-sql-string
    query = f"SELECT * FROM users WHERE id='{uid}'"
    return query


def view_fixed(request):
    uid = request.GET.get("uid")
    # ok: tainted-sql-string
    query = "SELECT * FROM users WHERE id=%s"
    return query, uid


def view_literal(request):
    # ok: tainted-sql-string
    query = "SELECT * FROM users WHERE id=1"
    return query


def view_nonsql(request):
    uid = request.GET.get("uid")
    # ok: tainted-sql-string
    text = "hello " + uid
    return text
