# AI tooling detection: LangChain
def vuln():
    # ruleid: detect-langchain
    import langchain
    # ruleid: detect-langchain
    import langchain_openai
    # ruleid: detect-langchain
    llm = ChatOpenAI(model="gpt-4")
    # ruleid: detect-langchain
    agent = Ollama(model="llama3")


def safe():
    # ok: detect-langchain
    import os
    # ok: detect-langchain
    client = OtherClient()
    # ok: detect-langchain
    data = "safe string"
