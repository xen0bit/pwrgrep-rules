# MD5 is collision-broken; it must not be offered as a hash.
# Flag hashes.MD5() written as a full path; the SHA-2 family is the fix.
import cryptography.hazmat.primitives.hashes


def flag_md5():
    # ruleid: insecure-hash-algorithm-md5
    digest = cryptography.hazmat.primitives.hashes.MD5()
    # ruleid: insecure-hash-algorithm-md5
    chosen = cryptography.hazmat.primitives.hashes.MD5()
    # ruleid: insecure-hash-algorithm-md5
    other = cryptography.hazmat.primitives.hashes.MD5()


def safe_hashes():
    # ok: insecure-hash-algorithm-md5
    digest = cryptography.hazmat.primitives.hashes.SHA256()
    # ok: insecure-hash-algorithm-md5
    digest = cryptography.hazmat.primitives.hashes.SHA384()
    # ok: insecure-hash-algorithm-md5
    digest = cryptography.hazmat.primitives.hashes.SHA512()
