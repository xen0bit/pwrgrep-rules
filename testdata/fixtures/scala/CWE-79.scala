// CWE-79: XSS via Play Html — untrusted input reaches raw HTML without escaping
import play.api.templates.Html
import javax.servlet.http.HttpServletRequest

object XssTest {
  def vuln(request: HttpServletRequest) = {
    val user = request.getParameter("name")
    // ruleid: scala-xss
    Html(user)
    // ruleid: scala-xss
    Html.apply(user)
    val data = request.getHeader("X-Data")
    // ruleid: scala-xss
    Html(data)
    // propagation
    val propagated = user
    // ruleid: scala-xss
    Html(propagated)
  }
  def safe() = {
    // ok: scala-xss
    Html("fixed string")
    // ok: scala-xss
    Html.apply("hello")
    // ok: scala-xss
    val safe = "constant"
    Html(safe)
  }
}
