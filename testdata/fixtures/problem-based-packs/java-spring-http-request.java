// CWE-319: cleartext HTTP via Spring RestTemplate. http:// URLs flag;
// https stays quiet.
import org.springframework.web.client.RestTemplate;
import java.net.URI;

public class TestSpringHttp {
    public void vuln1() {
        // ruleid: spring-http-request
        RestTemplate rt = new RestTemplate();
        rt.getForObject("http://example.com", String.class);
    }

    public void vuln2() {
        // ruleid: spring-http-request
        RestTemplate rt2 = new RestTemplate();
        String u = "http://example.com/api";
        rt2.postForObject(u, null, String.class);
    }

    public void safe() {
        RestTemplate rt3 = new RestTemplate();
        // ok: spring-http-request
        rt3.getForObject("https://example.com", String.class);
        // ok: spring-http-request
        String note = "https://example.com";
    }
}
