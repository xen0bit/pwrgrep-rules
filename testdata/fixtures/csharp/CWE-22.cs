using System.IO;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class FileController : Controller {
        private const string Root = "/srv/files";

        public IActionResult Download(string name) {
            // ruleid: csharp-path-from-request
            var path = Path.Combine(Root, name);
            return PhysicalFile(path, "application/octet-stream");
        }

        public IActionResult Read() {
            string doc = Request.Query["doc"];
            // ruleid: csharp-path-from-request
            var text = File.ReadAllText(doc);
            return Content(text);
        }

        public IActionResult Write(string name, string body) {
            // ruleid: csharp-path-from-request
            using (var w = new StreamWriter(name)) {
                w.Write(body);
            }
            return Ok();
        }

        public IActionResult Safe(string name) {
            var leaf = Path.GetFileName(name);
            // ok: csharp-path-from-request
            var path = Path.Combine(Root, leaf);
            return PhysicalFile(path, "application/octet-stream");
        }

        public IActionResult Fixed() {
            // ok: csharp-path-from-request
            var text = File.ReadAllText(Path.Combine(Root, "index.html"));
            return Content(text);
        }
    }
}
