# A password default shows up in tracebacks, docs and introspection.
# Flag non-empty password defaults; an empty (or no) default forces
# the caller to choose.
# ruleid: hardcoded-password-default-argument
def connect(password="s3cret"):
    return login(password)


# ruleid: hardcoded-password-default-argument
def login(password="change-me"):
    return login(password)


# ruleid: hardcoded-password-default-argument
def auth(user, password="hunter2"):
    return login(password)


# ok: hardcoded-password-default-argument
def safe_empty(user, password=""):
    return login(password)


# ok: hardcoded-password-default-argument
def safe_none(user, password=None):
    return login(password)


# ok: hardcoded-password-default-argument
def safe_other(user, username="admin"):
    return login(username)
