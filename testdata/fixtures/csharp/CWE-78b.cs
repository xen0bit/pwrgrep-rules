// CWE-78: OS command injection — untrusted input reaches process sink.
// Request.Query["cmd"] flows to Process.Start(cmd) without validation.
// The rule flags those flows; fix by mapping to allow-listed commands
// and never passing raw input.
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class OsCommandController : Controller {
        public IActionResult FromQuery() {
            string cmd = Request.Query["cmd"];
            // ruleid: csharp-os-command-injection
            Process.Start(cmd);
            return Ok();
        }

        public IActionResult FromForm(string tool) {
            // ruleid: csharp-os-command-injection
            Process.Start(tool);
            return Ok();
        }

        public IActionResult WithArgs() {
            string arg = Request.Form["arg"];
            // ruleid: csharp-os-command-injection
            Process.Start("ping", arg);
            return Ok();
        }

        public IActionResult ViaStartInfo() {
            string input = Request.Headers["X-Command"];
            // ruleid: csharp-os-command-injection
            var psi = new ProcessStartInfo("tool", input);
            // ruleid: csharp-os-command-injection
            Process.Start(psi);
            return Ok();
        }

        public IActionResult ViaProperty() {
            string file = Request.QueryString["file"];
            var p = new Process();
            // ruleid: csharp-os-command-injection
            p.StartInfo.FileName = file;
            p.Start();
            return Ok();
        }

        public IActionResult SafeConstant() {
            // ok: csharp-os-command-injection
            Process.Start("ping", "127.0.0.1");
            return Ok();
        }

        public IActionResult SafeLiteral() {
            var psi = new ProcessStartInfo("ping", "127.0.0.1");
            // ok: csharp-os-command-injection
            Process.Start(psi);
            return Ok();
        }
    }
}
