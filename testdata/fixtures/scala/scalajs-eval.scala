// eval runs its string as JavaScript, so request input becomes code.
// Avoid eval or allowlist the expression instead.
import scala.scalajs.js

object ScalajsEval {
  def vuln(js: js.Dynamic, code: String) = {
    // ruleid: scalajs-eval
    js.eval(code)
  }
  def vulnAgain(js: js.Dynamic, expr: String) = {
    // ruleid: scalajs-eval
    js.eval(expr)
  }
  def vulnThird(js: js.Dynamic, input: String) = {
    // ruleid: scalajs-eval
    js.eval(input)
  }
  def safe(js: js.Dynamic) = {
    // ok: scalajs-eval
    val fixed = "1 + 1"
    // ok: scalajs-eval
    val expr = "fixed-expression"
    // ok: scalajs-eval
    js.applyDynamic("fixed")()
  }
}
