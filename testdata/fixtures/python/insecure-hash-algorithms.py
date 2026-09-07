# SHA1 is collision-broken; it must not be offered as a hash.
# Flag hashes.SHA1(...) written as a full path; the SHA-2 family is fix.
import cryptography.hazmat.primitives.hashes


def flag_sha1():
    # ruleid: insecure-hash-algorithm-sha1
    digest = cryptography.hazmat.primitives.hashes.SHA1()
    # ruleid: insecure-hash-algorithm-sha1
    chosen = cryptography.hazmat.primitives.hashes.SHA1(backend)
    # ruleid: insecure-hash-algorithm-sha1
    other = cryptography.hazmat.primitives.hashes.SHA1()


def safe_hashes():
    # ok: insecure-hash-algorithm-sha1
    digest = cryptography.hazmat.primitives.hashes.SHA256()
    # ok: insecure-hash-algorithm-sha1
    digest = cryptography.hazmat.primitives.hashes.SHA384()
    # ok: insecure-hash-algorithm-sha1
    digest = cryptography.hazmat.primitives.hashes.SHA512()
