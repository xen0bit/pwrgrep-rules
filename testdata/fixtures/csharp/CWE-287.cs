// CWE-287: Improper Authentication — [Authorize] missing on controller actions
// ASP.NET's [Authorize] ensures the user is authenticated; without it any caller can invoke the action.
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class AdminController : Controller {
        // ruleid: csharp-missing-auth
        public IActionResult Dashboard() {
            return View();
        }

        // ruleid: csharp-missing-auth
        public IActionResult Transfer() {
            return View();
        }

        // ruleid: csharp-missing-auth
        public IActionResult Sensitive() {
            return View();
        }

        // ok: csharp-missing-auth
        [Authorize] public IActionResult SafeDashboard() {
            return View();
        }

        // ok: csharp-missing-auth
        [Authorize] public IActionResult SafeTransfer() {
            return View();
        }

        // ok: csharp-missing-auth — helper not a public action
        private string helper(string x) {
            return x;
        }
    }
}
