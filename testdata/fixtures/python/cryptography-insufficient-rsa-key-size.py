# RSA below 2048 bits is brute-forceable. Flag generate_private_key
# with a small key_size, keyword or positional; 2048+ is the fix.
import cryptography.hazmat.primitives.asymmetric.rsa


def flag_small():
    # ruleid: insufficient-rsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key(public_exponent=65537, key_size=1024)
    # ruleid: insufficient-rsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key(public_exponent=65537, key_size=512)
    # ruleid: insufficient-rsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key(65537, 1024)


def safe_size():
    # ok: insufficient-rsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key(public_exponent=65537, key_size=2048)
    # ok: insufficient-rsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key(public_exponent=65537, key_size=4096)
    # ok: insufficient-rsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key(65537, 2048)
