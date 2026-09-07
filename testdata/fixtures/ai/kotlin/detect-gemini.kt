// AI usage detection: Gemini via google.ai
// ruleid: detect-gemini
import com.google.ai
import kotlin.String
// ruleid: detect-gemini
val model = GenerativeModel("gemini-pro", "key")
// ruleid: detect-gemini
val other = GenerativeModel("gemini-flash", "key")
// ok: detect-gemini
import kotlin.collections
// ok: detect-gemini
val text = "plain string"
// ok: detect-gemini
val x = 1
