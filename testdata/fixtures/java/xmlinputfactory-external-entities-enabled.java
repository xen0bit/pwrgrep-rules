// Explicitly enabling external entities on an `XMLInputFactory` opens the
// door to XXE. The rule is textual: it looks for a parenthesized factory
// followed by `setProperty(..., true)`; the `false` form is fine. Findings
// land on the cast line.
public class XmlInputFactoryExternalEntitiesEnabled {
    void flag(Object factory) {
        // ruleid: xmlinputfactory-external-entities-enabled
        (javax.xml.stream.XMLInputFactory f).setProperty("javax.xml.stream.isSupportingExternalEntities", true);
    }

    void flagDtd(Object factory) {
        // ruleid: xmlinputfactory-external-entities-enabled
        (javax.xml.stream.XMLInputFactory f).setProperty(javax.xml.stream.XMLInputFactory.SUPPORT_DTD, true);
    }

    void flagBoolean(Object factory) {
        // ruleid: xmlinputfactory-external-entities-enabled
        (javax.xml.stream.XMLInputFactory f).setProperty("javax.xml.stream.isSupportingExternalEntities", Boolean.TRUE);
    }

    void safeDisabled(Object factory) {
        // ok: xmlinputfactory-external-entities-enabled
        (javax.xml.stream.XMLInputFactory f).setProperty("javax.xml.stream.isSupportingExternalEntities", false);
    }

    void safeDtdDisabled(Object factory) {
        // ok: xmlinputfactory-external-entities-enabled
        (javax.xml.stream.XMLInputFactory f).setProperty(javax.xml.stream.XMLInputFactory.SUPPORT_DTD, false);
    }

    void safeOther(Object factory) {
        // ok: xmlinputfactory-external-entities-enabled
        (javax.xml.stream.XMLInputFactory f).setProperty("unrelated", true);
    }
}
