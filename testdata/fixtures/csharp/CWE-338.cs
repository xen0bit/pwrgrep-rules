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
    }
}
