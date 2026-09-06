// Spawning a shell with dynamic content runs attacker input as code.
// Allowlist the argument instead.
import sys.process._

object DangerousShellRun {
  def vuln(cmd: String): Int = {
    // ruleid: dangerous-shell-run
    Seq("sh", "-c", cmd).!
  }
  def vulnAgain(cmd: String): Int = {
    // ruleid: dangerous-shell-run
    Seq("bash", "-c", cmd).!!
  }
  def vulnThird(cmd: String): Int = {
    // ruleid: dangerous-shell-run
    Seq("zsh", "-c", cmd).!
  }
  def safe(): Int = {
    // ok: dangerous-shell-run
    Seq("sh", "-c", "fixed").!
    // ok: dangerous-shell-run
    Seq("bash", "-c", "fixed").!!
    // ok: dangerous-shell-run
    Seq("ls", "-l").!
  }
}
