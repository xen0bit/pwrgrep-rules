// CWE-94: Code Injection via ToolBox and ScriptEngine
//
// Untrusted input passed to ToolBox.eval or ScriptEngine.eval is executed
// as Scala/Java code. The source is a request parameter.

import javax.servlet.http.HttpServletRequest
import scala.reflect.runtime.currentMirror
import scala.tools.reflect.ToolBox
import javax.script.{ScriptEngineManager, ScriptEngine}

object Cwe94CodeInjection {
  def viaToolbox(request: HttpServletRequest): Unit = {
    val code = request.getParameter("code")
    val tb = currentMirror.mkToolBox()
    // ruleid: scala-code-injection
    tb.eval(tb.parse(code))
  }

  def viaEngine(request: HttpServletRequest): Unit = {
    val expr = request.getParameter("expr")
    val engine: ScriptEngine = new ScriptEngineManager().getEngineByName("js")
    // ruleid: scala-code-injection
    engine.eval(expr)
  }

  def viaDirect(request: HttpServletRequest): Unit = {
    val input = request.getParameter("input")
    val engine = new ScriptEngineManager().getEngineByName("scala")
    // ruleid: scala-code-injection
    engine.eval(input)
  }

  def safe(): Unit = {
    // ok: scala-code-injection
    val tb = currentMirror.mkToolBox()
    tb.eval(tb.parse("1 + 1"))
    // ok: scala-code-injection
    val engine = new ScriptEngineManager().getEngineByName("js")
    engine.eval("1+1")
    // ok: scala-code-injection
    val code = "fixed"
    tb.eval(tb.parse(code))
  }
}
