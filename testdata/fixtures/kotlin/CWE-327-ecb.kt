// CWE-327: ECB.
//
// Every block is encrypted independently, so two identical plaintext blocks
// give two identical ciphertext blocks and the structure of the data survives
// the encryption. The classic demonstration is a bitmap - encrypt it in ECB
// and you can still see the picture.
package fixture

import javax.crypto.Cipher

class Boxes {

    fun legacy(): Cipher {
        // ruleid: ecb-cipher
        val cipher: Cipher = Cipher.getInstance("AES/ECB/PKCS5Padding")
        return cipher
    }

    fun untyped(): Cipher {
        // ruleid: ecb-cipher
        val cipher = Cipher.getInstance("DES/ECB/NoPadding")
        return cipher
    }

    fun mutable(): Cipher {
        // ruleid: ecb-cipher
        var cipher = Cipher.getInstance("AES/ECB/PKCS7Padding")
        return cipher
    }

    fun chained(): Cipher {
        // ok: ecb-cipher
        val cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        return cipher
    }

    fun authenticated(): Cipher {
        // ok: ecb-cipher
        val cipher: Cipher = Cipher.getInstance("AES/GCM/NoPadding")
        return cipher
    }
}
