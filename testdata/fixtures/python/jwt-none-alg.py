# 'none' is not a signature: anyone can mint tokens the server accepts.
# Flag jwt.encode(..., algorithm="none") and jwt.decode(...,
# algorithms=[..., "none", ...]); real algorithms are the fix.
import jwt


def flag_none():
    # ruleid: jwt-python-none-alg
    token = jwt.encode(payload, algorithm="none")
    # ruleid: jwt-python-none-alg
    data = jwt.decode(token, algorithms=["none"])
    # ruleid: jwt-python-none-alg
    data = jwt.decode(token, key="", algorithms=["HS256", "none"])


def safe_alg():
    # ok: jwt-python-none-alg
    token = jwt.encode(payload, key, algorithm="HS256")
    # ok: jwt-python-none-alg
    data = jwt.decode(token, key, algorithms=["HS256"])
    # ok: jwt-python-none-alg
    data = jwt.decode(token, key, algorithms=["RS256"])
