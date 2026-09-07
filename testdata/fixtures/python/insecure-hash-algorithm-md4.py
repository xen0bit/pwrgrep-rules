# MD4 is collision-broken; use SHA-256 instead.
# Flag fully qualified MD4.new(...) under either namespace.
import Crypto.Hash.SHA256
import Cryptodome.Hash.SHA256


def flag_md4():
    # ruleid: insecure-hash-algorithm-md4
    h = Crypto.Hash.MD4.new()
    # ruleid: insecure-hash-algorithm-md4
    h = Crypto.Hash.MD4.new(data)
    # ruleid: insecure-hash-algorithm-md4
    h = Cryptodome.Hash.MD4.new(data)


def safe_hashes():
    # ok: insecure-hash-algorithm-md4
    h = Crypto.Hash.SHA256.new()
    # ok: insecure-hash-algorithm-md4
    h = Crypto.Hash.SHA256.new(data)
    # ok: insecure-hash-algorithm-md4
    h = Cryptodome.Hash.SHA256.new(data)
