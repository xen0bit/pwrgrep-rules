// CWE-78: OS Command Injection – user input in System exec
// allows arbitrary OS command. Safe uses literals.

public class TestCWE78 {
    public void vuln(String userInput, String other) {
        // ruleid: apex-command-injection
        System.exec(userInput);
        // ruleid: apex-command-injection
        System.exec(other);
        // ruleid: apex-command-injection
        System.exec(userInput);
        // ruleid: apex-command-injection
        System.exec(other);
    }
    public void safe() {
        // ok: apex-command-injection
        System.exec("ls -la");
        // ok: apex-command-injection
        System.exec("echo hi");
        // ok: apex-command-injection
        System.exec("fixed --version");
    }
}
