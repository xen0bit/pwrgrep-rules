import java.security.KeyPairGenerator;

public class WeakRsaKey {
    public void vuln() throws Exception {
        // ruleid: use-of-weak-rsa-key
        KeyPairGenerator key = KeyPairGenerator.getInstance("RSA");
        key.initialize(1024);
    }

    public void vulnAgain() throws Exception {
        // ruleid: use-of-weak-rsa-key
        KeyPairGenerator key = KeyPairGenerator.getInstance("RSA");
        key.initialize(512);
    }

    public void vulnThird() throws Exception {
        // ruleid: use-of-weak-rsa-key
        KeyPairGenerator key = KeyPairGenerator.getInstance("RSA");
        key.initialize(1024);
    }

    public void safe() throws Exception {
        // ok: use-of-weak-rsa-key
        KeyPairGenerator key = KeyPairGenerator.getInstance("RSA");
        key.initialize(2048);
    }

    public void safeAgain() throws Exception {
        // ok: use-of-weak-rsa-key
        KeyPairGenerator key = KeyPairGenerator.getInstance("RSA");
        key.initialize(4096);
    }

    public void plain() {
        // ok: use-of-weak-rsa-key
        System.out.println("initialize in a comment is not a call");
    }
}
