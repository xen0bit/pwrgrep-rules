// CWE-78: OS command injection via sys.process — taint from request to Seq
import sys.process._
import javax.servlet.http.HttpServletRequest

object CmdTest {
  def vuln(request: HttpServletRequest) = {
    val cmd = request.getParameter("cmd")
    // ruleid: scala-dangerous-process-run
    Seq(cmd, "arg").!
    val token = request.getHeader("X-Cmd")
    // ruleid: scala-dangerous-process-run
    Seq(token, "arg").!!
    val data = request.getQueryString()
    // ruleid: scala-dangerous-process-run
    Seq(data).lazyLines
  }
  def safe() = {
    // ok: scala-dangerous-process-run
    Seq("ls", "-l").!
    // ok: scala-dangerous-process-run
    Seq("fixed", "arg").!!
    // ok: scala-dangerous-process-run
    Seq("hello").lazyLines
  }
}
