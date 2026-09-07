# Flask SECRET_KEY used as the Hashids salt.
#
# The secret key signs sessions; reusing it as a hash salt means a
# leaked hash oracle works against every use. The rule only reads files
# creating a Flask app. A random per-use salt is the fix.
import flask
import hashids

app = flask.Flask(__name__)


def make_a():
    # ruleid: hashids-with-flask-secret
    h = hashids.Hashids(app.config['SECRET_KEY'])
    return h


def make_b():
    # ruleid: hashids-with-flask-secret
    h = hashids.Hashids(salt=app.config['SECRET_KEY'])
    return h


def make_c():
    # ruleid: hashids-with-flask-secret
    h = hashids.Hashids(flask.current_app.config['SECRET_KEY'])
    return h


def make_random():
    # ok: hashids-with-flask-secret
    h = hashids.Hashids(salt="random-salt-value")
    return h


def make_env(secret):
    # ok: hashids-with-flask-secret
    h = hashids.Hashids(salt=secret)
    return h


def make_plain():
    # ok: hashids-with-flask-secret
    h = hashids.Hashids()
    return h
