# Django custom expression calling as_sql.
#
# Dropping to raw SQL inside an expression bypasses the ORM's quoting,
# so Rosa-style injection checks must happen by hand. The finding lands
# on the as_sql call line.
import django.db.models


def render_a(expr, compiler, connection):
    # ruleid: custom-expression-as-sql
    sql = expr.as_sql(compiler, connection)
    return sql


def render_b(expr, compiler, connection):
    # ruleid: custom-expression-as-sql
    return expr.as_sql(compiler, connection)


def render_c(expr, compiler):
    # ruleid: custom-expression-as-sql
    out = expr.as_sql(compiler)
    return out


def compile_a(expr):
    # ok: custom-expression-as-sql
    sql = expr.compile()
    return sql


def plain(expr):
    # ok: custom-expression-as-sql
    text = str(expr)
    return text


def other(expr, compiler, connection):
    # ok: custom-expression-as-sql
    sql = expr.get_source_expressions()
    return sql
