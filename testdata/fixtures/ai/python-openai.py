# CWE-1039: AI Usage Detection - OpenAI
# Detect usage of OpenAI API via import and client calls

def vuln_openai():
    # ruleid: detect-openai
    import openai
    # ruleid: detect-openai
    from openai import OpenAI
    # ruleid: detect-openai
    client = OpenAI(api_key="test")
    # ruleid: detect-openai
    client.chat.completions.create(model="gpt-4", messages=[])

def safe_openai():
    # ok: detect-openai
    import os
    # ok: detect-openai
    client = SomeOtherClient()
    # ok: detect-openai
    data = "safe string without ai marker"
