package fixture;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;

class Cwe89 {

    ResultSet viaExecuteQuery(HttpServletRequest request, Statement stmt) throws Exception {
        String user = request.getParameter("user");
        // ruleid: java-sqli-injection
        return stmt.executeQuery("SELECT * FROM users WHERE name = '" + user + "'");
    }

    ResultSet viaPrepareStatement(HttpServletRequest request, Connection conn) throws Exception {
        String id = request.getHeader("X-User-Id");
        // ruleid: java-sqli-injection
        return conn.prepareStatement("SELECT * FROM t WHERE id = " + id).executeQuery();
    }

    void viaExecute(HttpServletRequest request, Statement stmt) throws Exception {
        String name = request.getParameter("name");
        String q = "SELECT * FROM t WHERE name = '" + name + "'";
        // ruleid: java-sqli-injection
        stmt.execute(q);
    }

    int viaUpdate(HttpServletRequest request, Statement stmt) throws Exception {
        String val = request.getQueryString();
        // ruleid: java-sqli-injection
        return stmt.executeUpdate("DELETE FROM t WHERE val = '" + val + "'");
    }

    // ok: java-sqli-injection
    ResultSet safeConstant(Statement stmt) throws Exception {
        return stmt.executeQuery("SELECT * FROM users");
    }

    // ok: java-sqli-injection
    ResultSet safeParam(Connection conn, String user) throws Exception {
        return conn.prepareStatement("SELECT * FROM users WHERE name = ?").executeQuery();
    }

    void safeFromConfig(String configured, Statement stmt) throws Exception {
        // ok: java-sqli-injection
        stmt.executeQuery(configured);
    }
}
