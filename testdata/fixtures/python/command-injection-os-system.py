# Django os.system with request data.
#
# The string is interpreted by /bin/sh, so caller input becomes shell
# syntax. The finding lands on the first line of the multi-statement
# match. A literal command is the ok.
import os


def view_a(request):
    # ruleid: command-injection-os-system
    os.system(request.GET.get("cmd"))
    return 1


def view_b(request):
    # ruleid: command-injection-os-system
    cmd = request.GET["cmd"]
    os.system(cmd)
    return 1


def view_c(request):
    # ruleid: command-injection-os-system
    cmd = request.POST.get("cmd")
    full = "run " + cmd
    os.system(full)
    return 1


def view_literal():
    # ok: command-injection-os-system
    os.system("uptime")
    return 1


def view_name():
    cmd = "uptime"
    # ok: command-injection-os-system
    os.system(cmd)
    return 1


def view_plain():
    # ok: command-injection-os-system
    x = 1
    return x
