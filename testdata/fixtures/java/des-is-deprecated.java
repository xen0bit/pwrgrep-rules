import javax.crypto.Cipher;

public class DesDeprecated {
    public void vuln() throws Exception {
        // ruleid: des-is-deprecated
        Cipher c = Cipher.getInstance("DES");
    }

    public void vulnAgain() throws Exception {
        // ruleid: des-is-deprecated
        Cipher c = Cipher.getInstance("DES");
    }

    public void vulnThird() throws Exception {
        // ruleid: des-is-deprecated
        Cipher c = Cipher.getInstance("DES");
    }

    public void safe() throws Exception {
        // ok: des-is-deprecated
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() throws Exception {
        // ok: des-is-deprecated
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    }

    public void plain() {
        // ok: des-is-deprecated
        System.out.println("DES in a comment is not use");
    }
}
