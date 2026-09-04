// CWE-78: a shell command is assembled out of a string another app chose.
//
// `Runtime.exec("ping " + host)` with a single String argument is handed to a
// shell-like tokeniser, so a host of `x; rm -rf /sdcard` runs two commands.
// The array form does not tokenise, which is what makes it the fix - unless
// the array is `arrayOf("sh", "-c", command)`, which puts a shell back and is
// the same bug written out longer.
package fixture

import android.app.Activity
import android.content.Intent

class Shell : Activity() {

    fun ping(intent: Intent) {
        val host = intent.getStringExtra("host")
        // ruleid: kotlin-command-from-untrusted-input
        Runtime.getRuntime().exec("ping -c 1 " + host)
    }

    fun run(intent: Intent) {
        val cmd = intent.getStringExtra("cmd")
        // ruleid: kotlin-command-from-untrusted-input
        ProcessBuilder("sh", "-c", cmd).start()
    }

    fun version() {
        // ok: kotlin-command-from-untrusted-input
        Runtime.getRuntime().exec("getprop ro.build.version.release")
    }

    fun listing(intent: Intent) {
        val dir = intent.getStringExtra("dir")
        // ok: kotlin-command-from-untrusted-input
        java.io.File(dir).listFiles()
    }
}
