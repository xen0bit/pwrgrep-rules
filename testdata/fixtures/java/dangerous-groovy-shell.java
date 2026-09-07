import groovy.lang.GroovyShell;

public class GroovyShellUse {
    public void vuln(String code) {
        groovy.lang.GroovyShell shell = new groovy.lang.GroovyShell();
        // ruleid: dangerous-groovy-shell
        shell.evaluate(code);
    }

    public void vulnAgain(String code) {
        groovy.lang.GroovyShell shell = new groovy.lang.GroovyShell();
        // ruleid: dangerous-groovy-shell
        shell.evaluate(code);
    }

    public void vulnParse(String code) {
        groovy.lang.GroovyShell shell = new groovy.lang.GroovyShell();
        // ruleid: dangerous-groovy-shell
        shell.parse(code);
    }

    public void safe() {
        groovy.lang.GroovyShell shell = new groovy.lang.GroovyShell();
        // ok: dangerous-groovy-shell
        shell.evaluate("1+1");
    }

    public void safeParse() {
        groovy.lang.GroovyShell shell = new groovy.lang.GroovyShell();
        // ok: dangerous-groovy-shell
        shell.parse("println 1");
    }

    public void plain(String code) {
        // ok: dangerous-groovy-shell
        System.out.println(code);
    }
}
