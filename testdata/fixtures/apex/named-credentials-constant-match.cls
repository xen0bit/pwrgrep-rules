// Hard-coding the Authorization header bypasses Named Credentials.
// Use a callout endpoint with a named credential instead.
public class NamedCredentialsConstantMatch {
    public void vuln() {
        HttpRequest req = new HttpRequest();
        // ruleid: named-credentials-constant-match
        String auth = 'Authorization';
        req.setHeader(auth, 'Bearer hardcoded');
    }
    public void vulnAgain() {
        HttpRequest req = new HttpRequest();
        // ruleid: named-credentials-constant-match
        String token = 'Authorization';
        req.setHeader(token, 'Basic hardcoded');
    }
    public void vulnThird() {
        HttpRequest req = new HttpRequest();
        // ruleid: named-credentials-constant-match
        String hdr = 'Authorization';
        req.setHeader(hdr, 'fixed');
    }
    public void safe() {
        HttpRequest req = new HttpRequest();
        // ok: named-credentials-constant-match
        req.setHeader('Content-Type', 'application/json');
        // ok: named-credentials-constant-match
        req.setHeader('Accept', 'application/json');
        // ok: named-credentials-constant-match
        req.setEndpoint('callout:MyCredential');
    }
}
