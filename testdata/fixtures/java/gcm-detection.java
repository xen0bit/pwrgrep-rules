import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;

public class GcmDetect {
    public void vuln() throws Exception {
        // ruleid: gcm-detection
        Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void vulnSpec(byte[] iv) {
        // ruleid: gcm-detection
        Object o = new GCMParameterSpec(128, iv);
    }

    public void vulnAgain() throws Exception {
        // ruleid: gcm-detection
        Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safe() throws Exception {
        // ok: gcm-detection
        Cipher.getInstance("AES/CBC/PKCS5Padding");
    }

    public void safeAgain() {
        // ok: gcm-detection
        System.out.println("GCM in a comment is not use");
    }

    public void plain() {
        // ok: gcm-detection
        String mode = "CBC";
    }
}
