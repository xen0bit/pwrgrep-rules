# AI tooling detection: Tensorflow
def vuln():
    # ruleid: detect-tensorflow
    import tensorflow

    def inner():
        # ruleid: detect-tensorflow
        import tensorflow

    try:
        # ruleid: detect-tensorflow
        import tensorflow
    except ImportError:
        pass


def safe():
    # ok: detect-tensorflow
    import os
    # ok: detect-tensorflow
    import numpy
    # ok: detect-tensorflow
    data = "safe string"
