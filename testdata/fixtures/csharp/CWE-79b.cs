// CWE-79: Reflected XSS — request data written without encoding.
// Response.Write(x) or Html.Raw(input) with Request.Query emits raw
// HTML. The rule flags those sinks; fix by encoding before write.
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Html;

namespace Fixture {
    public class XssController : Controller {
        public IActionResult WriteFromQuery() {
            string x = Request.Query["x"];
            // ruleid: csharp-xss
            Response.Write(x);
            return Ok();
        }

        public IActionResult RawParam(string input) {
            // ruleid: csharp-xss
            var html = Html.Raw(input);
            return View(html);
        }

        public IActionResult HtmlRawForm() {
            string note = Request.Form["note"];
            // ruleid: csharp-xss
            var html = Html.Raw(note);
            return Content(html.ToString(), "text/html");
        }

        public IActionResult HtmlStringCtor() {
            string name = Request.Headers["X-Name"];
            // ruleid: csharp-xss
            var h = new HtmlString("<b>" + name + "</b>");
            return View(h);
        }

        public IActionResult QueryStringSink() {
            string q = Request.QueryString["q"];
            // ruleid: csharp-xss
            Response.WriteAsync(q);
            return Ok();
        }

        public IActionResult SafeEncoded(string name) {
            var safe = System.Net.WebUtility.HtmlEncode(name);
            // ok: csharp-xss
            var h = new HtmlString("<b>" + safe + "</b>");
            return View(h);
        }

        public IActionResult SafeConstant() {
            // ok: csharp-xss
            Response.Write("hello world");
            return Ok();
        }
    }
}
