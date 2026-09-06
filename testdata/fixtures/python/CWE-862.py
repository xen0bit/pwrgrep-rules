# CWE-862: the route that knows who you are and not what you may do.
#
# Every handler here is behind @login_required, so python-missing-auth has
# nothing to say about any of them. What separates them is whether a role is
# checked as well: the first three trust any account that can log in, and the
# last three name the role they need.
from flask import Flask, request

app = Flask(__name__)
bp = Flask(__name__)


# ruleid: python-862-rbac
@app.route('/admin')
@login_required
def admin_panel():
    return "every user who can log in can read this"


# ruleid: python-862-rbac
@app.route('/transfer', methods=['POST'])
@login_required
def transfer():
    amount = request.form.get('amount')
    return f"transferred {amount}"


# ruleid: python-862-rbac
@bp.route('/sensitive')
@auth_required
def sensitive_data():
    return "sensitive"


# ok: python-862-rbac
@app.route('/admin-safe')
@login_required
@requires_roles('admin')
def admin_panel_safe():
    return "only an admin reaches this"


# ok: python-862-rbac
@app.route('/profile')
@login_required
@has_role('user')
def profile():
    return "user profile"


# ok: python-862-rbac
@app.route('/settings')
@login_required
@permission_required('settings.write')
def settings():
    return "settings"
