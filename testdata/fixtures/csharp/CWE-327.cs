// CWE-327/328: Weak hash — MD5/SHA1 have practical collisions.
// MD5, SHA1, or HashAlgorithm.Create("MD5") are flagged; they are
// unsafe for signatures or fingerprints. Fix with SHA256 or stronger.
using System.Security.Cryptography;

namespace Fixture {
    public class Hashing {
        public byte[] Fingerprint(byte[] data) {
            // ruleid: csharp-weak-hash-algorithm
            using (var h = MD5.Create()) {
                return h.ComputeHash(data);
            }
        }

        public byte[] Legacy(byte[] data) {
            // ruleid: csharp-weak-hash-algorithm
            using (var h = SHA1.Create()) {
                return h.ComputeHash(data);
            }
        }

        public byte[] Named(byte[] data) {
            // ruleid: csharp-weak-hash-algorithm
            using (var h = HashAlgorithm.Create("MD5")) {
                return h.ComputeHash(data);
            }
        }

        public byte[] Explicit(byte[] data) {
            // ruleid: csharp-weak-hash-algorithm
            using (var h = new MD5CryptoServiceProvider()) {
                return h.ComputeHash(data);
            }
        }

        public byte[] Strong(byte[] data) {
            // ok: csharp-weak-hash-algorithm
            using (var h = SHA256.Create()) {
                return h.ComputeHash(data);
            }
        }
    }
}
