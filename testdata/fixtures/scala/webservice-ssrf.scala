// Passing a request parameter into the WS client makes the server fetch
// an attacker URL (SSRF). Allowlist the target instead.
import play.api.libs.ws.WSClient

object WebserviceSsrf {
  def vuln(ws: WSClient, target: String) = {
    // ruleid: webservice-ssrf
    ws.url(target).get()
  }
  def vulnAgain(ws: WSClient, dest: String) = {
    // ruleid: webservice-ssrf
    ws.url(dest).get()
  }
  def vulnThird(ws: WSClient, path: String) = {
    // ruleid: webservice-ssrf
    ws.url(path).get()
  }
  def safe(ws: WSClient) = {
    // ok: webservice-ssrf
    val fixed = "https://example.com"
    // ok: webservice-ssrf
    val api = "https://api.example.com/v1"
    // ok: webservice-ssrf
    val other = "https://fixed.example.org"
  }
}
