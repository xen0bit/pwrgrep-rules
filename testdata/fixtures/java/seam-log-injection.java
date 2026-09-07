import org.jboss.seam.log.Log;

public class SeamLog {
    org.jboss.seam.log.Log log;

    public void vuln(String user) {
        // ruleid: seam-log-injection
        log.info("hello " + user);
    }

    public void vulnAgain(String user) {
        // ruleid: seam-log-injection
        log.error("failed " + user);
    }

    public void vulnThird(String user) {
        // ruleid: seam-log-injection
        log.warn("warn " + user);
    }

    public void safe() {
        // ok: seam-log-injection
        log.info("static message");
    }

    public void safeAgain(String user) {
        // ok: seam-log-injection
        log.info("hello {}", user);
    }

    public void plain(String user) {
        // ok: seam-log-injection
        System.out.println("hello " + user);
    }
}
