import javax.net.ssl.X509TrustManager;
import java.security.cert.X509Certificate;

class TrustAll implements X509TrustManager {
    // ruleid: insecure-trust-manager
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}

class TrustAgain implements X509TrustManager {
    // ruleid: insecure-trust-manager
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}

class TrustThird implements X509TrustManager {
    // ruleid: insecure-trust-manager
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}

class RealTrust implements X509TrustManager {
    // ok: insecure-trust-manager
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }
}

// ok: insecure-trust-manager
class PlainHelper {
    public void check() {
    }
}

// ok: insecure-trust-manager
class Empty {
}
