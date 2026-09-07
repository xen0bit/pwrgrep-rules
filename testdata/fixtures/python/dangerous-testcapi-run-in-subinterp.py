# _testcapi.run_in_subinterp runs its argument as Python in another
# interpreter. Handing it request data is remote code execution. Flag
# payloads reached by a request value; constant snippets are fine.
import flask

app = flask.Flask(__name__)


@app.route("/run/<name>")
def run(name):
    # ruleid: dangerous-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp(name)
    return "ok"


@app.route("/src")
def src():
    snippet = flask.request.args.get("snippet")
    # ruleid: dangerous-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp(snippet)
    return "ok"


@app.route("/form")
def form():
    snippet = flask.request.form.get("snippet")
    # ruleid: dangerous-testcapi-run-in-subinterp
    test.support.run_in_subinterp(snippet)
    return "ok"


def safe_constant():
    # ok: dangerous-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp("print(1)")
    # ok: dangerous-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp("x = 1")
    # ok: dangerous-testcapi-run-in-subinterp
    test.support.run_in_subinterp("y = 2")
