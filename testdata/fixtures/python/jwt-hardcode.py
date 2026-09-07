"""jwt-python-hardcoded-secret: literal JWT HMAC secret.

jwt.encode() with a string-literal secret is reported; a secret read
from the environment is not.
"""
import os

import jwt


def mint_hardcoded(user):
    # ruleid: jwt-python-hardcoded-secret
    return jwt.encode({"sub": user}, "hardcoded-secret", algorithm="HS256")


def mint_single_quoted(user):
    # ruleid: jwt-python-hardcoded-secret
    return jwt.encode({"sub": user}, 'another-secret', algorithm="HS256")


def mint_from_env(user):
    # ok: jwt-python-hardcoded-secret
    return jwt.encode({"sub": user}, os.environ["JWT_SECRET"], algorithm="HS256")


def mint_from_config(user, secret):
    # ok: jwt-python-hardcoded-secret
    return jwt.encode({"sub": user}, secret, algorithm="HS256")
