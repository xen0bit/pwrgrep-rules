# DSA below 2048 bits is brute-forceable. Flag generate with a small
# bits, keyword or positional; 2048+ is the fix.
import Crypto.PublicKey.DSA
import Cryptodome.PublicKey.DSA


def flag_small():
    # ruleid: insufficient-dsa-key-size
    key = Crypto.PublicKey.DSA.generate(1024)
    # ruleid: insufficient-dsa-key-size
    key = Crypto.PublicKey.DSA.generate(bits=1024)
    # ruleid: insufficient-dsa-key-size
    key = Cryptodome.PublicKey.DSA.generate(1024)


def safe_size():
    # ok: insufficient-dsa-key-size
    key = Crypto.PublicKey.DSA.generate(2048)
    # ok: insufficient-dsa-key-size
    key = Crypto.PublicKey.DSA.generate(bits=2048)
    # ok: insufficient-dsa-key-size
    key = Cryptodome.PublicKey.DSA.generate(2048)
