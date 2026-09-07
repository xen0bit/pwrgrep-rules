# MD2 is collision-broken; use SHA-256 instead.
# Flag fully qualified MD2.new(...) under either namespace.
import Crypto.Hash.SHA256
import Cryptodome.Hash.SHA256


def flag_md2():
    # ruleid: insecure-hash-algorithm-md2
    h = Crypto.Hash.MD2.new()
    # ruleid: insecure-hash-algorithm-md2
    h = Crypto.Hash.MD2.new(data)
    # ruleid: insecure-hash-algorithm-md2
    h = Cryptodome.Hash.MD2.new(data)


def safe_hashes():
    # ok: insecure-hash-algorithm-md2
    h = Crypto.Hash.SHA256.new()
    # ok: insecure-hash-algorithm-md2
    h = Crypto.Hash.SHA256.new(data)
    # ok: insecure-hash-algorithm-md2
    h = Cryptodome.Hash.SHA256.new(data)
