# Flask removed/deprecated APIs.
#
# These were removed from Flask years ago; calling them breaks on
# upgrade. Current APIs (test_client, open_resource) are the oks.
import flask


def view_a(app):
    # ruleid: flask-deprecated-apis
    app.open_session()
    return 1


def view_b(app):
    # ruleid: flask-deprecated-apis
    app.save_session()
    return 1


def view_c(app):
    # ruleid: flask-deprecated-apis
    app.make_null_session()
    return 1


def view_current(app):
    # ok: flask-deprecated-apis
    client = app.test_client()
    return client


def view_resource(app):
    # ok: flask-deprecated-apis
    data = app.open_resource("schema.sql")
    return data


def view_plain(app):
    # ok: flask-deprecated-apis
    return app.name
