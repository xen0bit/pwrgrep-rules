# DES and Triple-DES are brute-forceable; use AES instead.
# Flag fully qualified DES.new(...) and DES3.new(...).
import Crypto.Cipher.AES
import Cryptodome.Cipher.AES


def flag_des():
    # ruleid: insecure-cipher-algorithm-des
    cipher = Crypto.Cipher.DES.new(key)
    # ruleid: insecure-cipher-algorithm-des
    cipher = Crypto.Cipher.DES3.new(key, Crypto.Cipher.DES3.MODE_CBC, iv)
    # ruleid: insecure-cipher-algorithm-des
    cipher = Cryptodome.Cipher.DES.new(key)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-des
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_GCM)
    # ok: insecure-cipher-algorithm-des
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_CBC, iv)
    # ok: insecure-cipher-algorithm-des
    cipher = Cryptodome.Cipher.AES.new(key)
