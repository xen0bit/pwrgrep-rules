// CWE-321: the key is in the app.
//
// A symmetric key or an initialisation vector written as a literal is the same
// key in every installed copy, and an APK is a zip file on a device the
// attacker owns. Whatever the cipher, encryption with a key everybody has is
// encoding.
//
// A fixed IV is the quieter half of the same mistake. It is not secret and
// does not need to be, but it does need to be different every time: with one
// constant IV, two messages with the same prefix produce the same ciphertext
// prefix, and in CBC that is enough to recover structure without the key at
// all.
package fixture

import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

class Box {

    fun key(): SecretKeySpec {
        // ruleid: kotlin-encryption-key-is-a-literal
        return SecretKeySpec("MySuperSecretKey".toByteArray(), "AES")
    }

    fun iv(): IvParameterSpec {
        // ruleid: kotlin-encryption-key-is-a-literal
        return IvParameterSpec("0000000000000000".toByteArray())
    }

    fun keyFromKeystore(): SecretKeySpec {
        // ok: kotlin-encryption-key-is-a-literal
        return SecretKeySpec(keystore.load("data"), "AES")
    }

    fun randomIv(): IvParameterSpec {
        // ok: kotlin-encryption-key-is-a-literal
        return IvParameterSpec(ByteArray(16).also { java.security.SecureRandom().nextBytes(it) })
    }

    private lateinit var keystore: Keystore
}
