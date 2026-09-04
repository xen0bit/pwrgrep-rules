// CWE-326: the RSA key is too short.
//
// NIST has said 2048 bits since 2015. A short key does not fail - it works
// exactly as well as a long one, right up until somebody factors the modulus,
// and then every signature it ever made can be forged and every message it
// ever received can be read.
//
// The finding lands on the size rather than on the generator, because the size
// is the half a reader has to change.
package fixture

import java.security.KeyPairGenerator

class Keys {

    fun legacy(): KeyPairGenerator {
        val gen = KeyPairGenerator.getInstance("RSA")
        // ruleid: use-of-weak-rsa-key
        gen.initialize(1024)
        return gen
    }

    fun older(): KeyPairGenerator {
        val gen = KeyPairGenerator.getInstance("RSA")
        val label = "legacy"
        // ruleid: use-of-weak-rsa-key
        gen.initialize(512)
        return gen
    }

    fun modern(): KeyPairGenerator {
        val gen = KeyPairGenerator.getInstance("RSA")
        // ok: use-of-weak-rsa-key
        gen.initialize(2048)
        return gen
    }

    fun strong(): KeyPairGenerator {
        val gen = KeyPairGenerator.getInstance("RSA")
        // ok: use-of-weak-rsa-key
        gen.initialize(4096)
        return gen
    }
}
