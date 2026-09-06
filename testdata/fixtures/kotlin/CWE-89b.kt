// CWE-89: SQLi
package fixture
class Test89b {
    fun vuln(conn: java.sql.Connection, user: String) {
        // ruleid: kotlin-sqli
        conn.prepareStatement(user)
        // ruleid: kotlin-sqli
        conn.createStatement().executeQuery(user)
    }
    fun safe(conn: java.sql.Connection) {
        // ok: kotlin-sqli
        conn.prepareStatement("SELECT * FROM t WHERE id=1")
        // ok: kotlin-sqli
        conn.createStatement().executeQuery("SELECT 1")
    }
    fun vulnExtra(conn: java.sql.Connection, id: String) {
        // ruleid: kotlin-sqli
        conn.createStatement().execute(id)
    }
    fun vulnPrepare(conn: java.sql.Connection, query: String) {
        // ruleid: kotlin-sqli
        conn.prepareStatement(query).executeQuery()
    }
    fun safeParam(conn: java.sql.Connection) {
        // ok: kotlin-sqli
        conn.prepareStatement("SELECT * FROM users WHERE id = ?")
    }
}
