# Django extra(where) with request data.
#
# extra() splices its where list into SQL without quoting. The readings
# need bare-statement tails (assigned forms match two readings at once),
# so each case queries bare and the finding lands on the request line
# that starts the match. A literal where list is the ok.
import django.db.models


class MyModel(django.db.models.Model):
    pass


def view_a(request):
    # ruleid: sql-injection-using-extra-where
    MyModel.objects.extra(where=[request.GET.get("uid")])
    return 1


def view_b(request):
    # ruleid: sql-injection-using-extra-where
    uid = request.GET["uid"]
    MyModel.objects.extra(where=["id=%s" % uid])
    return 1


def view_c(request):
    # ruleid: sql-injection-using-extra-where
    uid = request.POST.get("uid")
    clause = "id=" + uid
    MyModel.objects.extra(where=[clause])
    return 1


def view_literal(request):
    # ok: sql-injection-using-extra-where
    MyModel.objects.extra(where=["id=1"])
    return 1


def view_filter(request):
    uid = request.GET.get("uid")
    # ok: sql-injection-using-extra-where
    qs = MyModel.objects.filter(id=uid)
    return qs


def view_plain(request):
    # ok: sql-injection-using-extra-where
    qs = MyModel.objects.all()
    return qs
