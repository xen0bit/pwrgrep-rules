# RC2 is obsolete with a small effective key; use AES instead.
# Flag fully qualified ARC2.new(...) under either namespace.
import Crypto.Cipher.AES
import Cryptodome.Cipher.AES


def flag_rc2():
    # ruleid: insecure-cipher-algorithm-rc2
    cipher = Crypto.Cipher.ARC2.new(key)
    # ruleid: insecure-cipher-algorithm-rc2
    cipher = Crypto.Cipher.ARC2.new(secret, Crypto.Cipher.ARC2.MODE_CBC, iv)
    # ruleid: insecure-cipher-algorithm-rc2
    cipher = Cryptodome.Cipher.ARC2.new(key)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-rc2
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_GCM)
    # ok: insecure-cipher-algorithm-rc2
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_CBC, iv)
    # ok: insecure-cipher-algorithm-rc2
    cipher = Cryptodome.Cipher.AES.new(key)
