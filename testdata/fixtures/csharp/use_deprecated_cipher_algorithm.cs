// use_deprecated_cipher_algorithm: DES, TripleDES and RC2 are broken.
// Use AES-GCM instead. (The rule names any `.Create()` call; the fixture
// keeps to the weak algorithms it is about.)
using System.Security.Cryptography;

namespace Fixture {
    public class Crypto {
        public void Vuln() {
            // ruleid: use_deprecated_cipher_algorithm
            var d = DES.Create();
            d.GenerateKey();
        }

        public void Vuln2() {
        // ruleid: use_deprecated_cipher_algorithm
            var t = TripleDES.Create();
            t.GenerateKey();
        }

        // ok: use_deprecated_cipher_algorithm
        public void Safe() {
            var a = Aes.Create();
            a.GenerateKey();
        }

        // ok: use_deprecated_cipher_algorithm
        public void Plain() {
            var r = new Random();
            r.Next();
        }
    }
}
