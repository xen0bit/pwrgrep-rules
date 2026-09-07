# Flask make_response reflecting request input.
#
# Only %- and .format/f-string interpolation into make_response is read
# (plain concatenation is not covered). The readings need the response
# as a bare statement tail, so each case responds bare and the finding
# lands on the request line that starts the match. A literal body is
# the ok.
import flask


def view_a():
    # ruleid: response-contains-unsanitized-input
    name = flask.request.args.get("name")
    flask.make_response(f"hi {name}")
    return name


def view_b():
    # ruleid: response-contains-unsanitized-input
    name = flask.request.args.get("name")
    flask.make_response("hi {}".format(name))
    return name


def view_c():
    # ruleid: response-contains-unsanitized-input
    name = flask.request.args.get("name")
    flask.make_response(f"{name}")
    return name


def view_literal():
    # ok: response-contains-unsanitized-input
    flask.make_response("hi")
    return "hi"


def view_concat():
    name = flask.request.args.get("name")
    # ok: response-contains-unsanitized-input
    flask.make_response("hi " + name)
    return name


def view_plain():
    # ok: response-contains-unsanitized-input
    return "hi"
