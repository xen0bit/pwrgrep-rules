# Flask CORS with wildcard origin and credentials.
#
# supports_credentials=True together with origins="*" lets any site read
# credentialed responses. This is scan_regex (decorator text, not code),
# so each finding lands on its decorator line. A named origin (or no
# credentials) is the fix, and its decorator is the ok.
import flask

from flask_cors import CORS, cross_origin


@app.route("/a")
# ruleid: flask-cors-misconfiguration
@cross_origin(origin="x", origins="*", supports_credentials=True, methods=["GET"])
def view_a():
    return "a"


@app.route("/b")
# ruleid: flask-cors-misconfiguration
@cross_origin(origin="y", origins="*", supports_credentials=True, headers=["Content-Type"])
def view_b():
    return "b"


# ruleid: flask-cors-misconfiguration
cors = CORS(origin="z", supports_credentials=True, origins="*", resources={"/x": {"origins": "y"}})


@app.route("/ok")
# ok: flask-cors-misconfiguration
@cross_origin(origin="x", origins="https://x.com", supports_credentials=True, methods=["GET"])
def view_ok():
    return "ok"


@app.route("/plain")
# ok: flask-cors-misconfiguration
@cross_origin(origins="https://x.com", methods=["GET"])
def view_plain():
    return "plain"


@app.route("/none")
def view_none():
    # ok: flask-cors-misconfiguration
    return "none"
