// CWE-326: Weak TLS version via jdk.tls.client.protocols
import javax.net.ssl.SSLContext;
public class TestDisallow2 {
    void vuln1(){
        // ruleid: disallow-old-tls-versions2
        foo.bar.setProperty("jdk.tls.client.protocols", "TLSv1");
        // ruleid: disallow-old-tls-versions2
        foo.bar.setProperty("jdk.tls.client.protocols", "SSLv3");
        // ruleid: disallow-old-tls-versions2
        foo.bar.setProperty("jdk.tls.client.protocols", "TLSv1.1");
        // ruleid: disallow-old-tls-versions2
        foo.bar.setProperty("jdk.tls.client.protocols", "TLSv1, TLSv1.1");
    }
    void safe(){
        // ok: disallow-old-tls-versions2
        SSLContext ctx = SSLContext.getInstance("TLSv1.2");
        // ok: disallow-old-tls-versions2
        SSLContext ctx2 = SSLContext.getInstance("TLSv1.3");
        // ok: disallow-old-tls-versions2
        System.out.println("TLS 1.2 enforced");
    }
}
