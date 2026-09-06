// CWE-77: Command injection via Runtime.exec with shell metacharacter
package fixture;

public class ShellFixture {

    public void vuln1(String userInput) throws Exception {
        // ruleid: java-77-shell
        Runtime.getRuntime().exec("ls " + userInput + "; cat /etc/passwd");
    }

    public void vuln2(String userInput) throws Exception {
        // ruleid: java-77-shell
        Runtime.getRuntime().exec("echo " + userInput + " | grep foo");
    }

    public void vuln3(String data) throws Exception {
        // ruleid: java-77-shell
        Runtime.getRuntime().exec("cat " + data + " && rm -rf /");
    }

    public void safe1() throws Exception {
        // ok: java-77-shell
        Runtime.getRuntime().exec("ls -la");
    }

    public void safe2() throws Exception {
        // ok: java-77-shell
        Runtime.getRuntime().exec("echo hello");
    }
}
