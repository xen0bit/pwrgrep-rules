# SHA (SHA-0/SHA-1) is collision-broken; use SHA-256 instead.
# Flag fully qualified SHA.new(...) under either namespace.
import Crypto.Hash.SHA256
import Cryptodome.Hash.SHA256


def flag_sha():
    # ruleid: insecure-hash-algorithm-sha1
    h = Crypto.Hash.SHA.new()
    # ruleid: insecure-hash-algorithm-sha1
    h = Crypto.Hash.SHA.new(data)
    # ruleid: insecure-hash-algorithm-sha1
    h = Cryptodome.Hash.SHA.new(data)


def safe_hashes():
    # ok: insecure-hash-algorithm-sha1
    h = Crypto.Hash.SHA256.new()
    # ok: insecure-hash-algorithm-sha1
    h = Crypto.Hash.SHA256.new(data)
    # ok: insecure-hash-algorithm-sha1
    h = Cryptodome.Hash.SHA256.new(data)
