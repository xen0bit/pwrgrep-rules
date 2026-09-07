# MD5 as a password hash falls to brute force and collisions. Flag a
# *password* function reached by an MD5 value; SHA-256 (or a password
# hasher) is the fix.
import hashlib


def store_password(digest):
    db.save(digest)


def flag_md5(pw):
    h = hashlib.md5(pw.encode())
    # ruleid: md5-used-as-password
    store_password(h.hexdigest())
    # ruleid: md5-used-as-password
    store_password(hashlib.md5(pw).digest())
    # ruleid: md5-used-as-password
    store_password(hashlib.md5(salt + pw).hexdigest())


def safe_sha256(pw):
    h = hashlib.sha256(pw.encode())
    # ok: md5-used-as-password
    store_password(h.hexdigest())
    # ok: md5-used-as-password
    print(hashlib.md5(pw).hexdigest())
    # ok: md5-used-as-password
    store_password("md5")
