# Encryption without authentication lets attackers flip bits in the
# ciphertext. Flag AES.new(...) with a mode; the HMAC step that
# authenticates the ciphertext is not flagged.
from Crypto.Cipher import AES
from Crypto.Hash import HMAC


def flag_no_mac():
    # ruleid: crypto-mode-without-authentication
    cipher = AES.new(key, AES.MODE_CBC, iv)
    data = cipher.encrypt(plaintext)
    # ruleid: crypto-mode-without-authentication
    cipher = AES.new(key, AES.MODE_CTR, nonce=b"12345678")
    data = cipher.encrypt(plaintext)
    # ruleid: crypto-mode-without-authentication
    cipher = AES.new(key, AES.MODE_CFB, iv)
    data = cipher.encrypt(plaintext)


def safe_with_mac(ciphertext):
    # ok: crypto-mode-without-authentication
    tag = HMAC.new(key)
    tag.update(ciphertext)
    # ok: crypto-mode-without-authentication
    verifier = HMAC.new(key)
    # ok: crypto-mode-without-authentication
    digest = verifier.digest()
