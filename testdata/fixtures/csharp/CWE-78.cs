using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class ToolController : Controller {
        public IActionResult Ping(string host) {
            // ruleid: csharp-command-from-request
            Process.Start("ping", host);
            return Ok();
        }

        public IActionResult Convert() {
            string file = Request.Query["file"];
            var psi = new ProcessStartInfo("convert");
            // ruleid: csharp-command-from-request
            psi.Arguments = file + " out.png";
            Process.Start(psi);
            return Ok();
        }

        public IActionResult Run(string tool) {
            var p = new Process();
            // ruleid: csharp-command-from-request
            p.StartInfo.FileName = tool;
            p.Start();
            return Ok();
        }

        public IActionResult Fixed() {
            // ok: csharp-command-from-request
            Process.Start("ping", "127.0.0.1");
            return Ok();
        }
    }
}
