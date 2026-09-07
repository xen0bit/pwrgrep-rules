"""unverified-jwt-decode: JWT decoded with signature verification off.

options={"verify_signature": False}, inline or via a variable, is
reported; verification left on (or options without the flag) is not.
"""
import jwt


def read_unsigned(token):
    # ruleid: unverified-jwt-decode
    return jwt.decode(token, options={"verify_signature": False}, algorithms=["HS256"])


def read_unsigned_trailing(token):
    # ruleid: unverified-jwt-decode
    return jwt.decode(token, "secret", options={"alg": "HS256", "verify_signature": False}, algorithms=["HS256"])


def read_via_opts(token):
    # ruleid: unverified-jwt-decode
    opts = {"verify_signature": False}
    return jwt.decode(token, options=opts, algorithms=["HS256"])


def read_verified(token):
    # ok: unverified-jwt-decode
    return jwt.decode(token, options={"verify_signature": True}, algorithms=["HS256"])


def read_default(token):
    # ok: unverified-jwt-decode
    return jwt.decode(token, algorithms=["HS256"])
