// CWE-326: Weak TLS version
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import javax.net.ssl.SSLContext;
public class TestDisallow1 {
    void vuln1(){
        // ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf1 = new SSLConnectionSocketFactory(null, null, null, null);
        // ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf2 = new SSLConnectionSocketFactory(null, null, null, null);
        // ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf3 = new SSLConnectionSocketFactory(SSLContext.getDefault(), null, null, null);
        // ruleid: disallow-old-tls-versions1
        SSLConnectionSocketFactory sf4 = new SSLConnectionSocketFactory(null, null, null, javax.net.ssl.SSLConnectionSocketFactory.getDefaultHostnameVerifier());
    }
    void safe(){
        // ok: disallow-old-tls-versions1
        SSLContext ctx1 = SSLContext.getInstance("TLSv1.2");
        // ok: disallow-old-tls-versions1
        SSLContext ctx2 = SSLContext.getInstance("TLSv1.3");
        // ok: disallow-old-tls-versions1
        System.out.println("TLS 1.2 enforced via context");
    }
}
