import java.io.ObjectInputStream;
import java.io.InputStream;

public class ObjectDeser {
    public void vuln(InputStream in) throws Exception {
        // ruleid: object-deserialization
        Object o = new ObjectInputStream(in);
    }

    public void vulnAgain(InputStream in) throws Exception {
        // ruleid: object-deserialization
        Object o = new ObjectInputStream(in);
    }

    public void vulnThird(InputStream in) throws Exception {
        // ruleid: object-deserialization
        ObjectInputStream ois = new ObjectInputStream(in);
    }

    public void safe(InputStream in) {
        // ok: object-deserialization
        int b = 0;
    }

    public void safeAgain() {
        // ok: object-deserialization
        System.out.println("ObjectInputStream in a comment is not use");
    }

    public void plain(InputStream in) {
        // ok: object-deserialization
        System.out.println(in);
    }
}
