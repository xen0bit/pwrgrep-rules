// use_weak_rsa_encryption_padding: PKCS#1 v1.5 padding is vulnerable to
// Bleichenbacher oracles. Use OAEP instead.
using System.Security.Cryptography;

namespace Fixture {
    public class Crypto {
        public byte[] Vuln(RSA rsa, byte[] data) {
            var f = new RSAPKCS1KeyExchangeFormatter(rsa);
            // ruleid: use_weak_rsa_encryption_padding
            return f.CreateKeyExchange(data);
        }

        public byte[] Vuln2(RSA rsa, byte[] blob) {
            var d = new RSAPKCS1KeyExchangeDeformatter(rsa);
            // ruleid: use_weak_rsa_encryption_padding
            return d.DecryptKeyExchange(blob);
        }

        // ok: use_weak_rsa_encryption_padding
        public byte[] Safe(RSA rsa, byte[] data) {
            return rsa.Encrypt(data, RSAEncryptionPadding.OaepSHA256);
        }

        // ok: use_weak_rsa_encryption_padding
        public byte[] Plain(RSA rsa, byte[] cipher) {
            return rsa.Decrypt(cipher, RSAEncryptionPadding.OaepSHA256);
        }
    }
}
