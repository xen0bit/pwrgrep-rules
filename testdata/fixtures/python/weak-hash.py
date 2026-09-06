import hashlib


def fingerprint(data):
    # ruleid: python-weak-hash
    return hashlib.md5(data).hexdigest()


def tag(data):
    # ruleid: python-weak-hash
    return hashlib.sha1(data).hexdigest()


def checksum(data):
    # A hash used to shard or deduplicate is not a signature, and the standard
    # library has a way to say so.
    # ok: python-weak-hash
    return hashlib.md5(data, usedforsecurity=False).hexdigest()


def digest(data):
    # ok: python-weak-hash
    return hashlib.sha256(data).hexdigest()
def extra_md5(data):
    # ruleid: python-weak-hash
    return hashlib.md5(data).digest()

def extra_sha1(data):
    # ruleid: python-weak-hash
    return hashlib.sha1(data).digest()

def safe_sha512(data):
    # ok: python-weak-hash
    return hashlib.sha512(data).hexdigest()
