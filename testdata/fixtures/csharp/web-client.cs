// ssrf via WebClient: DownloadString/OpenRead with a caller-chosen URL reads
// internal endpoints for the attacker. Allowlist the host.
using System.Net;

namespace Fixture {
    public class Fetch {
        public string Vuln(string url) {
            WebClient c = new WebClient();
            // ruleid: ssrf
            return c.DownloadString(url);
        }

        public string Vuln2(string url) {
            WebClient c = new WebClient();
            string target = url;
            // ruleid: ssrf
            var s = c.OpenRead(target);
            return s.ToString();
        }

        public string Vuln3(string url) {
            WebClient c = new WebClient();
            // ruleid: ssrf
            var s = c.OpenRead(url);
            return s.ToString();
        }

        // ok: ssrf
        public string Safe() {
            WebClient c = new WebClient();
            return c.DownloadString("https://example.com/api");
        }

        // ok: ssrf
        public string Plain(string name) {
            return "hello " + name;
        }
    }
}
