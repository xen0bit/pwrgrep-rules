// A factory created without explicitly disabling external entities may
// process them, depending on the implementation. Every bare `newFactory`
// call reports: the rule's guard patterns only match typeless blocks, so even
// the hardened call below still fires and only non-factory lines stay quiet.
public class XmlInputFactoryPossibleXxe {
    void flag(String ignored) {
        // ruleid: xmlinputfactory-possible-xxe
        javax.xml.stream.XMLInputFactory f = javax.xml.stream.XMLInputFactory.newFactory();
    }

    void flagAgain(String ignored) {
        // ruleid: xmlinputfactory-possible-xxe
        javax.xml.stream.XMLInputFactory g = javax.xml.stream.XMLInputFactory.newFactory();
    }

    void flagThird(String ignored) {
        // ruleid: xmlinputfactory-possible-xxe
        javax.xml.stream.XMLInputFactory h = javax.xml.stream.XMLInputFactory.newFactory();
    }

    void harden(javax.xml.stream.XMLInputFactory f) {
        // ok: xmlinputfactory-possible-xxe
        f.setProperty("javax.xml.stream.isSupportingExternalEntities", false);
    }

    void useFactory(javax.xml.stream.XMLInputFactory f) {
        // ok: xmlinputfactory-possible-xxe
        System.out.println(f);
    }

    void plain() {
        // ok: xmlinputfactory-possible-xxe
        System.out.println("no factory here");
    }
}
