// CWE-704: the digest is rendered with a conversion that loses information.
//
// `Integer.toHexString(0x0a)` is "a", not "0a". A digest rendered a byte at a
// time with it comes out shorter than 32 characters whenever a byte is below
// 0x10 - which for a random digest is about one byte in sixteen - and two
// different digests can render to the same string. Comparing those strings is
// what a signature check usually comes down to, so the collision the hash was
// chosen to prevent is reintroduced by the formatting.
package fixture

import java.security.MessageDigest

class Hex {

    fun render(body: ByteArray): String {
        val md = MessageDigest.getInstance("SHA-256")
        val out = StringBuilder()
        for (b in md.digest(body)) {
            // ruleid: bad-hexa-conversion
            out.append(Integer.toHexString(b.toInt() and 0xff))
        }
        return out.toString()
    }

    fun padded(body: ByteArray): String {
        val md = MessageDigest.getInstance("SHA-256")
        // ok: bad-hexa-conversion
        return md.digest(body).joinToString("") { "%02x".format(it) }
    }

    fun counted(n: Int): String {
        // ok: bad-hexa-conversion
        return n.toString(16)
    }
}
