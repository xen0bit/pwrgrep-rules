# code.InteractiveConsole runs whatever string it is handed as Python.
# Handing it request data is remote code execution. Flag console input
# reached by a request value; constant snippets are fine.
import code

import flask

app = flask.Flask(__name__)
console = code.InteractiveConsole()


@app.route("/run/<name>")
def run(name):
    # ruleid: dangerous-interactive-code-run
    console.push(name)
    return "ok"


@app.route("/src")
def src():
    snippet = flask.request.args.get("snippet")
    # ruleid: dangerous-interactive-code-run
    console.runsource(snippet)
    return "ok"


@app.route("/compile")
def compile_view():
    snippet = flask.request.form.get("snippet")
    # ruleid: dangerous-interactive-code-run
    console.runcode(code.compile_command(snippet))
    return "ok"


def safe_constant():
    # ok: dangerous-interactive-code-run
    console.push("1 + 1")
    # ok: dangerous-interactive-code-run
    console.runsource("x = 1")
    # ok: dangerous-interactive-code-run
    console.runcode(code.compile_command("y = 2"))
