# Django subprocess with the request object reaching the call.
#
# Per GUIDE, the route variable is the source here: any use of the view's
# request parameter inside a non-literal subprocess call is the finding.
# A literal command (or argv list) carries no input and is the ok.
import subprocess


def view_a(request):
    # ruleid: subprocess-injection
    subprocess.run(request.GET.get("cmd"))
    return 1


def view_b(name):
    # ruleid: subprocess-injection
    subprocess.call(name)
    return 1


def view_c(request):
    # ruleid: subprocess-injection
    subprocess.Popen(request.POST.get("cmd"), shell=True)
    return 1


def view_literal(request):
    # ok: subprocess-injection
    subprocess.run("uptime")
    return 1


def view_argv(request):
    # ok: subprocess-injection
    subprocess.run(["uptime"])
    return 1


def view_argv_var(request):
    cmd = ["uptime"]
    # ok: subprocess-injection
    subprocess.run(cmd)
    return 1
