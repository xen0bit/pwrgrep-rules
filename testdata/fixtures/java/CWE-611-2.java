package fixture;

import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;

class Cwe611b {

    Document viaParse(HttpServletRequest request) throws Exception {
        String xml = request.getParameter("xml");
        java.io.ByteArrayInputStream bais = new java.io.ByteArrayInputStream(xml.getBytes());
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        // ruleid: java-xxe-2
        return builder.parse(bais);
    }

    Document viaInputStream(HttpServletRequest request) throws Exception {
        InputStream in = request.getInputStream();
        DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        // ruleid: java-xxe-2
        return builder.parse(in);
    }

    Document viaHeader(HttpServletRequest request) throws Exception {
        String data = request.getHeader("X-XML");
        java.io.InputStream is = new java.io.ByteArrayInputStream(data.getBytes());
        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
        DocumentBuilder b = f.newDocumentBuilder();
        // ruleid: java-xxe-2
        return b.parse(is);
    }

    void viaDirectString(HttpServletRequest request) throws Exception {
        String xml = request.getParameter("xml");
        java.io.ByteArrayInputStream is = new java.io.ByteArrayInputStream(xml.getBytes());
        DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        // ruleid: java-xxe-2
        db.parse(is);
    }

    // ok: java-xxe-2
    Document safeConstant() throws Exception {
        String xml = "<root>hello</root>";
        java.io.ByteArrayInputStream bais = new java.io.ByteArrayInputStream(xml.getBytes());
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        return factory.newDocumentBuilder().parse(bais);
    }

    // ok: java-xxe-2
    Document safeFromConfig(String configuredXml) throws Exception {
        java.io.ByteArrayInputStream bais = new java.io.ByteArrayInputStream(configuredXml.getBytes());
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://xml.org/sax/features/external-general-entities", false);
        return factory.newDocumentBuilder().parse(bais);
    }
}
