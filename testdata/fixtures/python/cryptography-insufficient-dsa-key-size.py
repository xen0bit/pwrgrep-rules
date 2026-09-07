# DSA below 2048 bits is brute-forceable. Flag generate_private_key
# with a small key_size, keyword or positional; 2048+ is the fix.
import cryptography.hazmat.primitives.asymmetric.dsa


def flag_small():
    # ruleid: insufficient-dsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.dsa.generate_private_key(key_size=1024)
    # ruleid: insufficient-dsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.dsa.generate_private_key(key_size=512)
    # ruleid: insufficient-dsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.dsa.generate_private_key(1024)


def safe_size():
    # ok: insufficient-dsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.dsa.generate_private_key(key_size=2048)
    # ok: insufficient-dsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.dsa.generate_private_key(key_size=3072)
    # ok: insufficient-dsa-key-size
    key = cryptography.hazmat.primitives.asymmetric.dsa.generate_private_key(2048)
