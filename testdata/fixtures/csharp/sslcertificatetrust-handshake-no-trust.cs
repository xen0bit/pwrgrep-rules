// correctness-sslcertificatetrust-handshake-no-trust: sending the trusted CA
// list in the handshake bloats every connection and leaks which CAs the
// server trusts. Leave sendTrustInHandshake off.
using System.Net.Security;

namespace Fixture {
    public class Tls {
        public void Vuln(X509CertificateCollection coll) {
            // ruleid: correctness-sslcertificatetrust-handshake-no-trust
            var t = SslCertificateTrust.CreateForX509Collection(coll, sendTrustInHandshake: true);
            Use(t);
        }

        public void Vuln2(X509CertificateCollection coll) {
        // ruleid: correctness-sslcertificatetrust-handshake-no-trust
            var t = SslCertificateTrust.CreateForX509Store(coll, true);
            Use(t);
        }

        // ok: correctness-sslcertificatetrust-handshake-no-trust
        public void Safe(X509CertificateCollection coll) {
            var t = SslCertificateTrust.CreateForX509Collection(coll, sendTrustInHandshake: false);
            Use(t);
        }

        // ok: correctness-sslcertificatetrust-handshake-no-trust
        public void Plain(X509CertificateCollection coll) {
            var t = SslCertificateTrust.CreateForX509Collection(coll);
            Use(t);
        }

        private void Use(object o) {
        }
    }
}
