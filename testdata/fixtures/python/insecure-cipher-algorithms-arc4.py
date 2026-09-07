# ARC4 has serious weaknesses in its initial keystream output.
# Flag algorithms.ARC4(...) inside a Cipher; AES and ChaCha20 are fine,
# and an ARC4 object never handed to a Cipher is out of scope.
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes


def flag_arc4():
    # ruleid: insecure-cipher-algorithm-arc4
    cipher = Cipher(algorithms.ARC4(key), mode=None)
    # ruleid: insecure-cipher-algorithm-arc4
    cipher = Cipher(algorithms.ARC4(secret), mode=None)
    # ruleid: insecure-cipher-algorithm-arc4
    cipher = Cipher(algorithms.ARC4(get_key()), mode=None)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-arc4
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
    # ok: insecure-cipher-algorithm-arc4
    cipher = Cipher(algorithms.ChaCha20(key, nonce), mode=None)
    # ok: insecure-cipher-algorithm-arc4
    unused = algorithms.ARC4(key)
