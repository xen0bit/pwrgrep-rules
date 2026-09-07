# click.echo(click.style(...)) is click.secho(...) with extra steps.
# Flag the nested call; the shortcut, a plain echo, or styling without
# echoing are all fine.
import click


def flag_nested():
    # ruleid: use-click-secho
    click.echo(click.style("hello", fg="red"))
    # ruleid: use-click-secho
    click.echo(click.style("bye", bg="blue", bold=True))
    # ruleid: use-click-secho
    click.echo(click.style(name, fg="green"))


def safe_shortcut():
    # ok: use-click-secho
    click.secho("hello", fg="red")
    # ok: use-click-secho
    click.echo("hello")
    # ok: use-click-secho
    click.style("hello", fg="red")
