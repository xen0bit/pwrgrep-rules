// CWE-89: SQL injection — Spring JdbcTemplate query built from request data.
// Building a query with string concatenation that contains request.getParameter
// lets an attacker inject SQL via a quote or semicolon.
// Parameterised queries with ? keep code and data apart.
package fixture;

import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
class SpringSqli {

    private JdbcTemplate jdbcTemplate;

    void vuln1(HttpServletRequest request) {
        String user = request.getParameter("user");
        // ruleid: java-sqli-spring
        jdbcTemplate.query("SELECT * FROM users WHERE name='" + user + "'", null);
    }

    void vuln2(HttpServletRequest request) {
        String id = request.getParameter("id");
        String q = "SELECT * FROM t WHERE id=" + id;
        // ruleid: java-sqli-spring
        jdbcTemplate.queryForObject(q, null, String.class);
    }

    void vuln3(HttpServletRequest request) {
        String name = request.getHeader("X-Name");
        // ruleid: java-sqli-spring
        jdbcTemplate.update("DELETE FROM t WHERE name='" + name + "'");
    }

    // ok: java-sqli-spring
    void safe1(HttpServletRequest request) {
        String user = request.getParameter("user");
        jdbcTemplate.query("SELECT * FROM users WHERE name=?", new Object[]{user}, null);
    }

    // ok: java-sqli-spring
    void safe2() {
        jdbcTemplate.query("SELECT * FROM users", null);
    }

    // ok: java-sqli-spring — no request data involved
    void safe3(String configured) {
        jdbcTemplate.query(configured, null);
    }
}
