// CWE-319: cleartext HTTP via Unirest. http:// URLs flag; https stays quiet.
import com.mashape.unirest.http.Unirest;

public class TestUnirest {
    public void vuln() {
        // ruleid: unirest-http-request
        Unirest.get("http://example.com");
        // ruleid: unirest-http-request
        Unirest.post("http://example.com/api");
    }

    public void safe() {
        // ok: unirest-http-request
        Unirest.get("https://example.com");
        // ok: unirest-http-request
        String note = "https://example.com";
    }
}
