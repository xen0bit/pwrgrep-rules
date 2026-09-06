package fixture;

import javax.servlet.http.HttpServletRequest;

class Cwe78 {

    void viaRuntime(HttpServletRequest request) throws Exception {
        String cmd = request.getParameter("cmd");
        // ruleid: java-os-command-injection
        Runtime.getRuntime().exec(cmd);
    }

    void viaProcessBuilder(HttpServletRequest request) throws Exception {
        String input = request.getHeader("X-Cmd");
        // ruleid: java-os-command-injection
        new ProcessBuilder(input).start();
    }

    void viaProcessBuilderWithArgs(HttpServletRequest request) throws Exception {
        String cmd = request.getParameter("cmd");
        String arg = request.getParameter("arg");
        String full = cmd + " " + arg;
        // ruleid: java-os-command-injection
        new ProcessBuilder(full, arg).start();
    }

    void viaRuntimeWithEnv(HttpServletRequest request) throws Exception {
        String data = request.getQueryString();
        // ruleid: java-os-command-injection
        Runtime.getRuntime().exec(data, (String[]) null);
    }

    // ok: java-os-command-injection
    void safeConstant() throws Exception {
        Runtime.getRuntime().exec("ls -la");
    }

    // ok: java-os-command-injection
    void safeBuilderConstant() throws Exception {
        new ProcessBuilder("echo", "hello").start();
    }

    void safeFromConfig(String configured) throws Exception {
        // ok: java-os-command-injection
        Runtime.getRuntime().exec(configured);
    }
}
