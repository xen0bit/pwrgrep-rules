# Django exec of request data.
#
# Executing caller input runs attacker-chosen code. The finding lands on
# the first line of the multi-statement match. Executing a literal is
# the ok.
def view_a(request):
    # ruleid: user-exec
    code = request.GET.get("code")
    exec(code)
    return code


def view_b(request):
    # ruleid: user-exec
    exec(request.GET["code"])
    return 1


def view_c(request):
    # ruleid: user-exec
    code = request.POST.get("code")
    exec(code, {})
    return code


def view_literal():
    # ok: user-exec
    exec("x = 1")
    return 1


def view_name():
    name = "x = 1"
    # ok: user-exec
    exec(name)
    return 1


def view_plain():
    # ok: user-exec
    x = 1
    return x
