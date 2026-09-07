# Flask app.run at top level instead of under __main__.
#
# A top-level app.run executes on import (and is ignored by the flask
# CLI); guarding it with `if __name__ == "__main__"` is the fix. The
# rule excludes runs inside functions and the main guard, so those run
# lines are the oks.
import flask

app = flask.Flask(__name__)

# ruleid: avoid_using_app_run_directly
app.run()

# ruleid: avoid_using_app_run_directly
app.run(port=5000)

# ruleid: avoid_using_app_run_directly
app.run(host="127.0.0.1")


def main():
    # ok: avoid_using_app_run_directly
    app.run()
    return 1


if __name__ == '__main__':
    # ok: avoid_using_app_run_directly
    app.run()


# ok: avoid_using_app_run_directly
VERSION = 1
