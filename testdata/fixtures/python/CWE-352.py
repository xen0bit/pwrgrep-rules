# CWE-352: CSRF — Django forms without csrf_token are vulnerable.
#
# A POST form rendered by Django that does not include {% csrf_token %}
# can be submitted from an attacker's site. The browser will send the
# victim's cookies, so the server cannot tell the request was forged.
# GET forms are not state-changing and need no token; POST/PUT/DELETE do.

# ruleid: python-csrf-django
FORM_VULN_1 = '<form method="POST" action="/transfer"><input name="amount"><input type="submit"></form>'
# ruleid: python-csrf-django
FORM_VULN_2 = "<form method='POST' action='/update'><input name='email'><button>Submit</button></form>"
# ruleid: python-csrf-django
FORM_VULN_3 = '<form method="post" action="/delete"><input type="hidden" name="id" value="1"><button>Delete</button></form>'

# ok: python-csrf-django
FORM_OK_1 = '<form method="POST" action="/transfer">{% csrf_token %}<input name="amount"><input type="submit"></form>'
# ok: python-csrf-django
FORM_OK_2 = '<form method="POST" action="/update"><input name="email">{% csrf_token %}<button>Go</button></form>'

# ok: python-csrf-django — GET forms do not need CSRF protection
FORM_GET_OK = '<form method="GET" action="/search"><input name="q"><button>Search</button></form>'
