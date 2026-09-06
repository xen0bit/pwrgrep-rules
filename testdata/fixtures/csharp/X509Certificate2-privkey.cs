// X509Certificate2-privkey: the PrivateKey property is obsolete and throws
// on newer runtimes. Use GetRSAPrivateKey (or GetECDsaPrivateKey) instead.
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

namespace Fixture {
    public class Certs {
        public void Vuln() {
            X509Certificate2 cert = GetCert();
            // ruleid: X509Certificate2-privkey
            var key = cert.PrivateKey;
            Use(key);
        }

        public void Vuln2(X509Certificate2Collection coll) {
            foreach (var c in coll) {
            // ruleid: X509Certificate2-privkey
                var key = c.PrivateKey;
                Use(key);
            }
        }

        // ok: X509Certificate2-privkey
        public void Safe() {
            X509Certificate2 cert = GetCert();
            var key = cert.GetRSAPrivateKey();
            Use(key);
        }

        // ok: X509Certificate2-privkey
        public void Plain() {
            X509Certificate2 cert = GetCert();
            Use(cert.Thumbprint);
        }

        private X509Certificate2 GetCert() {
            return null;
        }

        private void Use(object o) {
        }
    }
}
