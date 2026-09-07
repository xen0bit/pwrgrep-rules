# Django request data opened and sent via FileResponse.
#
# A caller-chosen path both reads outside the directory and is served
# back. The readings need bare-statement tails, so each case responds
# bare and the finding lands on the request line that starts the match.
# A literal path is the ok.
import django.http


def view_a(request):
    # ruleid: request-data-fileresponse
    name = request.GET.get("name")
    django.http.FileResponse(open(name))
    return name


def view_b(request):
    # ruleid: request-data-fileresponse
    name = request.GET["name"]
    handle = open(name)
    django.http.FileResponse(handle)
    return handle


def view_c(request):
    # ruleid: request-data-fileresponse
    name = request.POST.get("name")
    django.http.FileResponse(open(name))
    return name


def view_literal(request):
    # ok: request-data-fileresponse
    django.http.FileResponse(open("report.txt"))
    return "report"


def view_handle(request):
    handle = open("report.txt")
    # ok: request-data-fileresponse
    django.http.FileResponse(handle)
    return handle


def view_plain(request):
    # ok: request-data-fileresponse
    return django.http.HttpResponse("hello")
