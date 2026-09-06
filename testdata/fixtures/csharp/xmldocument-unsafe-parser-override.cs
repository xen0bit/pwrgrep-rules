// xmldocument-unsafe-parser-override: a resolver plus caller-controlled XML
// is XXE. Do not override the resolver, or feed it only trusted input.
using System.IO;
using System.Xml;

namespace Fixture {
    public class Parse {
        public void Vuln(string xml) {
            XmlDocument doc = new XmlDocument();
            doc.XmlResolver = new XmlUrlResolver();
            // ruleid: xmldocument-unsafe-parser-override
            doc.LoadXml(xml);
        }

        public void Vuln2(string xml) {
            XmlDocument doc = new XmlDocument();
            doc.XmlResolver = new XmlUrlResolver();
            // ruleid: xmldocument-unsafe-parser-override
            doc.Load(xml);
        }

        // ok: xmldocument-unsafe-parser-override
        public void Safe() {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml("<fixed/>");
        }

        // ok: xmldocument-unsafe-parser-override
        public void Plain(string name) {
            Use("hello " + name);
        }

        private void Use(object o) {
        }
    }
}
