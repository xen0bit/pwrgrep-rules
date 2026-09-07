# Django request data used as an index into globals().
#
# Looking up a global by a caller-chosen name calls attacker-chosen
# code. The whole lookup-and-call is one multi-statement match, so the
# finding lands on the first line that takes request data. The fix never
# indexes globals() with input; dispatching through an allowlist (or a
# literal name) is the ok.
def view_a(request):
    # ruleid: globals-misuse-code-execution
    name = request.GET.get("name")
    func = globals().get(name)
    func()


def view_b(request):
    # ruleid: globals-misuse-code-execution
    name = request.GET["name"]
    func = globals()[name]
    func()


def view_c(request):
    # ruleid: globals-misuse-code-execution
    name = request.POST.get("name")
    func = globals().get("prefix_%s" % name)
    func()


def view_allowlist(request):
    name = request.GET.get("name")
    allowed = {"hello": say_hello, "bye": say_bye}
    # ok: globals-misuse-code-execution
    func = allowed.get(name)
    func()


def view_literal():
    # ok: globals-misuse-code-execution
    func = globals().get("say_hello")
    func()


def say_hello():
    # ok: globals-misuse-code-execution
    return "hello"


def say_bye():
    return "bye"
