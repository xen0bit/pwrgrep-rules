// CWE-601: Open Redirect via response.sendRedirect with tainted input.
package fixture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

class RedirectTest {
    void vulnParam(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String url = request.getParameter("next");
        // ruleid: java-open-redirect
        response.sendRedirect(url);
    }

    void vulnHeader(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String target = request.getHeader("X-Target");
        // ruleid: java-open-redirect
        response.sendRedirect(target);
    }

    void vulnQuery(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String q = request.getQueryString();
        // ruleid: java-open-redirect
        response.sendRedirect(q);
    }

    void safeLiteral(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // ok: java-open-redirect
        response.sendRedirect("/home");
    }

    void safeAllowlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String url = request.getParameter("next");
        if (url.equals("/home") || url.equals("/dashboard")) {
            // ok: java-open-redirect
            response.sendRedirect("/home");
        } else {
            response.sendRedirect("/home");
        }
    }
}
