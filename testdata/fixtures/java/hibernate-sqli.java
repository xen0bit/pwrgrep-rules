import org.hibernate.Session;
import javax.servlet.http.HttpServletRequest;

public class HibernateSqli {
    public void vuln(Session session, HttpServletRequest request) {
        String name = request.getParameter("name");
        // ruleid: hibernate-sqli
        session.createQuery("from User where name = '" + name + "'");
    }

    public void vulnAgain(Session session, HttpServletRequest request) {
        String name = request.getParameter("name");
        // ruleid: hibernate-sqli
        session.createQuery("from User where name = '" + name + "'");
    }

    public void vulnThird(Session session, HttpServletRequest request) {
        String id = request.getParameter("id");
        // ruleid: hibernate-sqli
        session.createSQLQuery("select * from users where id = " + id);
    }

    public void safe(Session session, HttpServletRequest request) {
        String name = request.getParameter("name");
        // ok: hibernate-sqli
        session.createQuery("from User where name = :name");
    }

    public void safeAgain(Session session) {
        // ok: hibernate-sqli
        session.createQuery("from User");
    }

    public void plain(String name) {
        // ok: hibernate-sqli
        System.out.println("from User where name = '" + name + "'");
    }
}
