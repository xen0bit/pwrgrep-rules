// CWE-601: Open Redirect via Response.Redirect with request data
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class RedirectController : Controller {
        public IActionResult VulnQuery() {
            string url = Request.Query["next"];
            // ruleid: csharp-open-redirect
            return Redirect(url);
        }
        public IActionResult VulnParam(string next) {
            // ruleid: csharp-open-redirect
            return Redirect(next);
        }
        public IActionResult VulnForm() {
            string target = Request.Form["target"];
            // ruleid: csharp-open-redirect
            Response.Redirect(target);
            return Ok();
        }
        public IActionResult SafeLiteral() {
            // ok: csharp-open-redirect
            return Redirect("/home");
        }
        public IActionResult SafeAllowlist(string url) {
            if (url == "/home" || url == "/dashboard") {
                // ok: csharp-open-redirect
                return Redirect("/home");
            }
            return Redirect("/home");
        }
    }
}
