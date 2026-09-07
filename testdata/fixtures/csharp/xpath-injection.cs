// xpath-injection: building an XPath expression from method input lets the
// caller break out of the quotes. Parameterize or allowlist the value.
using System.Xml.XPath;

namespace Fixture {
    public class Search {
        private readonly XPathNavigator nav;
        public Search(XPathNavigator n) {
            nav = n;
        }

        public string Vuln(string name) {
            // ruleid: xpath-injection
            var expr = nav.Compile("//user[name='" + name + "']");
            return expr.ToString();
        }

        public string Vuln2(string city) {
        // ruleid: xpath-injection
            var nodes = nav.Select("//user[city='" + city + "']");
            return nodes.Count.ToString();
        }

        // ok: xpath-injection
        public string Safe() {
            var expr = nav.Compile("//user[name='fixed']");
            return expr.ToString();
        }

        // ok: xpath-injection
        public string Plain(string name) {
            return "hello " + name;
        }
    }
}
