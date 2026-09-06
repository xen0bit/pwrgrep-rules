// Passing a request parameter into the HTTP client makes the server
// fetch an attacker URL (SSRF). Allowlist the target instead.
import scalaj.http.Http

object ScalajHttpSsrf {
  def vuln(target: String) = {
    // ruleid: scalaj-http-ssrf
    Http(target).asString
  }
  def vulnAgain(dest: String) = {
    // ruleid: scalaj-http-ssrf
    Http(dest).asString
  }
  def vulnThird(path: String) = {
    // ruleid: scalaj-http-ssrf
    Http(path).asString
  }
  def safe() = {
    // ok: scalaj-http-ssrf
    val fixed = "https://example.com"
    // ok: scalaj-http-ssrf
    val api = "https://api.example.com/v1"
    // ok: scalaj-http-ssrf
    val other = "https://fixed.example.org"
  }
}
