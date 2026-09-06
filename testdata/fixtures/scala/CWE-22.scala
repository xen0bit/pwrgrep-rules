// CWE-22: Path Traversal - user input reaches File
import java.io.File
import javax.servlet.http.HttpServletRequest

object Cwe22PathTraversal {

  def vuln1(request: HttpServletRequest) = {
    val p = request.getParameter("file")
    // ruleid: scala-path-traversal
    new File(p)
  }

  def vuln2(request: HttpServletRequest) = {
    val q = request.getQueryString()
    // ruleid: scala-path-traversal
    new File(q)
  }

  def vuln3(request: HttpServletRequest) = {
    val r = request.getHeader("X-File")
    // ruleid: scala-path-traversal
    new File(r)
  }

  def vuln4(request: HttpServletRequest) = {
    val s = request.getParameter("name")
    // ruleid: scala-path-traversal
    new File(s)
  }

  def safeLiteral() = {
    // ok: scala-path-traversal
    new File("/tmp/fixed.txt")
  }

  def safeConstant() = {
    val name = "report.csv"
    // ok: scala-path-traversal
    new File("/var/data/" + name)
  }

  def safeBase() = {
    // ok: scala-path-traversal
    new File("/tmp/safe.txt")
  }
}
