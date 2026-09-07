// CWE-319: cleartext FTP via Spring. The session factory only speaks FTP,
// so every configured host is a finding. Non-FTP clients stay quiet.
import org.springframework.integration.ftp.session.DefaultFtpSessionFactory;
import org.springframework.web.client.RestTemplate;

public class TestSpringFtp {
    public void vuln1() {
        // ruleid: spring-ftp-request
        DefaultFtpSessionFactory sf = new DefaultFtpSessionFactory();
        sf.setHost("ftp.example.com");
        sf.getSession();
    }

    public void vuln2() {
        // ruleid: spring-ftp-request
        DefaultFtpSessionFactory sf2 = new DefaultFtpSessionFactory();
        String u = "ftp2.example.com";
        sf2.setHost(u);
        sf2.getSession();
    }

    public void safe() {
        // ok: spring-ftp-request
        RestTemplate rt = new RestTemplate();
        // ok: spring-ftp-request
        rt.getForObject("https://example.com", String.class);
    }
}
