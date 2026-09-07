// AI usage detection: Mistral
// ruleid: detect-mistral
import "@mistralai";
// ruleid: detect-mistral
import MistralClient from "@mistralai";
// ruleid: detect-mistral
const mc = new MistralClient("key");
// ruleid: detect-mistral
const r = client.chat({ model: "mistral-large" });
// ok: detect-mistral
import fs from "fs";
// ok: detect-mistral
const text = "plain string";
// ok: detect-mistral
console.log("hello");
