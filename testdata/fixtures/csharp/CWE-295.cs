using System.Net;
using System.Net.Http;

namespace Fixture {
    public class Client {
        public void Sloppy() {
            // ruleid: csharp-certificate-check-always-passes
            ServicePointManager.ServerCertificateValidationCallback = (s, c, ch, e) => true;
        }

        public HttpClient Handler() {
            var h = new HttpClientHandler();
            // ruleid: csharp-certificate-check-always-passes
            h.ServerCertificateCustomValidationCallback = (m, c, ch, e) => true;
            return new HttpClient(h);
        }

        public void Delegated() {
            // ruleid: csharp-certificate-check-always-passes
            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
        }

        public HttpClient Proper() {
            var h = new HttpClientHandler();
            // ok: csharp-certificate-check-always-passes
            h.ServerCertificateCustomValidationCallback = (m, c, ch, e) => e == SslPolicyErrors.None;
            return new HttpClient(h);
        }
    }
}
