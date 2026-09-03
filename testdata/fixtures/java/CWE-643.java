package fixture;

// CWE-643: the request writes the XPath expression.
//
// XPath has no prepared statements. There is no placeholder, no bind, and no
// escaping function in the standard library, so an expression assembled by
// concatenation is assembled the only way there is - and
// `//user[name/text()='` + name + `']` closes its own quote for anybody who
// sends `' or '1'='1`. The whole document comes back, which for the documents
// people keep in XML is usually the credential store.
//
// No sanitizer is named, because the fix is not a function. It is to stop
// concatenating: compile the expression once with a variable in it and bind
// the variable through an XPathVariableResolver. A rule cannot check that a
// resolver resolves the right thing, so it says nothing about it and reports
// the concatenation.

import javax.servlet.http.HttpServletRequest;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

class Cwe643 {

    NodeList lookup(HttpServletRequest request, Document document) throws Exception {
        String name = request.getParameter("user");
        XPath xpath = XPathFactory.newInstance().newXPath();
        // ruleid: java-xpath-built-from-the-request
        return (NodeList) xpath.evaluate("//user[name/text()='" + name + "']",
                document, XPathConstants.NODESET);
    }

    XPathExpression compileFromHeader(HttpServletRequest request) throws Exception {
        String tenant = request.getHeader("X-Tenant");
        XPath xpath = XPathFactory.newInstance().newXPath();
        // ruleid: java-xpath-built-from-the-request
        return xpath.compile("//tenant[@id='" + tenant + "']/users");
    }

    // A constant expression is a constant expression however it is spelled.
    NodeList lookupAll(Document document) throws Exception {
        XPath xpath = XPathFactory.newInstance().newXPath();
        // ok: java-xpath-built-from-the-request
        return (NodeList) xpath.evaluate("//user", document, XPathConstants.NODESET);
    }

    // Pattern.compile is a different compile, and a tainted regex is a
    // different weakness with a different rule.
    boolean matches(HttpServletRequest request) {
        String needle = request.getParameter("q");
        // ok: java-xpath-built-from-the-request
        return java.util.regex.Pattern.compile(needle).matcher("haystack").find();
    }
}
