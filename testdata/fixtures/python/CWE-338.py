# CWE-338: `random` where the value is meant to be unguessable.
#
# Every draw here is `random`, and most of them are correct: a shuffle, a
# jitter, a sample of test data. What separates the findings from the rest is
# the name the result is given - a `token` or a `nonce` is something an
# attacker would like to predict, and 624 consecutive outputs of a Mersenne
# Twister are enough to predict all of them.
import random
import secrets


def issue():
    # ruleid: python-weak-random
    session_token = random.getrandbits(128)
    # ruleid: python-weak-random
    nonce = random.randint(0, 2**64)
    # ruleid: python-weak-random
    reset_code = random.choice("0123456789")
    return session_token, nonce, reset_code


def issue_properly():
    # ok: python-weak-random
    session_token = secrets.token_hex(16)
    # ok: python-weak-random
    nonce = secrets.randbelow(2**64)
    # ok: python-weak-random
    reset_code = secrets.choice("0123456789")
    return session_token, nonce, reset_code


def ordinary_uses():
    # ok: python-weak-random
    deck = random.shuffle([1, 2, 3])
    # ok: python-weak-random
    backoff = random.uniform(0, 1)
    # ok: python-weak-random
    sample_row = random.choice(rows)
    return deck, backoff, sample_row
