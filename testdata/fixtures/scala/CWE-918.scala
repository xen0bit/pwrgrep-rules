// CWE-918: SSRF via various Scala HTTP clients
import scalaj.http.Http
import dispatch._
import scala.io.Source
import play.api.libs.ws.WSClient
import javax.servlet.http.HttpServletRequest

object SsrfTest {
  def vulnDispatch(request: HttpServletRequest) = {
    val url = request.getParameter("url")
    // ruleid: scala-ssrf
    Http(url).asString
    // ruleid: scala-ssrf
    url(url)
    // ruleid: scala-ssrf
    Source.fromURL(url)
  }
  def vulnWs(request: HttpServletRequest, ws: WSClient) = {
    val target = request.getHeader("X-Target")
    // ruleid: scala-ssrf
    ws.url(target).get()
    val q = request.getQueryString()
    // ruleid: scala-ssrf
    Source.fromURI(q)
  }
  def safe(ws: WSClient) = {
    // ok: scala-ssrf
    Http("https://example.com").asString
    // ok: scala-ssrf
    url("https://example.com")
    // ok: scala-ssrf
    Source.fromURL("https://example.com")
    // ok: scala-ssrf
    ws.url("https://example.com").get()
  }
}
