# Django DB cursor execute with request data.
#
# Values interpolated into the statement change its syntax; bound
# parameters keep code and data apart. Only %-formatting (not +) has a
# direct-inline reading, so the inline case uses %. The finding lands on
# the execute line for inline use and on the request line for the
# assigned forms. A literal statement (or a bound literal) is the ok.
import django.db.connection


def view_a(request):
    cursor = django.db.connection.cursor()
    # ruleid: sql-injection-db-cursor-execute
    cursor.execute("SELECT * FROM t WHERE id=%s" % request.GET.get("uid"))
    return 1


def view_b(request):
    # ruleid: sql-injection-db-cursor-execute
    uid = request.GET["uid"]
    cursor = django.db.connection.cursor()
    cursor.execute("SELECT * FROM t WHERE id=%s" % uid)
    return 1


def view_c(request):
    # ruleid: sql-injection-db-cursor-execute
    uid = request.POST.get("uid")
    query = "SELECT * FROM t WHERE id=" + uid
    cursor = django.db.connection.cursor()
    cursor.execute(query)
    return 1


def view_literal(request):
    cursor = django.db.connection.cursor()
    # ok: sql-injection-db-cursor-execute
    cursor.execute("SELECT * FROM t WHERE id=1")
    return 1


def view_bound(request):
    cursor = django.db.connection.cursor()
    # ok: sql-injection-db-cursor-execute
    cursor.execute("SELECT * FROM t WHERE id=%s", ["1"])
    return 1


def view_plain(request):
    # ok: sql-injection-db-cursor-execute
    x = 1
    return x
