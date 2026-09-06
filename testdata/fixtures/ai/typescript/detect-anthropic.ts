// AI usage detection: Anthropic
// ruleid: detect-anthropic
import "@anthropic-ai";
// ruleid: detect-anthropic
import Anthropic from "@anthropic-ai";
// ruleid: detect-anthropic
const client = new Anthropic({ apiKey: "key" });
// ruleid: detect-anthropic
const msg = anthropic.messages.create({ model: "claude", messages: [] });
// ok: detect-anthropic
import fs from "fs";
// ok: detect-anthropic
const text = "plain string";
// ok: detect-anthropic
console.log("hello");
