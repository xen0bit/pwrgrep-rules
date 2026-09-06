import javax.servlet.http.*;
import java.io.*;

public class XssTest {
    public void bad1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String input = req.getParameter("q");
        // ruleid: servletresponse-writer-xss
        resp.getWriter().write(input);
    }
    public void good1(HttpServletResponse resp) throws IOException {
        // ok: servletresponse-writer-xss
        resp.getWriter().write("static");
    }
    public void bad2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String data = req.getHeader("X-Data");
        PrintWriter w = resp.getWriter();
        // ruleid: servletresponse-writer-xss
        w.write(data);
    }
    public void good2(HttpServletResponse resp) throws IOException {
        PrintWriter w = resp.getWriter();
        // ok: servletresponse-writer-xss
        w.write("safe");
    }
    public void bad3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String q = req.getQueryString();
        // ruleid: servletresponse-writer-xss
        resp.getWriter().write(q);
    }
    public void good3(HttpServletResponse resp) throws IOException {
        // ok: servletresponse-writer-xss
        resp.getWriter().write("hello");
    }
}
