// Hardcoded JWT keys ship the secret in every deploy. Load the key from
// the environment instead of writing it in the call.
import pdi.jwt.Jwt

object JwtScalaHardcode {
  def vuln(token: String): String = {
    // ruleid: jwt-scala-hardcode
    Jwt.encode(token, "hardcoded-secret", "HS256")
  }
  def vulnAgain(token: String): Boolean = {
    // ruleid: jwt-scala-hardcode
    Jwt.isValid(token, "another-secret", "HS256")
  }
  def vulnThird(token: String): String = {
    // ruleid: jwt-scala-hardcode
    Jwt.decode(token, "third-secret", Seq("HS256")).toString
  }
  def safe(token: String): String = {
    // ok: jwt-scala-hardcode
    Jwt.encode(token, sys.env("JWT_SECRET"), "HS256")
    // ok: jwt-scala-hardcode
    Jwt.isValid(token, sys.env("JWT_SECRET"), "HS256")
    // ok: jwt-scala-hardcode
    Jwt.encode("fixed-claim", sys.env("JWT_SECRET"), "HS256")
  }
}
