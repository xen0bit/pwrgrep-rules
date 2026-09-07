// CWE-295: an empty trust manager accepts every certificate, while one that
// throws on untrusted input enforces verification. Empty managers flag; the
// throwing manager in the middle stays quiet.
import javax.net.ssl.X509TrustManager;
import java.security.cert.X509Certificate;
import java.security.cert.CertificateException;

public class TestBypass {
    void vuln() {
        // ruleid: bypass-tls-verification
        X509TrustManager tm = new X509TrustManager() {
            public void checkClientTrusted(X509Certificate[] certs, String authType) {
            }
            public void checkServerTrusted(X509Certificate[] certs, String authType) {
            }
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }
        };
    }
    void safe() {
        // ok: bypass-tls-verification
        X509TrustManager t0 = new X509TrustManager() {
            public void checkClientTrusted(X509Certificate[] certs, String authType) {
            }
            public void checkServerTrusted(X509Certificate[] certs, String authType) {
                // ok: bypass-tls-verification
                throw new CertificateException("untrusted");
            }
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }
        };
    }
    void vuln2() {
        // ruleid: bypass-tls-verification
        X509TrustManager tm2 = new X509TrustManager() {
            public void checkClientTrusted(X509Certificate[] certs, String authType) {
            }
            public void checkServerTrusted(X509Certificate[] certs, String authType) {
            }
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }
        };
    }
}
