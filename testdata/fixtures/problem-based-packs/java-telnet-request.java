// CWE-319: Cleartext Transmission — telnet
import org.apache.commons.net.telnet.TelnetClient;
import java.net.Socket;
import javax.net.ssl.SSLSocketFactory;
public class TestTelnet {
    void vuln1() throws Exception {
        TelnetClient telnet;
        // ruleid: telnet-request
        telnet = new TelnetClient();
        telnet.connect("example.com", 23);
        TelnetClient telnet2;
        // ruleid: telnet-request
        telnet2 = new TelnetClient();
        telnet2.connect("192.168.1.1", 23);
        TelnetClient telnet3;
        // ruleid: telnet-request
        telnet3 = new TelnetClient();
        telnet3.connect("10.0.0.1", 23);
        TelnetClient telnet4;
        // ruleid: telnet-request
        telnet4 = new TelnetClient();
        telnet4.connect("telnet.example.com", 23);
    }
    void safe() throws Exception {
        // ok: telnet-request
        Socket s1 = new Socket("example.com", 22);
        // ok: telnet-request
        Socket s2 = SSLSocketFactory.getDefault().createSocket("example.com", 443);
        // ok: telnet-request
        System.out.println("using ssh not telnet");
    }
}
