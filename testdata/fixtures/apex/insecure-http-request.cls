// Cleartext http endpoints can be sniffed. Use https or a named
// credential instead.
public class InsecureHttpRequest {
    public void vuln() {
        // ruleid: insecure-http-request
        String a = 'http://evil.com/api';
        // ruleid: insecure-http-request
        String b = 'http://insecure.example.org/data';
        // ruleid: insecure-http-request
        req.setEndpoint('http://legacy.example.net/x');
    }
    public void safe() {
        // ok: insecure-http-request
        String a = 'https://safe.example.com/api';
        // ok: insecure-http-request
        req.setEndpoint('callout:MyCredential');
        // ok: insecure-http-request
        // String b = 'http://commented.com';
    }
}
