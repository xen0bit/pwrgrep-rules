// Passing a request parameter straight into the dispatch client makes
// the server fetch an attacker URL (SSRF). Allowlist the host instead.
import dispatch._

object DispatchSsrf {
  def vuln(target: String) = {
    // ruleid: dispatch-ssrf
    url(target)
  }
  def vulnAgain(dest: String) = {
    // ruleid: dispatch-ssrf
    url(dest)
  }
  def vulnThird(path: String) = {
    // ruleid: dispatch-ssrf
    url(path)
  }
  def safe() = {
    // ok: dispatch-ssrf
    val fixed = "https://example.com"
    // ok: dispatch-ssrf
    val api = "https://api.example.com/v1"
    // ok: dispatch-ssrf
    val other = "https://fixed.example.org"
  }
}
