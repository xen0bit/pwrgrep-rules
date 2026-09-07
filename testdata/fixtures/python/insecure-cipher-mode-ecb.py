# ECB encrypts equal blocks to equal ciphertext, leaking structure.
# Flag modes.ECB(...) written as a full path; CBC, GCM and CTR are fine.
import cryptography.hazmat.primitives.ciphers.modes
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms


def flag_ecb():
    # ruleid: insecure-cipher-mode-ecb
    cipher = Cipher(algorithms.AES(key), cryptography.hazmat.primitives.ciphers.modes.ECB(iv))
    # ruleid: insecure-cipher-mode-ecb
    cipher = Cipher(algorithms.AES(key), cryptography.hazmat.primitives.ciphers.modes.ECB(b"\x00" * 16))
    # ruleid: insecure-cipher-mode-ecb
    mode = cryptography.hazmat.primitives.ciphers.modes.ECB(get_iv())


def safe_modes():
    # ok: insecure-cipher-mode-ecb
    cipher = Cipher(algorithms.AES(key), cryptography.hazmat.primitives.ciphers.modes.CBC(iv))
    # ok: insecure-cipher-mode-ecb
    cipher = Cipher(algorithms.AES(key), cryptography.hazmat.primitives.ciphers.modes.GCM(iv))
    # ok: insecure-cipher-mode-ecb
    cipher = Cipher(algorithms.AES(key), cryptography.hazmat.primitives.ciphers.modes.CTR(iv))
