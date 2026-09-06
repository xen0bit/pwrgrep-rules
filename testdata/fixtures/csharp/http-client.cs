// ssrf via HttpClient: GetAsync/GetStringAsync with a caller-chosen URL
// reads internal endpoints for the attacker. Allowlist the host.
using System.Net.Http;
using System.Threading.Tasks;

namespace Fixture {
    public class Fetch {
        public async Task<string> Vuln(string url) {
            HttpClient c = new HttpClient();
            // ruleid: ssrf
            return await c.GetStringAsync(url);
        }

        public async Task<string> Vuln2(string url) {
            HttpClient c = new HttpClient();
            string target = url;
            // ruleid: ssrf
            var r = await c.GetAsync(target);
            return r.StatusCode.ToString();
        }

        public async Task<string> Vuln3(string url) {
            HttpClient c = new HttpClient();
            // ruleid: ssrf
            var r = await c.GetAsync(url);
            return r.StatusCode.ToString();
        }

        // ok: ssrf
        public async Task<string> Safe() {
            HttpClient c = new HttpClient();
            return await c.GetStringAsync("https://example.com/api");
        }

        // ok: ssrf
        public string Plain(string name) {
            return "hello " + name;
        }
    }
}
