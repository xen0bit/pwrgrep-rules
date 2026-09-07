public class RuntimeExec {
    public void vuln(String cmd) throws Exception {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("ls " + cmd);
    }

    public void vulnAgain(String cmd) throws Exception {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("echo " + cmd);
    }

    public void vulnThird(String dir, String file) throws Exception {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("cat " + dir + file);
    }

    public void safe() throws Exception {
        // ok: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("ls -l");
    }

    public void safeArgs(String cmd) throws Exception {
        // ok: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec(new String[]{"ls", cmd});
    }

    public void plain(String cmd) {
        // ok: command-injection-formatted-runtime-call
        System.out.println("ls " + cmd);
    }
}
