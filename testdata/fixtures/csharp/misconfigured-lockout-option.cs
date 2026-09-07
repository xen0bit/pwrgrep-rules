// misconfigured-lockout-option: lockoutOnFailure: false lets passwords be
// guessed without limit. Lock the account out after failures.
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class Login {
        private readonly SignInManager<IdentityUser> signin;
        public Login(SignInManager<IdentityUser> s) {
            signin = s;
        }

        public async Task<IActionResult> Vuln(string user, string pass) {
            // ruleid: misconfigured-lockout-option
            var r = await signin.PasswordSignInAsync(user, pass, false, lockoutOnFailure: false);
            return Ok(r);
        }

        public async Task<IActionResult> Vuln2(string user, string pass) {
        // ruleid: misconfigured-lockout-option
            var r = await signin.CheckPasswordSignInAsync(user, pass, lockoutOnFailure: false);
            return Ok(r);
        }

        // ok: misconfigured-lockout-option
        public async Task<IActionResult> Safe(string user, string pass) {
            var r = await signin.PasswordSignInAsync(user, pass, false, lockoutOnFailure: true);
            return Ok(r);
        }

        private IActionResult Ok(object o) {
            return null;
        }
    }
}
