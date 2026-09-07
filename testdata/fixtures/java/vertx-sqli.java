// Passing a caller-controlled string to a Vert.x client is SQL injection. The
// rule keys on a `SqlClient`/`SqlConnection` parameter plus a `String sql`
// parameter, so the flagged methods keep that shape; a literal query in a
// method without the SQL parameter is fine.
import io.vertx.sqlclient.SqlClient;
import io.vertx.sqlclient.SqlConnection;

public class VertxSqli {
    String flag(SqlClient sc, String sql) {
        // ruleid: vertx-sqli
        sc.query(sql);
        return "done";
    }

    String flagPrepared(SqlClient sc, String sql) {
        // ruleid: vertx-sqli
        sc.preparedQuery(sql);
        return "done";
    }

    String flagConn(SqlConnection sc, String sql) {
        // ruleid: vertx-sqli
        sc.query(sql);
        return "done";
    }

    String safeLiteral(SqlClient sc) {
        // ok: vertx-sqli
        sc.query("SELECT 1");
        return "done";
    }

    String safeNoClient(String sql) {
        // ok: vertx-sqli
        return sql;
    }

    String safeStatic() {
        // ok: vertx-sqli
        return "SELECT 1";
    }
}
