import java.net.Socket;
import java.net.ServerSocket;

public class UnencryptedSocket {
    public void vuln() throws Exception {
        // ruleid: unencrypted-socket
        Socket s = new Socket("example.com", 80);
    }

    public void vulnAgain() throws Exception {
        // ruleid: unencrypted-socket
        Socket s = new Socket("example.com", 8080);
    }

    public void vulnServer() throws Exception {
        // ruleid: unencrypted-socket
        ServerSocket ss = new ServerSocket(8080);
    }

    public void safe() throws Exception {
        // ok: unencrypted-socket
        javax.net.ssl.SSLSocketFactory f = null;
    }

    public void safeAgain() {
        // ok: unencrypted-socket
        System.out.println("Socket in a comment is not use");
    }

    public void plain(String host) {
        // ok: unencrypted-socket
        System.out.println(host);
    }
}
