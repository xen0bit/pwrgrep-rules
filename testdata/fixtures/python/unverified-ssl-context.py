# Replacing the default HTTPS context with an unverified one turns
# off certificate checks process-wide. Flag both spellings; building
# a verified context is the fix.
import ssl


def flag_unverified():
    # ruleid: unverified-ssl-context
    ctx = ssl._create_unverified_context()
    # ruleid: unverified-ssl-context
    ctx = ssl._create_unverified_context(cert_reqs=ssl.CERT_NONE)
    # ruleid: unverified-ssl-context
    ssl._create_default_https_context = ssl._create_unverified_context


def safe_verified():
    # ok: unverified-ssl-context
    ctx = ssl.create_default_context()
    # ok: unverified-ssl-context
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    # ok: unverified-ssl-context
    ctx = ssl._create_default_https_context()
