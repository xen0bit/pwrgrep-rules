// CWE-22: an archive entry names where it goes.
//
// A zip entry's name is a path chosen by whoever built the archive, and
// nothing in the format forbids `../`. `File(target, entry.name)` therefore
// resolves outside the directory the app was extracting into, and on Android
// that reaches the app's own private data directory - a downloaded update that
// overwrites `shared_prefs/auth.xml` or drops a .dex into the code cache.
//
// The check that makes this safe is a comparison: resolve the destination and
// confirm it still starts with the target directory. It is a comparison rather
// than a call, which is why a method that does it is left alone as a whole
// rather than line by line.
package fixture

import java.io.File
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

class Update {

    fun extract(zip: ZipFile, target: File) {
        for (entry in zip.entries()) {
            // ruleid: kotlin-archive-entry-path-not-checked
            val out = File(target, entry.name)
            out.parentFile?.mkdirs()
        }
    }

    fun stream(zis: ZipInputStream, target: File) {
        var entry = zis.nextEntry
        while (entry != null) {
            // ruleid: kotlin-archive-entry-path-not-checked
            File(target, entry.name).writeBytes(zis.readBytes())
            entry = zis.nextEntry
        }
    }

    fun checked(zip: ZipFile, target: File) {
        for (entry in zip.entries()) {
            // ok: kotlin-archive-entry-path-not-checked
            val out = File(target, entry.name)
            if (!out.canonicalPath.startsWith(target.canonicalPath)) {
                throw SecurityException("entry escapes the target directory")
            }
        }
    }

    fun listing(zip: ZipFile) {
        for (entry in zip.entries()) {
            // ok: kotlin-archive-entry-path-not-checked
            println(entry.name)
        }
    }
}
