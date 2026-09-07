// Building the file path from request input lets an attacker escape the
// directory (path traversal). Allowlist the name instead.
import scala.io.Source

object PathTraversalFromfile {
  def read(name: String) = Action {
    // ruleid: path-traversal-fromfile
    Source.fromFile("/tmp/" + name)
  }
  def readAgain(name: String) = Action {
    // ruleid: path-traversal-fromfile
    Source.fromFile(name + ".txt")
  }
  def readThird(base: String) = Action {
    // ruleid: path-traversal-fromfile
    Source.fromFile("/var/data/" + base)
  }
  def safe() = Action {
    // ok: path-traversal-fromfile
    Source.fromFile("/tmp/fixed.txt")
    // ok: path-traversal-fromfile
    Source.fromFile("/var/data/fixed.txt")
    // ok: path-traversal-fromfile
    val fixed = "fixed.txt"
  }
}
object Action {
  def apply[A](a: A): A = a
}
