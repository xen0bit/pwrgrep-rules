// AI usage detection: OpenAI ChatClient
// ruleid: detect-openai
using OpenAI;
using System;
// ruleid: detect-openai
var client = new ChatClient("gpt-4o", "key");
// ruleid: detect-openai
var result = client.CompleteChat("Hello");
// ok: detect-openai
using System;
// ok: detect-openai
namespace Demo {}
// ok: detect-openai
class Safe {}
