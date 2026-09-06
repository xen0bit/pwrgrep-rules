// CWE-20: request query without validation — Scala
import javax.servlet.http.HttpServletRequest
import java.sql.{Connection, Statement}

object Handler {
  def vuln1(request: HttpServletRequest, conn: Connection) = {
    val id = request.getParameter("id")
    // ruleid: scala-20-validation
    conn.prepareStatement("SELECT * FROM users WHERE id = " + id).executeQuery()
  }

  def vuln2(request: HttpServletRequest, stmt: Statement) = {
    val q = request.getQueryString()
    // ruleid: scala-20-validation
    stmt.executeQuery(q)
  }

  def vuln3(request: HttpServletRequest) = {
    val cmd = request.getHeader("X-Cmd")
    // ruleid: scala-20-validation
    Runtime.getRuntime().exec(cmd)
  }

  def safeRegex(request: HttpServletRequest, conn: Connection) = {
    val id = request.getParameter("id")
    if (!id.matches("^[a-z0-9]+$")) throw new IllegalArgumentException()
    // ok: scala-20-validation
    conn.prepareStatement("SELECT * FROM users WHERE id = ?").executeQuery()
  }

  def safeFixed(request: HttpServletRequest, stmt: Statement) = {
    // ok: scala-20-validation
    stmt.executeQuery("SELECT * FROM users WHERE id = 1")
  }
}
