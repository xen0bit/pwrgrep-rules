package fixture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

class Cwe79 {

    void viaWriter(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String x = request.getParameter("q");
        // ruleid: java-reflected-xss
        response.getWriter().write(x);
    }

    void viaPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getHeader("X-Name");
        // ruleid: java-reflected-xss
        response.getWriter().print(name);
    }

    void viaPrintln(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String data = request.getQueryString();
        // ruleid: java-reflected-xss
        response.getWriter().println(data);
    }

    void viaWriterConcat(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String val = request.getParameter("val");
        String out = "<div>" + val + "</div>";
        // ruleid: java-reflected-xss
        response.getWriter().write(out);
    }

    // ok: java-reflected-xss
    void safeConstant(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.getWriter().write("hello world");
    }

    // ok: java-reflected-xss
    void safeEncoded(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String x = request.getParameter("q");
        String safe = org.apache.commons.text.StringEscapeUtils.escapeHtml4("constant");
        response.getWriter().write(safe);
    }

    void safeFromConfig(String configured, HttpServletResponse response) throws Exception {
        // ok: java-reflected-xss
        response.getWriter().write(configured);
    }
}
