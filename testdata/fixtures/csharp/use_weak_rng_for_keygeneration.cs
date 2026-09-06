// use_weak_rng_for_keygeneration: System.Random is predictable, so keys
// derived from it can be recomputed. Use RandomNumberGenerator instead. The
// rule also flags the raw-key cipher constructions on their own; the safe
// case below fills a key it never hands to one (see the rule header).
using System;
using System.Security.Cryptography;

namespace Fixture {
    public class Crypto {
        public void Vuln() {
            var rng = new System.Random();
            byte[] key = new byte[32];
            rng.NextBytes(key);
            // ruleid: use_weak_rng_for_keygeneration
            var aes = new AesGcm(key);
            aes.Clear();
        }

        public void Vuln2() {
            var rng = new System.Random();
            byte[] key = new byte[16];
            rng.NextBytes(key);
            // ruleid: use_weak_rng_for_keygeneration
            var aes = new AesCcm(key);
            aes.Clear();
        }

        // ok: use_weak_rng_for_keygeneration
        public string Safe() {
            byte[] key = new byte[32];
            RandomNumberGenerator.Fill(key);
            return Convert.ToBase64String(key);
        }

        // ok: use_weak_rng_for_keygeneration
        public int Plain() {
            var rng = new System.Random();
            return rng.Next();
        }
    }
}
