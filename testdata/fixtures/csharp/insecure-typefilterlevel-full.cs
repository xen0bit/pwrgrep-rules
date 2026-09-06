// insecure-typefilterlevel-full: Full lets the remoting payload name any
// type, which is remote code execution. Do not run remoting with it.
using System.Collections;
using System.Runtime.Remoting.Channels;
using System.Runtime.Serialization.Formatters;

namespace Fixture {
    public class Remoting {
        public void Vuln() {
            // ruleid: insecure-typefilterlevel-full
            var p = new BinaryServerFormatterSinkProvider {
                TypeFilterLevel = TypeFilterLevel.Full
            };
            Use(p);
        }

        public void Vuln2() {
            BinaryServerFormatterSinkProvider p = new BinaryServerFormatterSinkProvider();
            // ruleid: insecure-typefilterlevel-full
            p.TypeFilterLevel = TypeFilterLevel.Full;
            Use(p);
        }

        public void Vuln3() {
            IDictionary d = new Hashtable();
            d["typeFilterLevel"] = "Full";
            // ruleid: insecure-typefilterlevel-full
            var p = new BinaryServerFormatterSinkProvider(null, d);
            Use(p);
        }

        // ok: insecure-typefilterlevel-full
        public void Safe() {
            var p = new BinaryServerFormatterSinkProvider();
            Use(p);
        }

        // ok: insecure-typefilterlevel-full
        public void Plain() {
            Use("no remoting here");
        }

        private void Use(object o) {
        }
    }
}
