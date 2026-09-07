import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

// ruleid: insecure-hostname-verifier
class TrustingVerifier implements HostnameVerifier {
    public boolean verify(String hostname, SSLSession session) {
        return true;
    }
}

// ruleid: insecure-hostname-verifier
class TrustingAgain implements HostnameVerifier {
    public boolean verify(String hostname, SSLSession session) {
        return true;
    }
}

// ruleid: insecure-hostname-verifier
class TrustingThird implements HostnameVerifier {
    public boolean verify(String hostname, SSLSession session) {
        return true;
    }
}

class CheckingVerifier implements HostnameVerifier {
    // ok: insecure-hostname-verifier
    public boolean verify(String hostname, SSLSession session) {
        return hostname.equals("example.com");
    }
}

// ok: insecure-hostname-verifier
class PlainHelper {
    public boolean check(String hostname) {
        return hostname.length() > 0;
    }
}

// ok: insecure-hostname-verifier
class Empty {
}
