# Airflow renders bash_command with Jinja and runs it in a shell:
# formatting data into it is shell injection. Flag formatted commands;
# a constant command is the fix.
import airflow.operators.bash_operator


def flag_formatted(name):
    # ruleid: formatted-string-bashoperator
    task = airflow.operators.bash_operator.BashOperator(task_id="t", bash_command=f"echo {name}")
    # ruleid: formatted-string-bashoperator
    task = airflow.operators.bash_operator.BashOperator(task_id="t", bash_command="echo %s" % name)
    # ruleid: formatted-string-bashoperator
    task = airflow.operators.bash_operator.BashOperator(task_id="t", bash_command="echo {}".format(name))


def safe_constant():
    # ok: formatted-string-bashoperator
    task = airflow.operators.bash_operator.BashOperator(task_id="t", bash_command="echo hello")
    # ok: formatted-string-bashoperator
    task = airflow.operators.bash_operator.BashOperator(task_id="t", bash_command="ls -l /data")
    # ok: formatted-string-bashoperator
    task = airflow.operators.bash_operator.BashOperator(task_id="t", bash_command="uptime")
