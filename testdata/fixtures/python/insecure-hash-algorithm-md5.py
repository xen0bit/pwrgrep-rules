# MD5 is collision-broken; use SHA-256 instead.
# Flag fully qualified MD5.new(...) under either namespace.
import Crypto.Hash.SHA256
import Cryptodome.Hash.SHA256


def flag_md5():
    # ruleid: insecure-hash-algorithm-md5
    h = Crypto.Hash.MD5.new()
    # ruleid: insecure-hash-algorithm-md5
    h = Crypto.Hash.MD5.new(data)
    # ruleid: insecure-hash-algorithm-md5
    h = Cryptodome.Hash.MD5.new(data)


def safe_hashes():
    # ok: insecure-hash-algorithm-md5
    h = Crypto.Hash.SHA256.new()
    # ok: insecure-hash-algorithm-md5
    h = Crypto.Hash.SHA256.new(data)
    # ok: insecure-hash-algorithm-md5
    h = Cryptodome.Hash.SHA256.new(data)
