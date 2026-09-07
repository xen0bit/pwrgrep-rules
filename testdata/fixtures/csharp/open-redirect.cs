// open-redirect: Redirect with a request-derived URL sends the client to an
// attacker's site. Only redirect to local URLs (IsLocalUrl) or constants.
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class GoController : Controller {
        public IActionResult Go(string next) {
            // ruleid: open-redirect
            return Redirect(next);
        }

        public IActionResult Jump(string target) {
            string url = target;
            // ruleid: open-redirect
            return Redirect(url);
        }

        public IActionResult Safe() {
            string next = Request.Query["next"];
            if (Url.IsLocalUrl(next)) {
                // ok: open-redirect
                return Redirect("/home");
            }
            // ok: open-redirect
            return Redirect("/error");
        }

        // ok: open-redirect
        public IActionResult Home() {
            return Redirect("/home");
        }
    }
}
