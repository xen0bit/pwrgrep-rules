// CWE-352: CSRF — POST actions without ValidateAntiForgeryToken.
// ASP.NET validates CSRF tokens with [ValidateAntiForgeryToken]; POST
// handlers without it can be forged from another origin.
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class TransferController : Controller {
        // ruleid: csharp-csrf
        [HttpPost]
        public IActionResult Transfer() {
            return Ok();
        }

        // ruleid: csharp-csrf
        [HttpPost]
        public IActionResult Update() {
            return Ok();
        }

        // ruleid: csharp-csrf
        [HttpPost]
        public IActionResult Delete() {
            return Ok();
        }

        // ok: csharp-csrf
        [HttpPost, ValidateAntiForgeryToken] public IActionResult SafeTransfer() {
            return Ok();
        }

        // ok: csharp-csrf
        [HttpPost, ValidateAntiForgeryToken] public IActionResult SafeUpdate() {
            return Ok();
        }
    }
}
