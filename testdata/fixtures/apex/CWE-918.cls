// CWE-918: SSRF – user-controlled URL in setEndpoint allows server to
// fetch internal resources. Variable vs literal distinction.

public class TestCWE918 {
    public void vuln(String userInput, String other) {
        HttpRequest req = new HttpRequest();
        // ruleid: apex-ssrf
        req.setEndpoint(userInput);
        // ruleid: apex-ssrf
        req.setEndpoint(other);
        // ruleid: apex-ssrf
        req.setEndpoint(userInput);
        // ruleid: apex-ssrf
        req.setEndpoint(other);
    }
    public void safe() {
        HttpRequest req = new HttpRequest();
        // ok: apex-ssrf
        req.setEndpoint('https://example.com');
        // ok: apex-ssrf
        req.setEndpoint('https://safe.example.com/api');
        // ok: apex-ssrf
        req.setEndpoint('https://example.com/health');
    }
}
