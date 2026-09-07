# Django request data passed to open().
#
# A caller-chosen path reads (or writes) outside the intended directory.
# The variable-mediated readings need bare-statement tails, so those
# cases open bare and the finding lands on the request line. A literal
# path is the ok.
def view_a(request):
    # ruleid: path-traversal-open
    open(request.GET.get("name"))
    return 1


def view_b(request):
    # ruleid: path-traversal-open
    name = request.GET["name"]
    open(name)
    return name


def view_c(request):
    # ruleid: path-traversal-open
    name = request.POST.get("name")
    open("base/%s" % name)
    return name


def view_literal(request):
    # ok: path-traversal-open
    open("report.txt")
    return 1


def view_mode(request):
    # ok: path-traversal-open
    open("report.txt", "r")
    return 1


def view_plain(request):
    # ok: path-traversal-open
    x = 1
    return x
