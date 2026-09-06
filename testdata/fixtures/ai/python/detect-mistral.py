# AI usage detection: Mistral
def vuln():
    # ruleid: detect-mistral
    import mistralai
    # ruleid: detect-mistral
    client = MistralClient(api_key="key")
    # ruleid: detect-mistral
    resp = client.chat(model="mistral-large", messages=[])


def safe():
    # ok: detect-mistral
    import os
    # ok: detect-mistral
    client = OtherClient()
    # ok: detect-mistral
    data = "safe string"
