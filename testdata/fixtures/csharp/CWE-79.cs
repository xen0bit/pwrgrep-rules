using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Html;

namespace Fixture {
    public class PageController : Controller {
        public IActionResult Greet(string name) {
            // ruleid: csharp-html-built-from-request
            var html = new HtmlString("<h1>Hello " + name + "</h1>");
            return View(html);
        }

        public ContentResult Card() {
            string bio = Request.Query["bio"];
            // ruleid: csharp-html-built-from-request
            return Content($"<div class='bio'>{bio}</div>", "text/html");
        }

        public IActionResult Raw(string note) {
            // ruleid: csharp-html-built-from-request
            ViewData["Note"] = new HtmlString(note);
            return View();
        }

        public IActionResult Encoded(string name) {
            var safe = System.Net.WebUtility.HtmlEncode(name);
            // ok: csharp-html-built-from-request
            var html = new HtmlString("<h1>Hello " + safe + "</h1>");
            return View(html);
        }

        public ContentResult Plain() {
            // ok: csharp-html-built-from-request
            return Content("<p>static</p>", "text/html");
        }
    }
}
