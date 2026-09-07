# RSA below 3072 bits is brute-forceable. Flag generate with a small
# bits, keyword or positional; 3072+ is the fix.
import Crypto.PublicKey.RSA
import Cryptodome.PublicKey.RSA


def flag_small():
    # ruleid: insufficient-rsa-key-size
    key = Crypto.PublicKey.RSA.generate(1024)
    # ruleid: insufficient-rsa-key-size
    key = Crypto.PublicKey.RSA.generate(bits=2048)
    # ruleid: insufficient-rsa-key-size
    key = Cryptodome.PublicKey.RSA.generate(2048)


def safe_size():
    # ok: insufficient-rsa-key-size
    key = Crypto.PublicKey.RSA.generate(3072)
    # ok: insufficient-rsa-key-size
    key = Crypto.PublicKey.RSA.generate(bits=4096)
    # ok: insufficient-rsa-key-size
    key = Cryptodome.PublicKey.RSA.generate(3072)
