# Django RawSQL with request data as params.
#
# RawSQL executes SQL the ORM does not quote. The readings need
# bare-statement tails (assigned forms match two readings at once), so
# each case builds bare and the finding lands on the request line that
# starts the match. A literal statement is the ok.
import django.db.models.expressions


def view_a(request):
    # ruleid: sql-injection-using-rawsql
    django.db.models.expressions.RawSQL("SELECT ", request.GET.get("uid"))
    return 1


def view_b(request):
    # ruleid: sql-injection-using-rawsql
    uid = request.GET["uid"]
    django.db.models.expressions.RawSQL("SELECT ", uid)
    return 1


def view_c(request):
    # ruleid: sql-injection-using-rawsql
    uid = request.POST.get("uid")
    query = "SELECT " + uid
    django.db.models.expressions.RawSQL(query)
    return 1


def view_literal(request):
    # ok: sql-injection-using-rawsql
    django.db.models.expressions.RawSQL("SELECT 1")
    return 1


def view_plain_args(request):
    # ok: sql-injection-using-rawsql
    django.db.models.expressions.RawSQL("SELECT 1", [])
    return 1


def view_other(request):
    # ok: sql-injection-using-rawsql
    x = 1
    return x
