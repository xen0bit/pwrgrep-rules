import javax.crypto.Cipher;

public class DefaultAes {
    public void vuln() throws Exception {
        // ruleid: use-of-default-aes
        javax.crypto.Cipher.getInstance("AES");
    }

    public void vulnAgain() throws Exception {
        // ruleid: use-of-default-aes
        javax.crypto.Cipher.getInstance("AES");
    }

    public void vulnThird() throws Exception {
        // ruleid: use-of-default-aes
        javax.crypto.Cipher.getInstance("AES");
    }

    public void safe() throws Exception {
        // ok: use-of-default-aes
        javax.crypto.Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() throws Exception {
        // ok: use-of-default-aes
        javax.crypto.Cipher.getInstance("AES/CBC/PKCS5Padding");
    }

    public void plain() {
        // ok: use-of-default-aes
        System.out.println("AES in a comment is not use");
    }
}
