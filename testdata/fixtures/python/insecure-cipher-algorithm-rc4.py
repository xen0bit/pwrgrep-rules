# ARC4 (RC4) has serious keystream weaknesses; use AES instead.
# Flag fully qualified ARC4.new(...) under either namespace.
import Crypto.Cipher.AES
import Cryptodome.Cipher.AES


def flag_rc4():
    # ruleid: insecure-cipher-algorithm-rc4
    cipher = Crypto.Cipher.ARC4.new(key)
    # ruleid: insecure-cipher-algorithm-rc4
    cipher = Crypto.Cipher.ARC4.new(secret)
    # ruleid: insecure-cipher-algorithm-rc4
    cipher = Cryptodome.Cipher.ARC4.new(key)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-rc4
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_GCM)
    # ok: insecure-cipher-algorithm-rc4
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_CBC, iv)
    # ok: insecure-cipher-algorithm-rc4
    cipher = Cryptodome.Cipher.AES.new(key)
