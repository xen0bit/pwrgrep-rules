import javax.xml.parsers.DocumentBuilderFactory;

public class ExternalParameterEntities {
    public void vuln() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-external-parameter-entities-true
        f.setFeature("http://xml.org/sax/features/external-parameter-entities", true);
    }

    public void vulnAgain() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-external-parameter-entities-true
        f.setFeature("http://xml.org/sax/features/external-parameter-entities", true);
    }

    public void vulnThird() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ruleid: documentbuilderfactory-external-parameter-entities-true
        f.setFeature("http://xml.org/sax/features/external-parameter-entities", true);
    }

    public void safe() throws Exception {
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        // ok: documentbuilderfactory-external-parameter-entities-true
        f.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
    }

    public void plain() {
        // ok: documentbuilderfactory-external-parameter-entities-true
        System.out.println("setFeature in a comment is not a call");
    }

    public void helper() {
        // ok: documentbuilderfactory-external-parameter-entities-true
        System.out.println("nothing configured here");
    }
}
