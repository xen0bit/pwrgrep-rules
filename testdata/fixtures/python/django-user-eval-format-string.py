# Django eval of request data formatted into a string.
#
# Formatting caller input into code and evaluating it runs
# attacker-chosen code. The readings need the eval as a bare statement
# tail, so each case calls eval bare and the finding lands on the
# request line that starts the match. Evaluating a literal is the ok.
def view_a(request):
    # ruleid: user-eval-format-string
    code = request.GET.get("code")
    eval("value=%s" % code)
    return code


def view_b(request):
    # ruleid: user-eval-format-string
    code = request.GET["code"]
    eval("value={}".format(code))
    return code


def view_c(request):
    # ruleid: user-eval-format-string
    code = request.POST.get("code")
    eval(f"value={code}")
    return code


def view_literal():
    # ok: user-eval-format-string
    eval("1 + 1")
    return 1


def view_format_literal():
    # ok: user-eval-format-string
    eval("value=%s" % "1")
    return 1


def view_plain():
    # ok: user-eval-format-string
    result = "1 + 1"
    return result
