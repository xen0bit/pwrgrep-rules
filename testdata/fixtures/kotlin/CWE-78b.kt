// CWE-78: OS command injection via Runtime.exec with user input
package fixture
class Test78b {
    fun vuln(host: String) {
        // ruleid: kotlin-os-command
        Runtime.getRuntime().exec(host)
        // ruleid: kotlin-os-command
        ProcessBuilder(host, "arg").start()
    }
    fun vuln2(cmd: String) {
        // ruleid: kotlin-os-command
        Runtime.getRuntime().exec(cmd)
        // ruleid: kotlin-os-command
        ProcessBuilder(cmd).start()
    }
    fun safe() {
        // ok: kotlin-os-command
        Runtime.getRuntime().exec("ls")
        // ok: kotlin-os-command
        ProcessBuilder("echo", "hi").start()
    }
    fun safe2() {
        // ok: kotlin-os-command
        Runtime.getRuntime().exec("echo fixed")
    }
}
