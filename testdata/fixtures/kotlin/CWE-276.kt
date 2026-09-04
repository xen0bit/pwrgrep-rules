// CWE-276: a file the app writes is left readable by every app on the phone.
//
// MODE_WORLD_READABLE and MODE_WORLD_WRITEABLE drop the private-directory
// permissions Android gives an app by default. Anything written there is
// readable - or rewritable - by any other app installed, with no permission
// and no prompt. They have been deprecated since API 17 and throw since API 24
// for exactly this reason, and code that still names them is code that has
// been running with them for a decade.
package fixture

import android.content.Context

class Prefs(private val ctx: Context) {

    fun writeToken(token: String) {
        // ruleid: kotlin-world-readable-storage
        val out = ctx.openFileOutput("session", Context.MODE_WORLD_READABLE)
        out.write(token.toByteArray())
    }

    fun sharedPrefs() {
        // ruleid: kotlin-world-readable-storage
        val prefs = ctx.getSharedPreferences("session", Context.MODE_WORLD_WRITEABLE)
        prefs.edit().putString("k", "v").apply()
    }

    fun database() {
        // ruleid: kotlin-world-readable-storage
        ctx.openOrCreateDatabase("cache", Context.MODE_WORLD_READABLE, null)
    }

    fun privateFile() {
        // ok: kotlin-world-readable-storage
        val out = ctx.openFileOutput("session", Context.MODE_PRIVATE)
        out.close()
    }

    fun appendPrivate() {
        // ok: kotlin-world-readable-storage
        ctx.openFileOutput("log", Context.MODE_PRIVATE or Context.MODE_APPEND)
    }
}
