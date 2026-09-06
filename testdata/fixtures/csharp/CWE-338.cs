// CWE-338/330: Predictable secret — System.Random is not cryptographic.
// new Random() is seeded from the clock, so its output is guessable.
// The rule flags that for secrets/tokens; fix with RandomNumberGenerator.
using System;
using System.Security.Cryptography;

namespace Fixture {
    public class Tokens {
        public string NewResetToken() {
            // ruleid: csharp-secret-from-a-predictable-source
            var rng = new Random();
            var bytes = new byte[32];
            rng.NextBytes(bytes);
            return Convert.ToBase64String(bytes);
        }

        public string SessionId() {
            // ruleid: csharp-secret-from-a-predictable-source
            var r = new Random(Environment.TickCount);
            return r.Next().ToString();
        }

        public string Token2() {
            // ruleid: csharp-secret-from-a-predictable-source
            var rr = new Random();
            return rr.NextBytes(new byte[16]).ToString();
        }

        public string Token3() {
            // ruleid: csharp-secret-from-a-predictable-source
            var x = new Random(123); return x.Next().ToString();
        }

        public int Jitter() {
            // ok: csharp-secret-from-a-predictable-source
            var r = new Random();
            return r.Next(0, 100);
        }

        public string Strong() {
            var bytes = new byte[32];
            // ok: csharp-secret-from-a-predictable-source
            RandomNumberGenerator.Fill(bytes);
            return Convert.ToBase64String(bytes);
        }

        public string Strong2() {
            var b = new byte[16];
            // ok: csharp-secret-from-a-predictable-source
            RandomNumberGenerator.GetBytes(b);
            return Convert.ToHexString(b);
        }
    }
}
