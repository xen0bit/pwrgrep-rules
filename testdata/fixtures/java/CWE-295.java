package fixture;

// CWE-295: Improper Certificate Validation - TrustManager accepts all certs

import java.security.cert.X509Certificate;
import javax.net.ssl.*;

class Cwe295TrustAll {

    void vulnerable1() throws Exception {
        TrustManager[] trustAll = new TrustManager[] {
            new X509TrustManager() {
                // ruleid: java-tls-insecure
                public void checkClientTrusted(X509Certificate[] chain, String authType) {}
                // ruleid: java-tls-insecure
                public void checkServerTrusted(X509Certificate[] chain, String authType) {}
                public X509Certificate[] getAcceptedIssuers() { return new X509Certificate[0]; }
            }
        };
        SSLContext.getInstance("TLS").init(null, trustAll, new java.security.SecureRandom());
    }

    void safe() throws Exception {
        // ok: java-tls-insecure
        TrustManager[] trust = new TrustManager[] {
            new X509TrustManager() {
                public void checkClientTrusted(X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                    if (chain == null || chain.length == 0) throw new java.security.cert.CertificateException("empty");
                }
                public void checkServerTrusted(X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                    if (chain == null || chain.length == 0) throw new java.security.cert.CertificateException("empty");
                }
                public X509Certificate[] getAcceptedIssuers() { return new X509Certificate[0]; }
            }
        };
    }

    void noTrustManager() {
        // ok: java-tls-insecure
        System.out.println("no TLS here");
    }
}
    void vulnerable2() throws Exception {
        TrustManager[] trustAll2 = new TrustManager[] {
            new X509TrustManager() {
                // ruleid: java-tls-insecure
                public void checkClientTrusted(X509Certificate[] chain, String authType) {}
                // ruleid: java-tls-insecure
                public void checkServerTrusted(X509Certificate[] chain, String authType) {}
                public X509Certificate[] getAcceptedIssuers() { return new X509Certificate[0]; }
            }
        };
        SSLContext.getInstance("TLS").init(null, trustAll2, new java.security.SecureRandom());
    }

    void safeWithCheck() throws Exception {
        // ok: java-tls-insecure
        TrustManager[] tm = new TrustManager[] {
            new X509TrustManager() {
                public void checkClientTrusted(X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                    if (chain == null) throw new java.security.cert.CertificateException();
                }
                public void checkServerTrusted(X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                    if (chain == null) throw new java.security.cert.CertificateException();
                }
                public X509Certificate[] getAcceptedIssuers() { return null; }
            }
        };
    }
