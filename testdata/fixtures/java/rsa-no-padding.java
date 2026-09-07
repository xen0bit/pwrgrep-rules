import javax.crypto.Cipher;

public class RsaNoPadding {
    public void vuln() throws Exception {
        // ruleid: rsa-no-padding
        Cipher c = Cipher.getInstance("RSA/ECB/NoPadding");
    }

    public void vulnAgain() throws Exception {
        // ruleid: rsa-no-padding
        Cipher c = Cipher.getInstance("RSA/None/NoPadding");
    }

    public void vulnThird() throws Exception {
        // ruleid: rsa-no-padding
        Cipher c = Cipher.getInstance("RSA/ECB/NoPadding");
    }

    public void safe() throws Exception {
        // ok: rsa-no-padding
        Cipher c = Cipher.getInstance("RSA/ECB/OAEPWithSHA-256AndMGF1Padding");
    }

    public void safeAgain() throws Exception {
        // ok: rsa-no-padding
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void plain() {
        // ok: rsa-no-padding
        System.out.println("NoPadding in a comment is not use");
    }
}
