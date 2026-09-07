# Flask send_file with a route-controlled filename.
#
# The filename comes from the URL, so ../ in it reads any file. The rule
# binds the route variable and the send_file call, so the finding lands
# on the send_file line. A constant file (or a sanitized name) is the ok.
import flask


@app.route("/files/<filename>")
def serve_a(filename):
    # ruleid: avoid_send_file_without_path_sanitization
    return flask.send_file(filename)


@app.route("/dl/<filename>")
def serve_b(filename):
    # ruleid: avoid_send_file_without_path_sanitization
    return flask.send_file(filename, as_attachment=True)


@app.route("/get/<filename>")
def serve_c(filename):
    # ruleid: avoid_send_file_without_path_sanitization
    return flask.send_file(filename, download_name="f.txt")


@app.route("/fixed")
def serve_fixed():
    # ok: avoid_send_file_without_path_sanitization
    return flask.send_file("static/report.txt")


@app.route("/safe/<filename>")
def serve_safe(filename):
    import os
    # ok: avoid_send_file_without_path_sanitization
    return flask.send_file(os.path.basename(filename))


def helper():
    # ok: avoid_send_file_without_path_sanitization
    return flask.send_file("static/report.txt")
