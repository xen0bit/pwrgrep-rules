# Django request data written into a generated CSV file.
#
# A cell starting with = + - @ becomes a formula in spreadsheet apps
# (CSV injection). The view's request parameter is the route-var source,
# and a bare parameter taints the whole function scope for this rule, so
# every writerow in a function with parameters fires: the safe cases
# below either write nothing or live in parameterless helpers. Literal
# rows carry no input.
import csv


def export_a(request):
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ruleid: csv-writer-injection
        writer.writerow([request.GET.get("name")])
    return 1


def export_b(request):
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ruleid: csv-writer-injection
        writer.writerows([[request.POST.get("name")]])
    return 1


def export_c(name):
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ruleid: csv-writer-injection
        writer.writerow([name])
    return 1


def export_plain(request):
    # ok: csv-writer-injection
    return 1


def write_header():
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ok: csv-writer-injection
        writer.writerow(["name"])
    return 1


def write_literal():
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ok: csv-writer-injection
        writer.writerows([["alice"]])
    return 1
