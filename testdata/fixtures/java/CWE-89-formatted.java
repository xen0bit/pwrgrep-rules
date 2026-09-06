// CWE-89: a request parameter concatenated into a statement.
//
// The fix is a PreparedStatement with a `?` placeholder, which sends the value
// out of band and never lets it change the shape of the query. Every safe
// method here does that; the unsafe ones build a string first.
package audit;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;

public class Reports {

    public ResultSet byName(Connection c, HttpServletRequest req) throws SQLException {
        String name = req.getParameter("name");
        Statement s = c.createStatement();
        // ruleid: formatted-sql-string
        return s.executeQuery("SELECT * FROM users WHERE name = '" + name + "'");
    }

    public int deleteByHeader(Connection c, HttpServletRequest req) throws SQLException {
        String id = req.getHeader("X-Id");
        Statement s = c.createStatement();
        // ruleid: formatted-sql-string
        return s.executeUpdate("DELETE FROM users WHERE id = " + id);
    }

    public PreparedStatement prepareFromQueryString(Connection c, HttpServletRequest req)
            throws SQLException {
        String q = req.getQueryString();
        // ruleid: formatted-sql-string
        return c.prepareStatement("SELECT * FROM users WHERE " + q);
    }

    public ResultSet parameterised(Connection c, HttpServletRequest req) throws SQLException {
        String name = req.getParameter("name");
        // ok: formatted-sql-string
        PreparedStatement s = c.prepareStatement("SELECT * FROM users WHERE name = ?");
        s.setString(1, name);
        return s.executeQuery();
    }

    public ResultSet fixedQuery(Connection c) throws SQLException {
        Statement s = c.createStatement();
        // ok: formatted-sql-string
        return s.executeQuery("SELECT * FROM users");
    }
}
