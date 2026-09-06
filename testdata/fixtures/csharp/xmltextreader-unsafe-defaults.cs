// xmltextreader-unsafe-defaults: XmlTextReader resolves DTDs unless told to
// prohibit them, so caller-controlled XML is XXE. Set DtdProcessing to
// Prohibit (see the rule header: the safe case below stays constant because
// the prohibition is file-level).
using System.IO;
using System.Xml;

namespace Fixture {
    public class Parse {
        public void Vuln(string xml) {
            XmlTextReader reader = new XmlTextReader(new StringReader(xml));
            // ruleid: xmltextreader-unsafe-defaults
            reader.Read();
        }

        public void Vuln2(string xml) {
            XmlTextReader reader = new XmlTextReader(new StringReader(xml));
            // ruleid: xmltextreader-unsafe-defaults
            while (reader.Read()) {
            }
        }

        // ok: xmltextreader-unsafe-defaults
        public void Safe() {
            XmlTextReader reader = new XmlTextReader(new StringReader("<fixed/>"));
            reader.Read();
        }

        // ok: xmltextreader-unsafe-defaults
        public void Plain(string name) {
            Use("hello " + name);
        }

        private void Use(object o) {
        }
    }
}
