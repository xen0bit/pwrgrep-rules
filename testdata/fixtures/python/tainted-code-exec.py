# Lambda eval/exec of event-tainted code.
#
# The `event` object carries caller input. Evaluating it runs
# attacker-chosen code. Fixed code evaluates only literals.
def handler(event, context):
    code = event.get("code")
    # ruleid: tainted-code-exec
    eval(code)


def handler_direct(event, context):
    # ruleid: tainted-code-exec
    eval(event["code"])


def handler_exec(event, context):
    code = event.get("code")
    # ruleid: tainted-code-exec
    exec(code)


def handler_literal(event, context):
    # ok: tainted-code-exec
    eval("1 + 1")


def handler_exec_literal(event, context):
    # ok: tainted-code-exec
    exec("x = 1")


def unrelated():
    # ok: tainted-code-exec
    eval("len('abc')")
