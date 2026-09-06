# CWE-1039: AI Usage Detection - Anthropic
# Detect usage of Anthropic API

def vuln_anthropic():
    # ruleid: detect-anthropic
    import anthropic
    # ruleid: detect-anthropic
    from anthropic import Anthropic
    # ruleid: detect-anthropic
    client = Anthropic(api_key="test")
    # ruleid: detect-anthropic
    client.messages.create(model="claude-3", messages=[{"role": "user", "content": "hi"}])

def safe_anthropic():
    # ok: detect-anthropic
    import os
    # ok: detect-anthropic
    client = OtherClient()
    # ok: detect-anthropic
    data = "safe"
