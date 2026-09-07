# _xxsubinterpreters.run_string runs its argument as Python in another
# interpreter. Handing it request data is remote code execution. Flag
# payloads reached by a request value; constant snippets are fine.
import flask

app = flask.Flask(__name__)


@app.route("/run/<name>")
def run(name):
    # ruleid: dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(0, name)
    return "ok"


@app.route("/src")
def src():
    snippet = flask.request.args.get("snippet")
    # ruleid: dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(1, snippet)
    return "ok"


@app.route("/form")
def form():
    snippet = flask.request.form.get("snippet")
    # ruleid: dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(2, snippet)
    return "ok"


def safe_constant():
    # ok: dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(0, "print(1)")
    # ok: dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(1, "x = 1")
    # ok: dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(2, "y = 2")
