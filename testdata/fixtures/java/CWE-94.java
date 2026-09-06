package fixture;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import org.springframework.expression.spel.standard.SpelExpressionParser;

class Cwe94 {

    void viaScriptEngine(HttpServletRequest request) throws Exception {
        String code = request.getParameter("code");
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("javascript");
        // ruleid: java-code-injection
        engine.eval(code);
    }

    void viaScriptEngineAlt(HttpServletRequest request) throws Exception {
        String payload = request.getHeader("X-Code");
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("groovy");
        // ruleid: java-code-injection
        engine.eval(payload);
    }

    void viaSpel(HttpServletRequest request) {
        String expr = request.getParameter("expr");
        SpelExpressionParser parser = new SpelExpressionParser();
        // ruleid: java-code-injection
        parser.parseExpression(expr).getValue();
    }

    void viaConcatenated(HttpServletRequest request) throws Exception {
        String code = request.getParameter("code");
        String full = "function test(){" + code + "}";
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        // ruleid: java-code-injection
        engine.eval(full);
    }

    // ok: java-code-injection
    void safeConstant() throws Exception {
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        engine.eval("1+1");
    }

    // ok: java-code-injection
    void safeSpelConstant() {
        SpelExpressionParser parser = new SpelExpressionParser();
        parser.parseExpression("'hello'.concat(' world')").getValue();
    }

    void safeFromConfig(String configured) throws Exception {
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        // ok: java-code-injection
        engine.eval(configured);
    }
}
