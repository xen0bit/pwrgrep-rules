# IDEA dates to 1991 with a 64-bit block size; modern ciphers are
# safer. Flag algorithms.IDEA(...) inside a Cipher; AES is the fix.
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes


def flag_idea():
    # ruleid: insecure-cipher-algorithm-idea
    cipher = Cipher(algorithms.IDEA(key), mode=None)
    # ruleid: insecure-cipher-algorithm-idea
    cipher = Cipher(algorithms.IDEA(secret), mode=None)
    # ruleid: insecure-cipher-algorithm-idea
    cipher = Cipher(algorithms.IDEA(get_key()), mode=None)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-idea
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
    # ok: insecure-cipher-algorithm-idea
    cipher = Cipher(algorithms.AES(key), modes.GCM(iv))
    # ok: insecure-cipher-algorithm-idea
    cipher = Cipher(algorithms.Camellia(key), modes.CBC(iv))
