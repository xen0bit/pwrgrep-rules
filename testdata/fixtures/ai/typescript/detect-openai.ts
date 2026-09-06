// AI usage detection: OpenAI
// ruleid: detect-openai
import "openai";
// ruleid: detect-openai
import OpenAI from "openai";
// ruleid: detect-openai
const client = new OpenAI({ apiKey: "key" });
// ruleid: detect-openai
const r = client.chat.completions.create({ model: "gpt-4", messages: [] });
// ok: detect-openai
import fs from "fs";
// ok: detect-openai
const text = "plain string";
// ok: detect-openai
console.log("hello");
