// ssrf via RestSharp: new RestClient with a caller-chosen URL reads internal
// endpoints for the attacker. Allowlist the host.
using RestSharp;

namespace Fixture {
    public class Fetch {
        public string Vuln(string url) {
            // ruleid: ssrf
            var c = new RestClient(url);
            return c.BaseUrl.ToString();
        }

        public string Vuln2(string url) {
            string target = url;
            // ruleid: ssrf
            var c = new RestClient(target);
            return c.BaseUrl.ToString();
        }

        // ok: ssrf
        public string Safe() {
            var c = new RestClient("https://example.com/api");
            return c.BaseUrl.ToString();
        }

        // ok: ssrf
        public string Plain(string name) {
            return "hello " + name;
        }
    }
}
