// CWE-22: a path is built out of a name another app chose.
//
// An exported activity or a broadcast receiver takes an Intent from whoever
// sent it, and the extras in it are that app's strings. `File(filesDir, name)`
// with `name` set to `../../databases/accounts.db` resolves outside the
// directory the app meant and hands back a File the app will happily read or
// delete. Nothing between the intent and the open objects.
package fixture

import android.app.Activity
import android.content.Intent
import java.io.File
import java.io.FileOutputStream

class Files : Activity() {

    fun export(intent: Intent) {
        val name = intent.getStringExtra("name")
        // ruleid: kotlin-path-from-untrusted-input
        val out = File(filesDir, name)
        out.writeText("x")
    }

    fun importFrom(intent: Intent) {
        val path = intent.getStringExtra("path")
        // ruleid: kotlin-path-from-untrusted-input
        FileOutputStream("/data/local/" + path).use { it.write(0) }
    }

    fun open(intent: Intent) {
        val leaf = File(intent.getStringExtra("name")).name
        // ok: kotlin-path-from-untrusted-input
        val out = File(filesDir, leaf)
        out.delete()
    }

    fun cache() {
        // ok: kotlin-path-from-untrusted-input
        val out = File(cacheDir, "thumbnails")
        out.mkdirs()
    }
}
