# A JWT payload is only base64, so a password inside it ships to the
# client in recoverable form. Flag encoding a dict literal that carries
# a password; payloads without one are fine. (The rule matches the
# comma-adjacent spelling ,"password": — password first, last, or spaced
# after the comma does not match.)
import jwt


def flag_direct(name, pw, role):
    # ruleid: jwt-python-exposed-credentials
    token = jwt.encode({"user":name,"password":pw,"role":role},key)
    return token


def safe_no_password(name, role):
    # ok: jwt-python-exposed-credentials
    token = jwt.encode({"user":name,"role":role},key)
    return token


def flag_direct_extra(uid, pw, exp):
    # ruleid: jwt-python-exposed-credentials
    token = jwt.encode({"id":uid,"password":pw,"exp":exp},key)
    return token


def safe_subject(uid):
    # ok: jwt-python-exposed-credentials
    token = jwt.encode({"sub":uid},key)
    return token


def flag_direct_flag(n, p):
    # ruleid: jwt-python-exposed-credentials
    data = jwt.encode({"name":n,"password":p,"admin":False},key)
    return data


def safe_variable(name):
    payload = {"user": name}
    # ok: jwt-python-exposed-credentials
    token = jwt.encode(payload,key)
    return token
