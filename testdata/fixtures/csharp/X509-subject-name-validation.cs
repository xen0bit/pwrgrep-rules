// X509-subject-name-validation: the subject is attacker-chosen metadata, so
// comparing it to an expected name does not authenticate the peer. Validate
// the chain instead. The rule reports both the handling method and the
// comparison, so both lines carry annotations (see the rule header).
using System.IdentityModel.Tokens;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace Fixture {
    public class Certs {
        // ruleid: X509-subject-name-validation
        public bool Check(object sender, X509Certificate2 cert, X509Chain chain) {
            // ruleid: X509-subject-name-validation
            var ok = cert.Subject == "CN=example.com";
            return ok;
        }

        // ruleid: X509-subject-name-validation
        public bool Check2(object sender, X509Certificate2 cert, X509Chain chain) {
            // ruleid: X509-subject-name-validation
            var ok = cert.Subject.Equals("CN=example.com");
            return ok;
        }

        // ok: X509-subject-name-validation
        public bool Safe() {
            return true;
        }

        // ok: X509-subject-name-validation
        public bool Plain(string name) {
            return name.Length > 0;
        }

        // ok: X509-subject-name-validation
        public bool AlsoPlain(int n) {
            return n > 0;
        }
    }
}
