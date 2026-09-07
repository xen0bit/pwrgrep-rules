import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class ScriptEngineVuln {
    // ruleid: script-engine-injection
    public void vuln(String code) {
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        engine.eval(code);
    }

    // ok: script-engine-injection
    public void safe() {
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        try {
            engine.eval("1+1");
        } catch (Exception e) {
        }
    }
}

class ScriptEngineVulnAgain {
    // ruleid: script-engine-injection
    public void vulnAgain(String code) {
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        engine.eval(code);
    }

    // ok: script-engine-injection
    public void safeAgain() {
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
        try {
            engine.eval("2+2");
        } catch (Exception e) {
        }
    }

    // ok: script-engine-injection
    public int add(int a, int b) {
        return a + b;
    }
}
