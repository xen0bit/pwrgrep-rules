// CWE-611: XML External Entity via TransformerFactory and SAXParser
//
// Transformer and SAXParser with defaults resolve external entities. Passing
// user input as XML lets an <!ENTITY> become a file read or SSRF.

import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamSource;
import javax.servlet.http.HttpServletRequest;
import java.io.StringReader;

class Cwe611_3 {
    void viaTransformer(HttpServletRequest request) throws Exception {
        String xml = request.getParameter("xml");
        // ruleid: java-xxe-3
        TransformerFactory.newInstance().newTransformer().transform(new StreamSource(new StringReader(xml)), null);
    }

    void viaSax(HttpServletRequest request) throws Exception {
        String data = request.getParameter("data");
        // ruleid: java-xxe-3
        SAXParserFactory.newInstance().newSAXParser().parse(new org.xml.sax.InputSource(new StringReader(data)), null);
    }

    void propagated(HttpServletRequest request) throws Exception {
        String input = request.getParameter("input");
        String propagated = input;
        // ruleid: java-xxe-3
        TransformerFactory.newInstance().newTransformer().transform(new StreamSource(new StringReader(propagated)), null);
    }

    void safe() throws Exception {
        // ok: java-xxe-3
        TransformerFactory.newInstance().newTransformer().transform(new StreamSource(new StringReader("<root>hello</root>")), null);
        // ok: java-xxe-3
        SAXParserFactory.newInstance().newSAXParser().parse(new org.xml.sax.InputSource(new StringReader("<root/>")), null);
        // ok: java-xxe-3
        String fixed = "<safe/>";
        TransformerFactory.newInstance().newTransformer().transform(new StreamSource(new StringReader(fixed)), null);
    }
}
