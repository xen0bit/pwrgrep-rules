// CWE-326: Inadequate Encryption Strength — unsafe renegotiation
import javax.net.ssl.SSLContext;
public class TestTLSReneg {
    void vuln1(){
        // ruleid: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", true);
        // ruleid: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", true);
        // ruleid: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", true);
        // ruleid: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", true);
    }
    void safe(){
        // ok: tls-renegotiation
        java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", false);
        // ok: tls-renegotiation
        SSLContext ctx = SSLContext.getInstance("TLSv1.2");
        // ok: tls-renegotiation
        System.out.println("renegotiation disabled by default");
    }
}
