// xmlreadersettings-unsafe-parser-override: DtdProcessing.Parse with
// caller-controlled XML is XXE. Prohibit DTDs for untrusted input.
using System.IO;
using System.Xml;

namespace Fixture {
    public class Parse {
        public void Vuln(string xml) {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.DtdProcessing = DtdProcessing.Parse;
            // ruleid: xmlreadersettings-unsafe-parser-override
            using (XmlReader reader = XmlReader.Create(new StringReader(xml), settings)) {
                reader.Read();
            }
        }

        public void Vuln2(string xml) {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.DtdProcessing = DtdProcessing.Parse;
            // ruleid: xmlreadersettings-unsafe-parser-override
            using (XmlReader reader = XmlReader.Create(new StringReader(xml), settings)) {
                while (reader.Read()) {
                }
            }
        }

        // ok: xmlreadersettings-unsafe-parser-override
        public void Safe() {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.DtdProcessing = DtdProcessing.Prohibit;
            using (XmlReader reader = XmlReader.Create(new StringReader("<fixed/>"), settings)) {
                reader.Read();
            }
        }

        // ok: xmlreadersettings-unsafe-parser-override
        public void Plain(string name) {
            Use("hello " + name);
        }

        private void Use(object o) {
        }
    }
}
