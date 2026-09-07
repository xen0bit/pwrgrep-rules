# sh runs real commands: interpolating values into the argument builds
# a new command line out of data. Flag concatenation, .format and
# f-strings in sh calls; fixed strings and plain variables are fine.
import sh


def flag_concat(name, greeting):
    # ruleid: string-concat
    sh.echo("hello " + name)
    # ruleid: string-concat
    sh.ls(greeting.format(name))
    # ruleid: string-concat
    sh.cat(f"/data/{name}")


def safe_fixed(name):
    # ok: string-concat
    sh.echo("hello")
    # ok: string-concat
    sh.ls(name)
    # ok: string-concat
    sh.cat("/etc/hosts")
