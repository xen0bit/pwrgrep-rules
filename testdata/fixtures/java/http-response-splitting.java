// Stuffing request input into a cookie value enables response splitting on
// old servers. The rule matches bare assignments (no declarations), so the
// flagged lines read like script code; declared locals never match. Findings
// land on the `getParameter` line that starts each triple.
// The two-argument `Cookie` constructor is the real API and stays quiet.
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class HttpResponseSplitting {
    void flag() {
        // ruleid: http-response-splitting
        v = req.getParameter("x");
        c = new Cookie("n", v, "z");
        resp.addCookie(c);
    }

    void flagAgain() {
        // ruleid: http-response-splitting
        name = req.getParameter("name");
        ck = new Cookie("n", name, "z");
        resp.addCookie(ck);
    }

    void flagThird() {
        // ruleid: http-response-splitting
        q = req.getParameter("q");
        cc = new Cookie("n", q, "z");
        resp.addCookie(cc);
    }

    void safeTwoArg(String userVal, HttpServletResponse resp) {
        Cookie d = new Cookie("n", userVal);
        // ok: http-response-splitting
        resp.addCookie(d);
    }

    void safeStatic(HttpServletResponse resp) {
        Cookie e = new Cookie("n", "static", "z");
        // ok: http-response-splitting
        resp.addCookie(e);
    }

    void safeNoCookie(HttpServletResponse resp) {
        // ok: http-response-splitting
        resp.addCookie(existing);
    }
}
