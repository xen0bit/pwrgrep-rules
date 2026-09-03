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
