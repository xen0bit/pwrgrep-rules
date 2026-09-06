// ssrf via WebRequest: Create with a caller-chosen URL reads internal
// endpoints for the attacker. Allowlist the host.
using System.Net;

namespace Fixture {
    public class Fetch {
        public string Vuln(string url) {
            // ruleid: ssrf
            var r = WebRequest.Create(url);
            return r.RequestUri.ToString();
        }

        public string Vuln2(string url) {
            string target = url;
            // ruleid: ssrf
            var r = WebRequest.Create(target);
            return r.RequestUri.ToString();
        }

        // ok: ssrf
        public string Safe() {
            var r = WebRequest.Create("https://example.com/api");
            return r.RequestUri.ToString();
        }

        // ok: ssrf
        public string Plain(string name) {
            return "hello " + name;
        }
    }
}
