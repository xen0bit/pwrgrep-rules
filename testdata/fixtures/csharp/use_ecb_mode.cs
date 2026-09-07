// use_ecb_mode: ECB encrypts equal blocks equally, leaking the plaintext's
// shape. Use CBC or GCM with a random IV instead.
using System.Security.Cryptography;

namespace Fixture {
    public class Crypto {
        public void Vuln(Aes aes) {
            // ruleid: use_ecb_mode
            aes.Mode = CipherMode.ECB;
        }

        public byte[] Vuln2(Aes aes, byte[] plain) {
        // ruleid: use_ecb_mode
            return aes.EncryptEcb(plain, PaddingMode.PKCS7);
        }

        public byte[] Vuln3(Aes aes, byte[] cipher) {
// ruleid: use_ecb_mode
            return aes.DecryptEcb(cipher, PaddingMode.PKCS7);
        }

        // ok: use_ecb_mode
        public void Safe(Aes aes) {
            aes.Mode = CipherMode.CBC;
        }

        // ok: use_ecb_mode
        public byte[] Plain(Aes aes, byte[] plain, byte[] iv) {
            return aes.EncryptCbc(plain, iv);
        }
    }
}
