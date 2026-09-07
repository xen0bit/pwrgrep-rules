// AI usage detection: Gemini
// ruleid: detect-gemini
import GoogleGenerativeAI
import Foundation
// ruleid: detect-gemini
let model = GenerativeModel(name: "gemini-pro", apiKey: "key")
// ruleid: detect-gemini
let other = GenerativeModel(name: "gemini-flash", apiKey: "key")
// ok: detect-gemini
import Dispatch
// ok: detect-gemini
let text = "plain string"
// ok: detect-gemini
let x = 1
