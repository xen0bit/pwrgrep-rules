import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;

public class DesedeDeprecated {
    public void vuln() throws Exception {
        // ruleid: desede-is-deprecated
        javax.crypto.KeyGenerator.getInstance("DESede");
    }

    public void vulnAgain() throws Exception {
        // ruleid: desede-is-deprecated
        javax.crypto.KeyGenerator.getInstance("DESede");
    }

    public void vulnThird() throws Exception {
        // ruleid: desede-is-deprecated
        javax.crypto.KeyGenerator.getInstance("DES");
    }

    public void safe() throws Exception {
        // ok: desede-is-deprecated
        javax.crypto.KeyGenerator.getInstance("AES");
    }

    public void safeAgain() throws Exception {
        // ok: desede-is-deprecated
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void plain() {
        // ok: desede-is-deprecated
        System.out.println("DESede in a comment is not use");
    }
}
