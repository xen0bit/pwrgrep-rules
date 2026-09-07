// regular-expression-dos-infinite-timeout: no timeout (or a long one) lets a
// crafted input burn CPU in backtracking. Pass a short timeout instead.
using System.Text.RegularExpressions;

namespace Fixture {
    public class Match {
        public bool Vuln(string input) {
            // ruleid: regular-expression-dos-infinite-timeout
            var r = new Regex("(a+)+$", TimeSpan.InfiniteMatchTimeout);
            return r.IsMatch(input);
        }

        public bool Vuln2(string input) {
        // ruleid: regular-expression-dos-infinite-timeout
            var r = new Regex("(a+)+$", TimeSpan.FromMinutes(5));
            return r.IsMatch(input);
        }

        public bool Vuln3(string input) {
// ruleid: regular-expression-dos-infinite-timeout
            var r = new Regex("(a+)+$", TimeSpan.FromSeconds(30));
            return r.IsMatch(input);
        }

        // ok: regular-expression-dos-infinite-timeout
        public bool Safe(string input) {
            var r = new Regex("(a+)+$", TimeSpan.FromSeconds(2));
            return r.IsMatch(input);
        }

        // ok: regular-expression-dos-infinite-timeout
        public bool Plain(string input) {
            var r = new Regex("a+");
            return r.IsMatch(input);
        }
    }
}
