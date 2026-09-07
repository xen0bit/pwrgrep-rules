# Encryption without authentication lets attackers flip bits in the
# ciphertext. Flag Cipher(...) in a non-authenticated mode; the HMAC
# step that authenticates the ciphertext is not flagged.
import hmac

from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes


def flag_no_mac():
    # ruleid: crypto-mode-without-authentication
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
    data = cipher.encryptor().update(plaintext)
    # ruleid: crypto-mode-without-authentication
    cipher = Cipher(algorithms.AES(key), modes.CTR(iv))
    data = cipher.encryptor().update(plaintext)
    # ruleid: crypto-mode-without-authentication
    cipher = Cipher(algorithms.Camellia(key), modes.CFB(iv))
    data = cipher.encryptor().update(plaintext)


def safe_with_mac(ciphertext, signature):
    # ok: crypto-mode-without-authentication
    tag = hmac.HMAC(key, hashes.SHA256())
    tag.update(ciphertext)
    # ok: crypto-mode-without-authentication
    verifier = hmac.HMAC(key, hashes.SHA256())
    # ok: crypto-mode-without-authentication
    verifier.verify(signature)
