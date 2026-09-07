import javax.net.ssl.SSLContext;

public class WeakSslContext {
    public void vuln() throws Exception {
        // ruleid: weak-ssl-context
        SSLContext.getInstance("TLS");
    }

    public void vulnAgain() throws Exception {
        // ruleid: weak-ssl-context
        SSLContext.getInstance("TLSv1");
    }

    public void vulnThird() throws Exception {
        // ruleid: weak-ssl-context
        SSLContext.getInstance("SSL");
    }

    public void safe() throws Exception {
        // ok: weak-ssl-context
        SSLContext.getInstance("TLSv1.2");
    }

    public void safeAgain() throws Exception {
        // ok: weak-ssl-context
        SSLContext.getInstance("TLSv1.3");
    }

    public void plain() {
        // ok: weak-ssl-context
        System.out.println("TLS in a comment is not use");
    }
}
