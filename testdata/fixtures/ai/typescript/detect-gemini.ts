// AI usage detection: Gemini
// ruleid: detect-gemini
import "@google/generative-ai";
// ruleid: detect-gemini
import { GoogleGenerativeAI } from "@google/generative-ai";
// ruleid: detect-gemini
const genAI = new GoogleGenerativeAI("key");
// ruleid: detect-gemini
const model = genAI.getGenerativeModel({ model: "gemini-pro" });
// ok: detect-gemini
import fs from "fs";
// ok: detect-gemini
const text = "plain string";
// ok: detect-gemini
console.log("hello");
