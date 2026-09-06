# CWE-798: Hardcoded credential — a secret literal is written into the source.
#
# A password or API key written as a string literal is in every checkout, every
# binary and every log. It cannot be rotated without a release. Read it from
# the environment or a vault instead, or leave the placeholder empty.
import os

# ruleid: python-hardcoded-credential
PASSWORD = "hunter2"
# ruleid: python-hardcoded-credential
api_key = "AKIAIOSFODNN7EXAMPLE"
# ruleid: python-hardcoded-credential
secret = "s3cr3t-value-123"
# ruleid: python-hardcoded-credential
TOKEN = "ghp_1234567890abcdef"
# ruleid: python-hardcoded-credential
pwd = "my-password-123"


def with_env():
    # ok: python-hardcoded-credential
    password = os.environ.get("PASSWORD")
    # ok: python-hardcoded-credential
    api_key = os.getenv("API_KEY")
    # ok: python-hardcoded-credential
    secret = get_secret()
    # ok: python-hardcoded-credential
    token = ""
    # ok: python-hardcoded-credential
    pwd = None
