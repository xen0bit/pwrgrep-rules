# Django request data joined into a path passed to open().
#
# os.path.join does not stop ../, so caller input there escapes the base
# directory. The variable-mediated readings need bare-statement tails,
# so those cases open bare and the finding lands on the request line.
# abspath normalization in the same function is the carve-out (its line
# is the ok); a literal join is the other ok.
import os


def view_a(request):
    # ruleid: path-traversal-join
    return open(os.path.join("base", request.GET.get("name")))


def view_b(request):
    # ruleid: path-traversal-join
    name = request.GET["name"]
    full = os.path.join("base", name)
    open(full)
    return full


def view_c(request):
    # ruleid: path-traversal-join
    name = request.POST.get("name")
    open(os.path.join("base", name))
    return name


def view_normalized(request):
    name = request.GET.get("name")
    full = os.path.join("base", name)
    # ok: path-traversal-join
    safe = os.path.abspath(full)
    return open(safe)


def view_literal(request):
    # ok: path-traversal-join
    return open(os.path.join("base", "report.txt"))


def view_plain(request):
    # ok: path-traversal-join
    return open("base/report.txt")
