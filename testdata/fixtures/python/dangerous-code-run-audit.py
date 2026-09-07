# code.InteractiveConsole runs whatever string it is handed as Python.
# Flag computed (non-literal) input; constant snippets cannot carry
# an attack.
import code

console = code.InteractiveConsole()
other = code.InteractiveInterpreter()


def flag_dynamic(snippet):
    # ruleid: dangerous-interactive-code-run-audit
    console.push(snippet)
    # ruleid: dangerous-interactive-code-run-audit
    console.runsource(snippet)
    # ruleid: dangerous-interactive-code-run-audit
    console.runcode(code.compile_command(snippet))


def safe_literal():
    # ok: dangerous-interactive-code-run-audit
    console.push("1 + 1")
    # ok: dangerous-interactive-code-run-audit
    console.runsource("x = 1")
    # ok: dangerous-interactive-code-run-audit
    console.runcode(code.compile_command("y = 2"))
