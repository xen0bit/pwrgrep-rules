# Django raw() with request data.
#
# raw() executes SQL the ORM does not quote. The readings need
# bare-statement tails (assigned forms match two readings at once), so
# each case queries bare and the finding lands on the request line that
# starts the match. A literal statement is the ok.
import django.db.models


class MyModel(django.db.models.Model):
    pass


def view_a(request):
    # ruleid: sql-injection-using-raw
    MyModel.objects.raw("SELECT ", request.GET.get("uid"))
    return 1


def view_b(request):
    # ruleid: sql-injection-using-raw
    uid = request.GET["uid"]
    MyModel.objects.raw("SELECT * FROM t WHERE id=%s" % uid)
    return 1


def view_c(request):
    # ruleid: sql-injection-using-raw
    uid = request.POST.get("uid")
    query = "SELECT * FROM t WHERE id=" + uid
    MyModel.objects.raw(query)
    return 1


def view_literal(request):
    # ok: sql-injection-using-raw
    MyModel.objects.raw("SELECT * FROM app_mymodel")
    return 1


def view_filter(request):
    uid = request.GET.get("uid")
    # ok: sql-injection-using-raw
    qs = MyModel.objects.filter(id=uid)
    return qs


def view_plain(request):
    # ok: sql-injection-using-raw
    qs = MyModel.objects.all()
    return qs
