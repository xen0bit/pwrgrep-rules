// CWE-798: Use of Hard-coded Credentials via setHeader
// Named Credentials should be used instead of hard-coding Authorization

public class TestCWE798 {
    public void vuln() {
        HttpRequest req = new HttpRequest();
        // ruleid: named-credentials-string-match
        req.setHeader('Authorization', 'Bearer hardcoded_token');
        // ruleid: named-credentials-string-match
        req.setHeader('Authorization', authString);
    }

    public void safe() {
        HttpRequest req = new HttpRequest();
        // ok: named-credentials-string-match
        req.setHeader('Content-Type', 'application/json');
        // ok: named-credentials-string-match
        req.setHeader('X-Custom', 'value');
    }
    String authString = 'test';
}
    public void vuln2() {
        HttpRequest req = new HttpRequest();
        // ruleid: named-credentials-string-match
        req.setHeader('Authorization', 'Basic hardcoded_basic');
        // ruleid: named-credentials-string-match
        req.setHeader('Authorization', 'Bearer ' + authString);
    }

    public void safe2() {
        HttpRequest req = new HttpRequest();
        // ok: named-credentials-string-match
        req.setHeader('Accept', 'application/json');
    }
