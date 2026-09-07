import javax.xml.parsers.DocumentBuilderFactory;

public class ExternalGeneralEntities {
    public void vuln() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-external-general-entities-true
        f.setFeature("http://xml.org/sax/features/external-general-entities", true);
    }

    public void vulnAgain() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-external-general-entities-true
        f.setFeature("http://xml.org/sax/features/external-general-entities", true);
    }

    public void vulnThird() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-external-general-entities-true
        f.setFeature("http://xml.org/sax/features/external-general-entities", true);
    }

    public void safe() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ok: documentbuilderfactory-external-general-entities-true
        f.setFeature("http://xml.org/sax/features/external-general-entities", false);
    }

    public void plain() {
        // ok: documentbuilderfactory-external-general-entities-true
        System.out.println("setFeature in a comment is not a call");
    }

    public void helper() {
        // ok: documentbuilderfactory-external-general-entities-true
        System.out.println("nothing configured here");
    }
}
