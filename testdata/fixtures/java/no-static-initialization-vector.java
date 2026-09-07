import javax.crypto.spec.IvParameterSpec;

public class StaticIv {
    private byte[] fieldIv = {9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9};

    public void local() {
        byte[] iv = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
        // ruleid: no-static-initialization-vector
        IvParameterSpec spec = new IvParameterSpec(iv);
    }

    public void field() {
        // ruleid: no-static-initialization-vector
        IvParameterSpec spec = new IvParameterSpec(fieldIv);
    }

    public void random(java.security.SecureRandom r) {
        byte[] iv = new byte[16];
        r.nextBytes(iv);
        // ok: no-static-initialization-vector
        IvParameterSpec spec = new IvParameterSpec(iv);
    }

    public void param(byte[] other) {
        // ok: no-static-initialization-vector
        IvParameterSpec spec = new IvParameterSpec(other);
    }
}
