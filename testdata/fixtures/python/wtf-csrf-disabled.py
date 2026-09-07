# Flask WTF CSRF explicitly disabled.
#
# WTF_CSRF_ENABLED=False removes CSRF checks from every form. Per GUIDE
# this is outside/in_files_without territory, but the rule reads the
# assignment value directly and focuses it, so the finding lands on the
# False. Leaving the default on (or True) is the ok.
import flask

app = flask.Flask(__name__)

# ruleid: flask-wtf-csrf-disabled
app.config["WTF_CSRF_ENABLED"] = False

# ruleid: flask-wtf-csrf-disabled
app.config.WTF_CSRF_ENABLED = False

# ruleid: flask-wtf-csrf-disabled
app.config.update(WTF_CSRF_ENABLED=False)

# ok: flask-wtf-csrf-disabled
app.config["WTF_CSRF_ENABLED"] = True

# ok: flask-wtf-csrf-disabled
app.config["SECRET_KEY"] = "s3cr3t"

# ok: flask-wtf-csrf-disabled
DEBUG = False
