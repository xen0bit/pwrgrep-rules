# Blowfish uses a 64-bit block size, which leaks plaintext in long
# sessions (SWEET32). Flag algorithms.Blowfish(...) inside a Cipher;
# AES is the fix.
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes


def flag_blowfish():
    # ruleid: insecure-cipher-algorithm-blowfish
    cipher = Cipher(algorithms.Blowfish(key), mode=None)
    # ruleid: insecure-cipher-algorithm-blowfish
    cipher = Cipher(algorithms.Blowfish(secret), mode=None)
    # ruleid: insecure-cipher-algorithm-blowfish
    cipher = Cipher(algorithms.Blowfish(get_key()), mode=None)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-blowfish
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
    # ok: insecure-cipher-algorithm-blowfish
    cipher = Cipher(algorithms.AES(key), modes.GCM(iv))
    # ok: insecure-cipher-algorithm-blowfish
    cipher = Cipher(algorithms.TripleDES(key), modes.CBC(iv))
