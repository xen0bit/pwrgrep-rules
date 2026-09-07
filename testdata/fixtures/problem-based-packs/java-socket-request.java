// CWE-319: cleartext sockets to http/telnet/ftp endpoints. Scheme-ful hosts
// flag; bare hostnames and other schemes stay quiet.
import java.net.Socket;
import java.io.PrintWriter;

public class TestSocket {
    public void vuln1() throws Exception {
        // ruleid: socket-request
        Socket s = new Socket("http://example.com", 80);
        PrintWriter out = new PrintWriter(s.getOutputStream(), true);
        out.println("hi");
    }

    public void vuln2() throws Exception {
        // ruleid: socket-request
        Socket s2 = new Socket("telnet://example.com", 23);
        PrintWriter out2 = new PrintWriter(s2.getOutputStream(), true);
        out2.println("hi");
    }

    public void safe() throws Exception {
        // ok: socket-request
        Socket s3 = new Socket("example.com", 80);
        PrintWriter out3 = new PrintWriter(s3.getOutputStream(), true);
        // ok: socket-request
        out3.println("hi");
    }
}
