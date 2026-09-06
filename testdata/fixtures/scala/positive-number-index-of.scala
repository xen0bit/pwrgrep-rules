// indexOf returns -1 when absent, so `> 0` misses index zero and `>= 0`
// is always true for found values. Compare against -1 instead.
object PositiveNumberIndexOf {
  def vuln(s: String): Boolean = {
    // ruleid: positive-number-index-of
    s.indexOf("x") > 0
  }
  def vulnAgain(s: String): Boolean = {
    // ruleid: positive-number-index-of
    s.indexOf("y") > 1
  }
  def vulnThird(s: String): Boolean = {
    // ruleid: positive-number-index-of
    s.indexOf("z") >= 1
  }
  def safe(s: String): Boolean = {
    // ok: positive-number-index-of
    s.indexOf("x") > -1
    // ok: positive-number-index-of
    s.indexOf("y") == -1
    // ok: positive-number-index-of
    s.contains("z")
  }
}
