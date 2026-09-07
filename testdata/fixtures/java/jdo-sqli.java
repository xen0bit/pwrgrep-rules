// Passing a caller-controlled string to a JDO query is SQL injection. The
// rule keys on a fully qualified `javax.jdo.Query` parameter, so the flagged
// methods keep that shape; the same call with a literal filter is fine.
public class JdoSqli {
    String flag(javax.jdo.Query q, String sql) {
        // ruleid: jdo-sqli
        q.setFilter(sql);
        return "done";
    }

    String flagGrouping(javax.jdo.Query q, String sql) {
        // ruleid: jdo-sqli
        q.setGrouping(sql);
        return "done";
    }

    String flagAgain(javax.jdo.Query q, String sql) {
        // ruleid: jdo-sqli
        q.setFilter(sql);
        return "done";
    }

    String safeLiteral(javax.jdo.Query q) {
        // ok: jdo-sqli
        q.setFilter("active = true");
        return "done";
    }

    String safeConcat(javax.jdo.Query q) {
        // ok: jdo-sqli
        q.setFilter("active = " + "true");
        return "done";
    }

    String safeNoQuery(String sql) {
        // ok: jdo-sqli
        return sql;
    }
}
