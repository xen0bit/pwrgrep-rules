// CWE-22: Path traversal — request data reaches filesystem API.
// Query, Form, or Header values flow to File/Directoy methods without
// validation. The rule flags those sinks; fix by sanitizing with
// GetFileName or allow-lists.
using System.IO;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class PathTraversalController : Controller {
        private const string Root = "/srv/files";

        public IActionResult ReadText() {
            string doc = Request.Query["doc"];
            // ruleid: csharp-path-traversal
            var text = File.ReadAllText(doc);
            return Content(text);
        }

        public IActionResult OpenFile(string file) {
            // ruleid: csharp-path-traversal
            var s = File.Open(file, FileMode.Open);
            return Ok(s);
        }

        public IActionResult ListDir() {
            string dir = Request.Form["dir"];
            // ruleid: csharp-path-traversal
            var files = Directory.GetFiles(dir);
            return Ok(files);
        }

        public IActionResult HeadersPath() {
            string path = Request.Headers["X-Path"];
            // ruleid: csharp-path-traversal
            var data = File.ReadAllBytes(path);
            return File(data, "application/octet-stream");
        }

        public IActionResult QueryStringPath() {
            string name = Request.QueryString["name"];
            // ruleid: csharp-path-traversal
            var lines = File.ReadAllLines(name);
            return Ok(lines);
        }

        public IActionResult Safe() {
            var leaf = Path.GetFileName(Request.Query["name"]);
            // ok: csharp-path-traversal
            var text = File.ReadAllText(Path.Combine(Root, leaf));
            return Content(text);
        }

        public IActionResult SafeConstant() {
            // ok: csharp-path-traversal
            var text = File.ReadAllText(Path.Combine(Root, "index.html"));
            return Content(text);
        }
    }
}
