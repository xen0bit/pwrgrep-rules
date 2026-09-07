import org.hibernate.Session;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SessionSqli {
    // ruleid: find-sql-string-concatenation
    public ResultSet lookup(String name) throws Exception {
        Session session = factory.openSession();
        String query = "select * from u where name = '" + name + "'";
        PreparedStatement ps = session.connection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    // ruleid: find-sql-string-concatenation
    public ResultSet find(String email) throws Exception {
        Session session = factory.openSession();
        String query = "select * from u where email = '" + email + "'";
        PreparedStatement ps = session.connection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    // ruleid: find-sql-string-concatenation
    public ResultSet get(String id) throws Exception {
        Session session = factory.openSession();
        String query = "select * from u where id = '" + id + "'";
        PreparedStatement ps = session.connection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    // ok: find-sql-string-concatenation
    public ResultSet safe(String name) throws Exception {
        Session session = factory.openSession();
        PreparedStatement ps = session.connection().prepareStatement("select * from u where name = ?");
        ps.setString(1, name);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    // ok: find-sql-string-concatenation
    public String plain(String name) {
        return "hello " + name;
    }

    // ok: find-sql-string-concatenation
    public int count() {
        return 42;
    }
}
