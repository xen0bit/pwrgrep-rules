# XOR with a repeating key is trivially breakable; use AES instead.
# Flag fully qualified XOR.new(...) under either namespace.
import Crypto.Cipher.AES
import Cryptodome.Cipher.AES


def flag_xor():
    # ruleid: insecure-cipher-algorithm-xor
    cipher = Crypto.Cipher.XOR.new(key)
    # ruleid: insecure-cipher-algorithm-xor
    cipher = Crypto.Cipher.XOR.new(secret)
    # ruleid: insecure-cipher-algorithm-xor
    cipher = Cryptodome.Cipher.XOR.new(key)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-xor
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_GCM)
    # ok: insecure-cipher-algorithm-xor
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_CBC, iv)
    # ok: insecure-cipher-algorithm-xor
    cipher = Cryptodome.Cipher.AES.new(key)
