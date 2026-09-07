import javax.xml.parsers.DocumentBuilderFactory;

public class DoctypeDecl {
    public void vuln() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-disallow-doctype-decl-false
        f.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
    }

    public void vulnAgain() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-disallow-doctype-decl-false
        f.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
    }

    public void vulnThird() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-disallow-doctype-decl-false
        f.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
    }

    public void safe() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ok: documentbuilderfactory-disallow-doctype-decl-false
        f.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }

    public void safeAgain() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ok: documentbuilderfactory-disallow-doctype-decl-false
        f.setFeature("http://xml.org/sax/features/external-general-entities", false);
    }

    public void plain() {
        // ok: documentbuilderfactory-disallow-doctype-decl-false
        System.out.println("setFeature in a comment is not a call");
    }
}
