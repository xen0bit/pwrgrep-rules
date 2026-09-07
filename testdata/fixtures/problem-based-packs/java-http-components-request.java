// CWE-319: cleartext HTTP via Apache HttpComponents. http:// URLs flag;
// https stays quiet.
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;

public class TestHttpComponents {
    public void vuln1() throws Exception {
        // ruleid: http-components-request
        HttpClient hc = HttpClients.createDefault();
        HttpGet hg = new HttpGet("http://example.com");
        hc.execute(hg);
    }

    public void vuln2() throws Exception {
        // ruleid: http-components-request
        HttpClient hc2 = HttpClients.createDefault();
        hc2.execute(new HttpPost("http://example.com/api"));
    }

    public void safe() throws Exception {
        HttpClient hc3 = HttpClients.createDefault();
        HttpGet hg3 = new HttpGet("https://example.com");
        // ok: http-components-request
        hc3.execute(hg3);
        // ok: http-components-request
        String note = "https://example.com";
    }
}
