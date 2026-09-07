// Running an external process with dynamic content executes attacker
// input as a command. Allowlist the command instead.
import sys.process._

object DangerousSeqRun {
  def vuln(cmd: String): Int = {
    // ruleid: dangerous-seq-run
    Seq(cmd, "fixed").!
  }
  def vulnAgain(args: String): Int = {
    // ruleid: dangerous-seq-run
    Seq(args, "--all").!!
  }
  def vulnThird(cmd: String): LazyList[String] = {
    // ruleid: dangerous-seq-run
    Seq(cmd, "fixed").lazyLines.to(LazyList)
  }
  def safe(): Int = {
    // ok: dangerous-seq-run
    Seq("ls", "-l").!
    // ok: dangerous-seq-run
    Seq("echo", "fixed").!!
    // ok: dangerous-seq-run
    Seq("ls").lazyLines.size
  }
}
