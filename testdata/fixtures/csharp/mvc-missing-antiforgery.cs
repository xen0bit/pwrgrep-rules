// mvc-missing-antiforgery: a POST/PUT/DELETE action without
// [ValidateAntiForgeryToken] (or strict content-type checks) accepts forged
// cross-site form posts. Validate the token.
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class OrdersController : Controller {
        // ruleid: mvc-missing-antiforgery
        [HttpPost]
        public IActionResult Create(Order o) {
            Save(o);
            return null;
        }

        // ruleid: mvc-missing-antiforgery
        [HttpDelete]
        public IActionResult Delete(int id) {
            Drop(id);
            return null;
        }

        // ok: mvc-missing-antiforgery
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SafeCreate(Order o) {
            Save(o);
            return null;
        }

        // ok: mvc-missing-antiforgery
        [HttpGet]
        public IActionResult Index() {
            return null;
        }

        private void Save(object o) {
        }

        private void Drop(int id) {
        }
    }

    public class Order {
    }
}
