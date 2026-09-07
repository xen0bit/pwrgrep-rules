# AI usage detection: HuggingFace
def vuln():
    # ruleid: detect-huggingface
    import huggingface_hub

    def inner():
        # ruleid: detect-huggingface
        import huggingface_hub

    try:
        # ruleid: detect-huggingface
        import huggingface_hub
    except ImportError:
        pass


def safe():
    # ok: detect-huggingface
    import os
    # ok: detect-huggingface
    import numpy
    # ok: detect-huggingface
    data = "safe string"
