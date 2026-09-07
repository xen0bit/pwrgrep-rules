# Blowfish has a 64-bit block size (SWEET32); use AES instead.
# Flag fully qualified Blowfish.new(...) under either namespace.
import Crypto.Cipher.AES
import Cryptodome.Cipher.AES


def flag_blowfish():
    # ruleid: insecure-cipher-algorithm-blowfish
    cipher = Crypto.Cipher.Blowfish.new(key)
    # ruleid: insecure-cipher-algorithm-blowfish
    cipher = Crypto.Cipher.Blowfish.new(secret, Crypto.Cipher.Blowfish.MODE_CBC, iv)
    # ruleid: insecure-cipher-algorithm-blowfish
    cipher = Cryptodome.Cipher.Blowfish.new(key)


def safe_ciphers():
    # ok: insecure-cipher-algorithm-blowfish
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_GCM)
    # ok: insecure-cipher-algorithm-blowfish
    cipher = Crypto.Cipher.AES.new(key, Crypto.Cipher.AES.MODE_CBC, iv)
    # ok: insecure-cipher-algorithm-blowfish
    cipher = Cryptodome.Cipher.AES.new(key)
