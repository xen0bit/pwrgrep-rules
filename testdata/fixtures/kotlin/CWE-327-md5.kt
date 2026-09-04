// CWE-327: MD5.
//
// Practical collisions since 2004 and chosen-prefix collisions since 2019, so
// two documents with the same digest can be produced to order and a signature
// over one is a signature over the other. It survives in code because it is
// fast and short and because nothing goes wrong until somebody makes it.
package fixture

import java.security.MessageDigest

class Digests {

    fun sign(body: ByteArray): ByteArray {
        // ruleid: use-of-md5
        val md = MessageDigest.getInstance("MD5")
        return md.digest(body)
    }

    fun checksum(body: ByteArray): ByteArray {
        // ruleid: use-of-md5
        return MessageDigest.getInstance("MD5").digest(body)
    }

    fun helper(body: ByteArray): ByteArray {
        // ruleid: use-of-md5
        return org.apache.commons.codec.digest.DigestUtils.getMd5Digest().digest(body)
    }

    fun modern(body: ByteArray): ByteArray {
        // ok: use-of-md5
        val md = MessageDigest.getInstance("SHA-256")
        return md.digest(body)
    }
}
