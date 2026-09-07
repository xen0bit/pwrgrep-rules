# A JWT payload is only base64: whatever goes into jwt.encode can be
# read by anyone holding the token. Flag encoding a function argument
# (caller-chosen data); encoding locally built data is fine.
import jwt


def encode_user(user):
    # ruleid: jwt-python-exposed-data
    return jwt.encode(user, key)


def encode_profile(profile):
    # ruleid: jwt-python-exposed-data
    token = jwt.encode(profile, key, algorithm="HS256")
    return token


def encode_again(data, extra):
    # ruleid: jwt-python-exposed-data
    return jwt.encode(data, key)


def safe_local():
    # ok: jwt-python-exposed-data
    return jwt.encode({"role": "admin"}, key)


def safe_no_params():
    # ok: jwt-python-exposed-data
    return jwt.encode({}, key)


def safe_decode_only(token):
    # ok: jwt-python-exposed-data
    return jwt.decode(token, key, algorithms=["HS256"])
