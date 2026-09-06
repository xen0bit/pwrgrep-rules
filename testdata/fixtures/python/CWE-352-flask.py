# CWE-352: CSRF — Flask WTF_CSRF_ENABLED disabled.
#
# When Flask-WTF's CSRF protection is turned off, every POST endpoint is
# vulnerable to cross-site request forgery. The protection is on by default;
# setting WTF_CSRF_ENABLED = False explicitly disables it.
# Vulnerable code sets the flag to False; safe code leaves it True or True by default.

from flask import Flask

app = Flask(__name__)

# ruleid: python-weak-csrf
app.config["WTF_CSRF_ENABLED"] = False

# ruleid: python-weak-csrf
app.config['WTF_CSRF_ENABLED'] = False

# ruleid: python-weak-csrf
WTF_CSRF_ENABLED = False

# ok: python-weak-csrf
app.config["WTF_CSRF_ENABLED"] = True

# ok: python-weak-csrf
app.config['WTF_CSRF_ENABLED'] = True

# ok: python-weak-csrf — default is enabled, no assignment
CSRF_ENABLED = True
