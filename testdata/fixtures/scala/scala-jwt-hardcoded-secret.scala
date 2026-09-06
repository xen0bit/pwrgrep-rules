// Hardcoded JWT HMAC secrets ship in every deploy. Load the secret from
// the environment instead.
object JwtHardcode {
  def vuln(): Unit = {
    // ruleid: scala-jwt-hardcoded-secret
    com.auth0.jwt.algorithms.Algorithm.HMAC256("hardcoded-secret");
  }
  def vulnAgain(): Unit = {
    // ruleid: scala-jwt-hardcoded-secret
    com.auth0.jwt.algorithms.Algorithm.HMAC384("another-secret");
  }
  def vulnThird(): Unit = {
    // ruleid: scala-jwt-hardcoded-secret
    com.auth0.jwt.algorithms.Algorithm.HMAC512("third-secret");
  }
  def safe(): Unit = {
    // ok: scala-jwt-hardcoded-secret
    com.auth0.jwt.algorithms.Algorithm.HMAC256(sys.env("JWT_SECRET"));
    // ok: scala-jwt-hardcoded-secret
    com.auth0.jwt.algorithms.Algorithm.HMAC384(sys.env("JWT_SECRET"));
    // ok: scala-jwt-hardcoded-secret
    val fixed = "no-jwt-here";
  }
}
