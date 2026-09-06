// CWE-611: XXE via XmlReader with DtdProcessing.Parse
using System.Xml;

namespace Fixture {
    public class XxeTest {
        public void Vuln1() {
            // ruleid: csharp-xxe
            var settings = new XmlReaderSettings() { DtdProcessing = DtdProcessing.Parse };
            var reader = XmlReader.Create("input.xml", settings);
        }
        public void Vuln2() {
            var s = new XmlReaderSettings();
            // ruleid: csharp-xxe
            s.DtdProcessing = DtdProcessing.Parse;
            var r = XmlReader.Create("a.xml", s);
        }
        public void Vuln3(XmlReaderSettings s) {
            // ruleid: csharp-xxe
            s.DtdProcessing = DtdProcessing.Parse;
        }
        public void Safe() {
            // ok: csharp-xxe
            var settings = new XmlReaderSettings() { DtdProcessing = DtdProcessing.Prohibit };
            var r = XmlReader.Create("safe.xml", settings);
        }
        public void Safe2() {
            var s = new XmlReaderSettings();
            // ok: csharp-xxe
            s.DtdProcessing = DtdProcessing.Prohibit;
        }
    }
}
