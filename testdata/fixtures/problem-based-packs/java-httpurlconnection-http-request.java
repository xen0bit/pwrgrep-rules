// CWE-319: cleartext HTTP via HttpURLConnection. http:// URLs flag;
// https stays quiet.
import java.net.URL;
import java.net.URLConnection;
import java.net.HttpURLConnection;

public class TestHttpUrlConnection {
    public void vuln1() throws Exception {
        // ruleid: httpurlconnection-http-request
        URL url = new URL("http://example.com");
        URLConnection conn = url.openConnection();
        conn.connect();
    }

    public void vuln2() throws Exception {
        // ruleid: httpurlconnection-http-request
        URL url2 = new URL("http://example.com/api");
        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        conn2.getResponseCode();
    }

    public void safe() throws Exception {
        // ok: httpurlconnection-http-request
        URL url3 = new URL("https://example.com");
        URLConnection conn3 = url3.openConnection();
        // ok: httpurlconnection-http-request
        conn3.connect();
    }
}
