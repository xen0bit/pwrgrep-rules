// mass-assignment: binding a model without [Bind] lets the caller set every
// property, including ones the form never shows (IsAdmin). Allowlist with
// [Bind] or a dedicated view model.
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class UsersController : Controller {
        public IActionResult Create(User user) {
            Save(user);
            // ruleid: mass-assignment
            return View(user);
        }

        public ActionResult Edit(User user) {
            Save(user);
            // ruleid: mass-assignment
            return View(user);
        }

        // ok: mass-assignment
        public IActionResult SafeCreate([Bind("Name,Email")] User user) {
            Save(user);
            return View(user);
        }

        private void Save(object o) {
        }
    }

    public class User {
        public string Name { get; set; }
        public string Email { get; set; }
        public bool IsAdmin { get; set; }
    }
}
