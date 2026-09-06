// CWE-78 OS command injection - csharp injection
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
namespace Test {
    public class CmdController : Controller {
        public IActionResult Bad1(string cmd) {
            // ruleid: os-command-injection
            Process.Start(cmd, "arg");
            return Ok();
        }
        public IActionResult Bad2(string arg) {
            // ruleid: os-command-injection
            Process.Start(arg, "static");
            return Ok();
        }
        public IActionResult Bad3(string file) {
            var psi = new ProcessStartInfo(file, "arg");
            // ruleid: os-command-injection
            Process.Start(psi);
            return Ok();
        }
        public IActionResult Good1() {
            // ok: os-command-injection
            Process.Start("static", "arg");
            return Ok();
        }
        public IActionResult Good2() {
            // ok: os-command-injection
            var psi2 = new ProcessStartInfo("static", "static");
            Process.Start(psi2);
            return Ok();
        }
        public IActionResult Good3() {
            // ok: os-command-injection
            Process.Start("ping", "127.0.0.1");
            return Ok();
        }
    }
}
