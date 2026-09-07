// missing-or-broken-authorization: a controller without [Authorize] answers
// anonymous callers. Require authorization by default and opt out explicitly.
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    // ruleid: missing-or-broken-authorization
    public class OpenController : Controller {
        public IActionResult Index() {
            return null;
        }
    }

    // ruleid: missing-or-broken-authorization
    public class Open2Controller : Controller {
        public IActionResult Index() {
            return null;
        }
    }

    // ok: missing-or-broken-authorization
    [Authorize]
    public class ClosedController : Controller {
        public IActionResult Index() {
            return null;
        }
    }

    // ok: missing-or-broken-authorization
    [Authorize(Roles = "admin")]
    public class AdminController : Controller {
        public IActionResult Index() {
            return null;
        }
    }
}
