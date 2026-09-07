# Flask request data written into a generated CSV file.
#
# A cell starting with = + - @ becomes a formula in spreadsheet apps.
# Request accessors and route variables are the sources; like the
# Django twin, a bare parameter taints the whole function scope, so the
# safe cases write nothing or live in parameterless helpers.
import csv
import flask


@app.route("/export")
def export_a():
    name = flask.request.args.get("name")
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ruleid: csv-writer-injection
        writer.writerow([name])
    return "ok"


@app.route("/export/<name>")
def export_b(name):
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ruleid: csv-writer-injection
        writer.writerow([name])
    return "ok"


@app.route("/export2", methods=["POST"])
def export_c():
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ruleid: csv-writer-injection
        writer.writerows([[flask.request.form.get("name")]])
    return "ok"


@app.route("/plain")
def export_plain():
    # ok: csv-writer-injection
    return "ok"


def write_header():
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ok: csv-writer-injection
        writer.writerow(["name"])
    return "ok"


def write_literal():
    with open("out.csv", "w") as f:
        writer = csv.writer(f)
        # ok: csv-writer-injection
        writer.writerows([["alice"]])
    return "ok"
