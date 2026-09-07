# AES with an empty key encrypts with a key everyone knows. Flag the
# empty first argument; a caller-chosen or random key is the fix.
from Crypto.Cipher import AES


def flag_empty():
    # ruleid: empty-aes-key
    cipher = AES.new("")
    # ruleid: empty-aes-key
    cipher = AES.new("", AES.MODE_ECB)
    # ruleid: empty-aes-key
    cipher = AES.new("", nonce=b"12345678")


def safe_key():
    import os
    # ok: empty-aes-key
    cipher = AES.new(os.urandom(16))
    # ok: empty-aes-key
    cipher = AES.new("sixteen byte key")
    # ok: empty-aes-key
    cipher = AES.new(key)
