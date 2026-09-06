// CWE-918: SSRF — URL from request is fetched server-side.
// GetStringAsync(url) where url = Request.Query["url"] lets an attacker
// probe internal services. The rule flags HttpClient/WebRequest with
// request URLs; fix by allow-listing or not fetching user URLs.
using System.Net;
using System.Net.Http;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class SsrfController : Controller {
        private readonly HttpClient _httpClient = new HttpClient();

        public async System.Threading.Tasks.Task<IActionResult> FetchQuery() {
            string url = Request.Query["url"];
            // ruleid: csharp-ssrf
            var data = await _httpClient.GetStringAsync(url);
            return Ok(data);
        }

        public async System.Threading.Tasks.Task<IActionResult> FromForm() {
            string target = Request.Form["target"];
            // ruleid: csharp-ssrf
            var resp = await _httpClient.GetAsync(target);
            return Ok(await resp.Content.ReadAsStringAsync());
        }

        public async System.Threading.Tasks.Task<IActionResult> HeaderUrl() {
            string endpoint = Request.Headers["X-Target-Url"];
            // ruleid: csharp-ssrf
            var result = await _httpClient.GetAsync(endpoint);
            return Ok(result);
        }

        public IActionResult ViaWebRequest() {
            string u = Request.QueryString["u"];
            // ruleid: csharp-ssrf
            var req = WebRequest.Create(u);
            return Ok(req.RequestUri.ToString());
        }

        public IActionResult ViaCreateHttp() {
            string link = Request.Query["link"];
            // ruleid: csharp-ssrf
            var req2 = WebRequest.CreateHttp(link);
            return Ok(req2.RequestUri.ToString());
        }

        public async System.Threading.Tasks.Task<IActionResult> Safe() {
            // ok: csharp-ssrf
            var data = await _httpClient.GetStringAsync("https://api.example.com/health");
            return Ok(data);
        }

        public IActionResult SafeConstant() {
            // ok: csharp-ssrf
            var req = WebRequest.Create("https://example.com/static");
            return Ok(req);
        }
    }
}
