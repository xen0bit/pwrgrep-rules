# CWE-327: Use of a Broken or Risky Cryptographic Algorithm
#
# hashlib.new lets the algorithm be chosen by a string. Passing "md5" or
# "sha1" there is the same break as hashlib.md5(); the two spellings need
# different patterns and so are separate rules. SHA-256 or SHA-3 is the fix.

import hashlib


def fingerprint(data):
    # ruleid: python-weak-hash3
    return hashlib.new("md5", data).hexdigest()


def tag(data):
    # ruleid: python-weak-hash3
    return hashlib.new("sha1", data).hexdigest()


def dynamic(algo, data):
    # ruleid: python-weak-hash3
    return hashlib.new("MD5", data).hexdigest()


def safe(data):
    # ok: python-weak-hash3
    return hashlib.new("sha256", data).hexdigest()


def safe2(data):
    # ok: python-weak-hash3
    return hashlib.sha256(data).hexdigest()


def safe_literal(data):
    # ok: python-weak-hash3
    return hashlib.new("sha3_256", data).hexdigest()
