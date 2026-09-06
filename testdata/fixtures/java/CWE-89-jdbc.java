import java.sql.*;
import javax.servlet.http.*;

public class JdbcTest {
    public void bad1(HttpServletRequest req, Connection conn) throws SQLException {
        String q = req.getParameter("q");
        Statement stmt = conn.createStatement();
        // ruleid: jdbc-sqli
        stmt.executeQuery(q);
    }
    public void good1(Connection conn) throws SQLException {
        Statement stmt = conn.createStatement();
        // ok: jdbc-sqli
        stmt.executeQuery("SELECT * FROM table WHERE id = 1");
    }
    public void bad2(HttpServletRequest req, Connection conn) throws SQLException {
        String input = req.getHeader("X-Input");
        Statement s = conn.createStatement();
        // ruleid: jdbc-sqli
        s.executeUpdate(input);
    }
    public void good2(Connection conn) throws SQLException {
        Statement s = conn.createStatement();
        // ok: jdbc-sqli
        s.executeUpdate("UPDATE table SET x=1");
    }
    public void bad3(HttpServletRequest req, Connection conn) throws SQLException {
        String data = req.getQueryString();
        Statement st = conn.createStatement();
        // ruleid: jdbc-sqli
        st.execute(data);
    }
    public void good3(Connection conn) throws SQLException {
        Statement st = conn.createStatement();
        // ok: jdbc-sqli
        st.execute("SELECT 1");
    }
}
