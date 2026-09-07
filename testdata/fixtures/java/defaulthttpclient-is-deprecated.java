import org.apache.http.impl.client.DefaultHttpClient;

public class OldClient {
    public void vuln() {
        // ruleid: defaulthttpclient-is-deprecated
        Object c = new DefaultHttpClient();
    }

    public void vulnAgain() {
        // ruleid: defaulthttpclient-is-deprecated
        Object c = new DefaultHttpClient();
    }

    public void vulnThird() {
        // ruleid: defaulthttpclient-is-deprecated
        Object c = new DefaultHttpClient();
    }

    public void safe() {
        // ok: defaulthttpclient-is-deprecated
        Object c = new Object();
    }

    public void safeAgain() {
        // ok: defaulthttpclient-is-deprecated
        System.out.println("DefaultHttpClient in a comment is not use");
    }

    public void plain() {
        // ok: defaulthttpclient-is-deprecated
        String name = "DefaultHttpClient";
    }
}
