# AI usage detection: Gemini
def vuln():
    # ruleid: detect-gemini
    import google.generativeai

    def inner():
        # ruleid: detect-gemini
        import google.generativeai

    try:
        # ruleid: detect-gemini
        import google.generativeai
    except ImportError:
        pass


def safe():
    # ok: detect-gemini
    import os
    # ok: detect-gemini
    import numpy
    # ok: detect-gemini
    data = "safe string"
