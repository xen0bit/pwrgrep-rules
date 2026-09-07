# Django request data formatted into a log/txt/csv file name.
#
# The name must end in a data extension for this rule; abspath/realpath
# normalization in the same function is the carve-out. The readings need
# bare-statement tails, so each case formats bare and the finding lands
# on the request line that starts the match. A literal name is the ok.
import os


def view_a(request):
    # ruleid: path-traversal-file-name
    name = request.GET.get("name")
    "files/%s.log" % (name)
    return name


def view_b(request):
    # ruleid: path-traversal-file-name
    name = request.GET["name"]
    "files/{}.txt".format(name)
    return name


def view_c(request):
    # ruleid: path-traversal-file-name
    name = request.POST.get("name")
    "files/%s.csv" % (name)
    return name


def view_normalized(request):
    name = request.GET.get("name")
    "files/%s.log" % (name)
    # ok: path-traversal-file-name
    os.path.abspath("files/report.log")
    return name


def view_literal(request):
    # ok: path-traversal-file-name
    "files/%s.log" % ("alice")
    return "alice"


def view_plain(request):
    # ok: path-traversal-file-name
    path = "files/report.log"
    return path
