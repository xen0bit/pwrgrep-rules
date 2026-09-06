// CWE-327: weak crypto — scala.util.Random is predictable, not for security
import java.security.SecureRandom

object WeakCrypto {
  // ruleid: insecure-random
  import scala.util.Random
  // ruleid: insecure-random
  import scala.util.Random
  // ruleid: insecure-random
  import scala.util.Random
  // ok: insecure-random
  val s1 = new SecureRandom()
  // ok: insecure-random
  val s2 = SecureRandom.getInstance("SHA1PRNG")
  // ok: insecure-random
  val ok = 42
}
