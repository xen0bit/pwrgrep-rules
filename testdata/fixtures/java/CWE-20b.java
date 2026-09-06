// CWE-20b: Improper input validation — request.getParameter without regex -> query/exec
import java.sql.*;
import javax.servlet.http.HttpServletRequest;

class Handler {
    void vuln1(HttpServletRequest request, Statement stmt) throws Exception {
        String id = request.getParameter("id");
        // ruleid: java-20-validation
        stmt.executeQuery("SELECT * FROM users WHERE id = " + id);
    }

    void vuln2(HttpServletRequest request, Connection conn) throws Exception {
        String q = request.getParameter("q");
        // ruleid: java-20-validation
        conn.prepareStatement(q).executeQuery();
    }

    void vuln3(HttpServletRequest request) throws Exception {
        String cmd = request.getParameter("cmd");
        // ruleid: java-20-validation
        Runtime.getRuntime().exec(cmd);
    }

    void safeRegex(HttpServletRequest request, Statement stmt) throws Exception {
        String id = request.getParameter("id");
        if (!id.matches("^[a-z0-9]+$")) throw new IllegalArgumentException();
        // ok: java-20-validation
        stmt.executeQuery("SELECT * FROM users WHERE id = ?");
    }

    void safeFixed(HttpServletRequest request, Statement stmt) throws Exception {
        // ok: java-20-validation
        stmt.executeQuery("SELECT * FROM users WHERE id = 1");
    }
}
