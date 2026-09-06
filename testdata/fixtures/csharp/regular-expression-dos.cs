// regular-expression-dos: running a pattern over untrusted input without a
// timeout lets a crafted string burn CPU. Pass a timeout.
using System.Text.RegularExpressions;

namespace Fixture {
    public class Match {
        public void Vuln(string input) {
            // ruleid: regular-expression-dos
            Regex r = new Regex("(a+)+$");
            r.Match(input);
        }

        public void Vuln2(string input) {
            // ruleid: regular-expression-dos
            Regex.Match(input, "(a+)+$");
        }

        public void Vuln3(string input) {
            // ruleid: regular-expression-dos
            Regex r = new Regex("(a+)+$", RegexOptions.None);
            r.Match(input);
        }

        public void Safe(string input) {
            // ok: regular-expression-dos
            Regex r = new Regex("(a+)+$", RegexOptions.None, TimeSpan.FromSeconds(2));
            r.Match(input);
        }

        public void Safe2(string input) {
            // ok: regular-expression-dos
            Regex.Match(input, "(a+)+$", RegexOptions.None, TimeSpan.FromSeconds(2));
        }

        // ok: regular-expression-dos
        public bool Plain(string input) {
            return input.Length > 0;
        }
    }
}
