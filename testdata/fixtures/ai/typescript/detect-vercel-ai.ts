// AI usage detection: Vercel AI SDK
// ruleid: detect-vercel-ai
import "ai";
// ruleid: detect-vercel-ai
import "@ai-sdk";
// ruleid: detect-vercel-ai
const a = generateText({ model: "m" });
// ruleid: detect-vercel-ai
const b = generateText({ prompt: "hi" });
// ok: detect-vercel-ai
import fs from "fs";
// ok: detect-vercel-ai
const text = "plain string";
// ok: detect-vercel-ai
console.log("hello");
