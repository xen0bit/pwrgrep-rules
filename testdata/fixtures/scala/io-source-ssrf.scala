// Reading from a request-supplied URL makes the server fetch attacker
// content (SSRF). Allowlist the source instead.
import scala.io.Source

object IoSourceSsrf {
  def vuln(path: String) = {
    // ruleid: io-source-ssrf
    Source.fromURL(path)
  }
  def vulnAgain(loc: String) = {
    // ruleid: io-source-ssrf
    Source.fromURL(loc)
  }
  def vulnThird(addr: String) = {
    // ruleid: io-source-ssrf
    Source.fromURI(addr)
  }
  def safe() = {
    // ok: io-source-ssrf
    val fixed = "https://example.com"
    // ok: io-source-ssrf
    val data = "https://example.com/data"
    // ok: io-source-ssrf
    Source.fromFile("/tmp/fixed.txt")
  }
}
