# Django eval of request data.
#
# Evaluating caller input runs attacker-chosen code. The multi-statement
# readings need the eval as a bare statement tail (an assigned or
# returned eval only matches the single-statement direct forms), so the
# variable-mediated cases below call eval bare and the finding lands on
# the request line that starts the match. Evaluating a literal is the ok.
def view_a(request):
    # ruleid: user-eval
    code = request.GET.get("code")
    eval(code)
    return code


def view_b(request):
    # ruleid: user-eval
    result = eval(request.GET["code"])
    return result


def view_c(request):
    # ruleid: user-eval
    code = request.POST.get("code")
    eval(code, {})
    return code


def view_literal():
    # ok: user-eval
    eval("1 + 1")
    return 1


def view_name():
    name = "1 + 1"
    # ok: user-eval
    eval(name)
    return name


def view_plain():
    # ok: user-eval
    result = "1 + 1"
    return result
