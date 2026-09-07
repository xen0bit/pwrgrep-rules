import javax.crypto.spec.GCMParameterSpec;

public class GcmNonceReuse {
    public void vuln() throws Exception {
        // ruleid: gcm-nonce-reuse
        Object o = new GCMParameterSpec(128, "static".getBytes(), 0, 8);
    }

    public void vulnAgain() throws Exception {
        // ruleid: gcm-nonce-reuse
        Object o = new GCMParameterSpec(128, "other".getBytes(), 0, 8);
    }

    public void vulnThird() throws Exception {
        // ruleid: gcm-nonce-reuse
        Object o = new GCMParameterSpec(128, "third".getBytes(), 0, 8);
    }

    public void safe(byte[] nonce) throws Exception {
        // ok: gcm-nonce-reuse
        Object o = new GCMParameterSpec(128, nonce, 0, 8);
    }

    public void safeAgain() throws Exception {
        // ok: gcm-nonce-reuse
        Object o = new GCMParameterSpec(128, new byte[12], 0, 8);
    }

    public void plain() {
        // ok: gcm-nonce-reuse
        System.out.println("getBytes in a comment is not a call");
    }
}
