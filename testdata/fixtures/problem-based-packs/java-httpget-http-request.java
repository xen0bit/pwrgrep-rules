// CWE-319: cleartext HTTP via HttpGet. http:// URLs flag; https stays quiet.
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.methods.HttpGet;

public class TestHttpGet {
    public void vuln1() throws Exception {
        // ruleid: httpget-http-request
        HttpGet hg = new HttpGet("http://example.com");
        HttpClient hc = HttpClients.createDefault();
        hc.execute(hg);
    }

    public void vuln2() throws Exception {
        HttpClient hc2 = HttpClients.createDefault();
        // ruleid: httpget-http-request
        hc2.execute(new HttpGet("http://example.com/api"));
    }

    public void safe() throws Exception {
        HttpGet hg3 = new HttpGet("https://example.com");
        HttpClient hc3 = HttpClients.createDefault();
        // ok: httpget-http-request
        hc3.execute(hg3);
        // ok: httpget-http-request
        String note = "https://example.com";
    }
}
