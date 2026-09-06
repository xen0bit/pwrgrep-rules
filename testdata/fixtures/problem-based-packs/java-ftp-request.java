// CWE-319: Cleartext Transmission of Sensitive Information via FTP
// FTP is cleartext and should use SFTP or FTPS

import org.apache.commons.net.ftp.FTPClient;
import java.net.URL;
import java.net.URLConnection;

public class TestFTPRequest {
    public void vuln1() throws Exception {
        // ruleid: ftp-request
        FTPClient ftp = new FTPClient();
        ftp.connect("ftp.example.com", 21);
    }

    public void vuln2() throws Exception {
        // ruleid: ftp-request
        FTPClient ftp2 = new FTPClient();
        ftp2.connect("ftp.example.com", 21);
    }

    public void vuln3() throws Exception {
        // ruleid: ftp-request
        FTPClient ftp3 = new FTPClient();
        ftp3.connect("ftp2.example.com");
    }

    public void vuln4() throws Exception {
        // ruleid: ftp-request
        FTPClient ftp4 = new FTPClient();
        ftp4.connect("192.168.1.1", 21);
    }

    public void safe1() throws Exception {
        // ok: ftp-request
        String url = "sftp://example.com/file.txt";
        // ok: ftp-request
        String safe = "https://example.com";
    }

    public void safe2() throws Exception {
        // ok: ftp-request
        URL safeUrl = new URL("https://example.com/file.txt");
        URLConnection c = safeUrl.openConnection();
    }
}
