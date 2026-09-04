// CWE-327: SHA-1.
//
// Collisions have been real since SHAttered in 2017 and cheap since 2020. A
// chosen-prefix collision is the one that breaks a signature - two documents,
// both meaningful, one digest - and that is what a 2020 result gave.
package fixture

import java.security.MessageDigest

class Fingerprints {

    fun of(body: ByteArray): ByteArray {
        // ruleid: use-of-sha1
        val md = MessageDigest.getInstance("SHA1")
        return md.digest(body)
    }

    fun dashed(body: ByteArray): ByteArray {
        // ruleid: use-of-sha1
        return MessageDigest.getInstance("SHA-1").digest(body)
    }

    fun helper(body: ByteArray): String {
        // ruleid: use-of-sha1
        return org.apache.commons.codec.digest.DigestUtils.sha1Hex(body)
    }

    fun modern(body: ByteArray): ByteArray {
        // ok: use-of-sha1
        return MessageDigest.getInstance("SHA-256").digest(body)
    }

    fun stillFine(body: ByteArray): ByteArray {
        // ok: use-of-sha1
        return MessageDigest.getInstance("SHA-512").digest(body)
    }
}
