# Flask app.run bound to 0.0.0.0.
#
# Listening on all interfaces exposes the dev server publicly. A
# loopback host is the fix, and its run line is the ok.
import flask

app = flask.Flask(__name__)


def run_bad():
    # ruleid: avoid_app_run_with_bad_host
    app.run(host="0.0.0.0")
    return 1


def run_bad_two():
    # ruleid: avoid_app_run_with_bad_host
    app.run("myapp", "0.0.0.0")
    return 1


def run_bad_three(port):
    # ruleid: avoid_app_run_with_bad_host
    app.run(host="0.0.0.0", port=port)
    return 1


def run_local():
    # ok: avoid_app_run_with_bad_host
    app.run(host="127.0.0.1")
    return 1


def run_default():
    # ok: avoid_app_run_with_bad_host
    app.run()
    return 1


def run_port():
    # ok: avoid_app_run_with_bad_host
    app.run(port=5000)
    return 1
