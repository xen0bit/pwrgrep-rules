# CWE-306: Missing Authentication for Critical Function
#
# Views that handle sensitive operations but have no @login_required (or
# equivalent) are reachable by unauthenticated users. Flask's @app.route
# on its own does not enforce authentication — the view must be decorated.
# The fix is to add @login_required above the route.
from flask import Flask, request

app = Flask(__name__)

# ruleid: python-missing-auth
@app.route('/admin')
def admin_panel():
    return "secret admin data"

# ruleid: python-missing-auth
@app.route('/transfer', methods=['POST'])
def transfer():
    amount = request.form.get('amount')
    return f"transferred {amount}"

# ruleid: python-missing-auth
@bp.route('/sensitive')
def sensitive_data():
    return "sensitive"

# ok: python-missing-auth
@app.route('/admin')
@login_required
def admin_panel_secure():
    return "secret admin data"

# ok: python-missing-auth
@app.route('/profile')
@login_required
def profile():
    return "user profile"

# ok: python-missing-auth
def helper_function():
    return "not a route"

# ok: python-missing-auth
def another_helper(x):
    return x + 1
