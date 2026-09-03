package fixture;

// CWE-611: an XML parser that was never told not to fetch external entities.
//
// Every JAXP factory ships with entity resolution turned on, because that is
// what the XML specification asks for. A document is therefore allowed to say
// `<!ENTITY x SYSTEM "file:///etc/shadow">` and have the parser go and get it,
// or to name a URL and make the parsing host fetch it - which is a file read
// and a server-side request forgery out of the same one line.
//
// The three rules already in this corpus report a program that turns a
// protection *off*. Nobody does that. The bug is the default, and the shape
// of it is a factory created and used with nothing said in between.
//
// A file that hardens its factory is not reported, and the test is the text of
// the whole method rather than the statement after the creation, because the
// hardening is usually four calls in a helper block or wrapped in a
// try/catch for ParserConfigurationException. Coarse is right here: a method
// that mentions `setFeature` at all has had someone think about this.

import java.io.File;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.xml.sax.helpers.DefaultHandler;

class Cwe611 {

    Document parseUpload(File upload) throws Exception {
        // ruleid: java-xml-parser-left-at-its-defaults
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        return builder.parse(upload);
    }

    Document parseHardened(File upload) throws Exception {
        // ok: java-xml-parser-left-at-its-defaults
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        factory.setXIncludeAware(false);
        DocumentBuilder builder = factory.newDocumentBuilder();
        return builder.parse(upload);
    }

    void sax(File upload, DefaultHandler handler) throws Exception {
        // ruleid: java-xml-parser-left-at-its-defaults
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();
        parser.parse(upload, handler);
    }

    void saxSecure(File upload, DefaultHandler handler) throws Exception {
        // ok: java-xml-parser-left-at-its-defaults
        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
        SAXParser parser = factory.newSAXParser();
        parser.parse(upload, handler);
    }

    void transform(StreamSource in) throws Exception {
        // ruleid: java-xml-parser-left-at-its-defaults
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();
        transformer.transform(in, null);
    }

    void transformLocked(StreamSource in) throws Exception {
        // ok: java-xml-parser-left-at-its-defaults
        TransformerFactory factory = TransformerFactory.newInstance();
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        Transformer transformer = factory.newTransformer();
        transformer.transform(in, null);
    }

    // A factory that is configured and handed back has had the question asked
    // of it somewhere else, and nothing here parses anything.
    DocumentBuilderFactory supply() throws ParserConfigurationException {
        // ok: java-xml-parser-left-at-its-defaults
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        return factory;
    }
}
