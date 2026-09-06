// CWE-611: XXE via Dom.Document.load with attacker-controlled XML

public class TestCWE611 {
    public void vuln(String userXml) {
        Dom.Document doc = new Dom.Document();
        // ruleid: apex-xxe
        doc.load(userXml);
        Dom.Document doc2 = new Dom.Document();
        String xml2 = userXml;
        // ruleid: apex-xxe
        doc2.load(xml2);
        Dom.Document doc3 = new Dom.Document();
        // ruleid: apex-xxe
        doc3.load(userXml);
    }
    public void safe() {
        Dom.Document doc = new Dom.Document();
        // ok: apex-xxe
        doc.load('<root>fixed</root>');
        Dom.Document doc2 = new Dom.Document();
        // ok: apex-xxe
        doc2.load('<data>hello</data>');
    }
}
