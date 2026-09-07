# Small elliptic curves are brute-forceable. Flag generate_private_key
# over a small curve (the rule reports the call); naming a curve outside
# key generation is fine.
import cryptography.hazmat.primitives.asymmetric.ec


def flag_small():
    curve = cryptography.hazmat.primitives.asymmetric.ec.SECP112R1()
    # ruleid: insufficient-ec-key-size
    key = cryptography.hazmat.primitives.asymmetric.ec.generate_private_key(curve)


def flag_small_160():
    curve = cryptography.hazmat.primitives.asymmetric.ec.SECP160R1()
    # ruleid: insufficient-ec-key-size
    key = cryptography.hazmat.primitives.asymmetric.ec.generate_private_key(curve)


def flag_small_192():
    curve = cryptography.hazmat.primitives.asymmetric.ec.SECP192R1()
    # ruleid: insufficient-ec-key-size
    key = cryptography.hazmat.primitives.asymmetric.ec.generate_private_key(curve)


def safe_reference():
    # ok: insufficient-ec-key-size
    curve = cryptography.hazmat.primitives.asymmetric.ec.SECP256R1()
    # ok: insufficient-ec-key-size
    curve = cryptography.hazmat.primitives.asymmetric.ec.SECP384R1()
    # ok: insufficient-ec-key-size
    other = cryptography.hazmat.primitives.asymmetric.ec.SECP521R1()
