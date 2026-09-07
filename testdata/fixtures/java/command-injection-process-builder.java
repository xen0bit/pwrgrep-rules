public class PbFixture {
    public void shell(String input) throws Exception {
        // ruleid: command-injection-process-builder
        ProcessBuilder pb = new ProcessBuilder("sh", "-c", input);
        pb.start();
    }

    public void variable(String cmd) throws Exception {
        // ruleid: command-injection-process-builder
        ProcessBuilder pb = new ProcessBuilder(cmd);
        pb.start();
    }

    public void literal() throws Exception {
        // ok: command-injection-process-builder
        ProcessBuilder pb = new ProcessBuilder("ls", "-l");
        pb.start();
    }

    public void literalCommand() throws Exception {
        ProcessBuilder pb = new ProcessBuilder("echo");
        // ok: command-injection-process-builder
        pb.command("echo", "hi");
    }
}
