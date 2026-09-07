import org.springframework.jdbc.core.JdbcTemplate;
import javax.sql.DataSource;

public class JdbcFormatted {
    public void vuln(DataSource ds, String name) {
        JdbcTemplate t = new JdbcTemplate(ds);
        // ruleid: jdbc-sql-formatted-string
        t.execute("select * from u where n = '" + name + "'");
    }

    public void vulnAgain(DataSource ds, String name) {
        JdbcTemplate t = new JdbcTemplate(ds);
        // ruleid: jdbc-sql-formatted-string
        t.update(String.format("insert into u values ('%s')", name));
    }

    public void vulnThird(DataSource ds, String name) {
        JdbcTemplate t = new JdbcTemplate(ds);
        // ruleid: jdbc-sql-formatted-string
        t.queryForList("select * from u where n = '" + name + "'");
    }

    public void safe(DataSource ds, String name) {
        JdbcTemplate t = new JdbcTemplate(ds);
        // ok: jdbc-sql-formatted-string
        t.execute("select * from u");
    }

    public void safeAgain(DataSource ds, String name) {
        JdbcTemplate t = new JdbcTemplate(ds);
        // ok: jdbc-sql-formatted-string
        t.queryForList("select * from u where n = ?", name);
    }

    public void plain(String name) {
        // ok: jdbc-sql-formatted-string
        System.out.println("select * from u where n = '" + name + "'");
    }
}
