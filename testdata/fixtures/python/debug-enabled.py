# Flask app running with debug=True.
#
# Debug mode enables the interactive debugger (remote code execution via
# the console) and must never ship. The rule only reads files importing
# flask. debug=False (or no flag) is the ok.
import flask

app = flask.Flask(__name__)


def run_debug():
    # ruleid: debug-enabled
    app.run(debug=True)
    return 1


def run_debug_two():
    # ruleid: debug-enabled
    app.run(host="127.0.0.1", debug=True)
    return 1


def run_debug_three(port):
    # ruleid: debug-enabled
    app.run(port, debug=True)
    return 1


def run_nodebug():
    # ok: debug-enabled
    app.run(debug=False)
    return 1


def run_plain():
    # ok: debug-enabled
    app.run()
    return 1


def run_port():
    # ok: debug-enabled
    app.run(port=5000)
    return 1
