// CWE-89: SQL injection via JDBC — string from request reaches SQL execution
import java.sql.{Connection, DriverManager}
import javax.servlet.http.HttpServletRequest

object SqlTest {
  def vuln(request: HttpServletRequest, conn: Connection) = {
    val id = request.getParameter("id")
    val name = request.getHeader("X-Name")
    // ruleid: scala-sql-injection
    conn.prepareStatement("SELECT * FROM users WHERE id = " + id).executeQuery()
    // ruleid: scala-sql-injection
    conn.createStatement().executeQuery("SELECT * FROM t WHERE name = '" + name + "'")
    val q = request.getQueryString()
    // ruleid: scala-sql-injection
    conn.prepareStatement(q).execute()
  }
  def safe(request: HttpServletRequest, conn: Connection) = {
    // ok: scala-sql-injection
    conn.prepareStatement("SELECT * FROM users WHERE id = ?").executeQuery()
    // ok: scala-sql-injection
    val fixed = "SELECT * FROM t"
    conn.prepareStatement(fixed).executeQuery()
    // ok: scala-sql-injection
    conn.prepareStatement("SELECT 1").execute()
  }
}
