// CWE-327: NullCipher.
//
// It implements the Cipher interface and returns what it was given. It exists
// so a pipeline can be assembled before the real cipher is chosen, and every
// use of it in shipped code is that placeholder left in: the data goes out
// unencrypted and every call around it still reads as if it had not.
package fixture

import javax.crypto.Cipher
import javax.crypto.NullCipher

class Placeholder {

    fun cipher(): Cipher {
        // ruleid: no-null-cipher
        return NullCipher()
    }

    fun real(): Cipher {
        // ok: no-null-cipher
        return Cipher.getInstance("AES/GCM/NoPadding")
    }
}
