// CWE-319: cleartext HTTP via java.net.http.HttpClient. http:// URLs flag;
// https stays quiet.
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.URI;

public class TestHttpClient {
    public void vuln1() throws Exception {
        HttpClient client = HttpClient.newHttpClient();
        // ruleid: httpclient-http-request
        HttpRequest req = HttpRequest.newBuilder(URI.create("http://example.com")).build();
        client.send(req, null);
    }

    public void vuln2() throws Exception {
        HttpClient client2 = HttpClient.newHttpClient();
        // ruleid: httpclient-http-request
        HttpRequest req2 = HttpRequest.newBuilder(URI.create("http://example.com/api")).build();
        client2.sendAsync(req2, null);
    }

    public void safe() throws Exception {
        HttpClient client3 = HttpClient.newHttpClient();
        HttpRequest req3 = HttpRequest.newBuilder(URI.create("https://example.com")).build();
        // ok: httpclient-http-request
        client3.send(req3, null);
        // ok: httpclient-http-request
        String note = "https://example.com";
    }
}
