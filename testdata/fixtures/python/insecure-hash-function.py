"""insecure-hash-function: hashlib.new() with MD4/MD5.

hashlib.new("md5") positionally or via name= is reported; SHA-256 and
variable algorithms are not.
"""
import hashlib


def digest_md5(data):
    # ruleid: insecure-hash-function
    return hashlib.new("md5", data)


def digest_md4_name(data):
    # ruleid: insecure-hash-function
    return hashlib.new(data, name="md4")


def digest_sha256(data):
    # ok: insecure-hash-function
    return hashlib.new("sha256", data)


def digest_named(algo, data):
    # ok: insecure-hash-function
    return hashlib.new(algo, data)
