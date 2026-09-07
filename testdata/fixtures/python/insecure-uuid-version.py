# UUIDv1 embeds the MAC address and timestamp: guests can guess other
# users' tokens. Flag uuid1(); uuid4 (random) is the fix.
import uuid


def flag_v1():
    # ruleid: insecure-uuid-version
    token = uuid.uuid1()
    # ruleid: insecure-uuid-version
    token = uuid.uuid1(node=None)
    # ruleid: insecure-uuid-version
    key = uuid.uuid1().hex


def safe_random():
    # ok: insecure-uuid-version
    token = uuid.uuid4()
    # ok: insecure-uuid-version
    token = uuid.uuid3(uuid.NAMESPACE_URL, "https://example.com")
    # ok: insecure-uuid-version
    token = uuid.uuid5(uuid.NAMESPACE_DNS, "example.com")
