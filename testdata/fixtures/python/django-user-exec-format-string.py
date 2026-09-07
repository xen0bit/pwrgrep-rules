# Django exec of request data formatted into a string.
#
# Formatting caller input into code and executing it runs
# attacker-chosen code. The finding lands on the first line of the
# multi-statement match. Executing a literal is the ok.
def view_a(request):
    # ruleid: user-exec-format-string
    code = request.GET.get("code")
    exec("value=%s" % code)
    return code


def view_b(request):
    # ruleid: user-exec-format-string
    code = request.GET["code"]
    exec("value={}".format(code))
    return code


def view_c(request):
    # ruleid: user-exec-format-string
    code = request.POST.get("code")
    exec(f"value={code}")
    return code


def view_literal():
    # ok: user-exec-format-string
    exec("x = 1")
    return 1


def view_format_literal():
    # ok: user-exec-format-string
    exec("x=%s" % "1")
    return 1


def view_plain():
    # ok: user-exec-format-string
    x = 1
    return x
