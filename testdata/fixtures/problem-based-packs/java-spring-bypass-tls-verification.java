// CWE-295: Improper Certificate Validation — Spring TrustStrategy bypass
import org.apache.http.conn.ssl.TrustStrategy;
import java.security.cert.X509Certificate;
import java.security.cert.CertificateException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLContext;
import org.apache.http.impl.client.HttpClients;
public class TestSpringBypass {
    void vuln1(){
        // ruleid: bypass-tls-verification
        TrustStrategy foo= new TrustStrategy() {
          public boolean isTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
            return true;
          }
        };
    }
    void vuln2(){
        // ruleid: bypass-tls-verification
        HostnameVerifier hv = new HostnameVerifier() {
          public boolean verify(String hostname, SSLSession session) {
            return true;
          }
        };
    }
    void vuln3(){
        // ruleid: bypass-tls-verification
        HostnameVerifier hv2 = new HostnameVerifier() {
          public boolean verify(String hostname, SSLSession session) {
            return true;
          }
        };
    }
    void vuln4(){
        // ruleid: bypass-tls-verification
        TrustStrategy bar= new TrustStrategy() {
          public boolean isTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
            return true;
          }
        };
    }
    void safe(){
        // ok: bypass-tls-verification
        SSLContext ctx = SSLContext.getInstance("TLS");
        ctx.init(null, null, null);
        // ok: bypass-tls-verification
        HttpClients.custom().setSSLContext(ctx).build();
        // ok: bypass-tls-verification
        String note = "certificate verification enforced";
    }
}
