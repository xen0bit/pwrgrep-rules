// CWE-323: GCM, and the nonce that must never repeat.
//
// This is an audit finding rather than a bug: GCM is the right thing to reach
// for. What it reports is that somebody now has to check the nonce.
//
// GCM fails catastrophically on reuse, not gracefully. Two messages under one
// key and one nonce leak the xor of their plaintexts, and they leak the
// authentication subkey - so from then on every message under that key can be
// forged. The nonce need not be secret and must never repeat.
package fixture

import javax.crypto.Cipher
import javax.crypto.spec.GCMParameterSpec

class Sealed {

    fun cipher(): Cipher {
        // ruleid: gcm-detection
        return Cipher.getInstance("AES/GCM/NoPadding", "BC")
    }

    fun spec(nonce: ByteArray): GCMParameterSpec {
        // ruleid: gcm-detection
        return GCMParameterSpec(128, nonce)
    }

    fun chained(): Cipher {
        // ok: gcm-detection
        return Cipher.getInstance("AES/CBC/PKCS5Padding", "BC")
    }
}
