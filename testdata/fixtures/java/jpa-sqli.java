import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

public class JpaSqli {
    public void vuln(EntityManager em, HttpServletRequest request) {
        String name = request.getParameter("name");
        // ruleid: jpa-sqli
        em.createQuery("select u from User u where u.name = '" + name + "'");
    }

    public void vulnAgain(EntityManager em, HttpServletRequest request) {
        String name = request.getParameter("name");
        // ruleid: jpa-sqli
        em.createQuery("select u from User u where u.name = '" + name + "'");
    }

    public void vulnThird(EntityManager em, HttpServletRequest request) {
        String id = request.getParameter("id");
        // ruleid: jpa-sqli
        em.createNativeQuery("select * from users where id = " + id);
    }

    public void safe(EntityManager em, HttpServletRequest request) {
        String name = request.getParameter("name");
        // ok: jpa-sqli
        em.createQuery("select u from User u where u.name = :name");
    }

    public void safeAgain(EntityManager em) {
        // ok: jpa-sqli
        em.createQuery("select u from User u");
    }

    public void plain(String name) {
        // ok: jpa-sqli
        System.out.println("select u where name = '" + name + "'");
    }
}
