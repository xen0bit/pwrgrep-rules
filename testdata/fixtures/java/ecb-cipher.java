import javax.crypto.Cipher;

public class EcbCipher {
    public void vuln() throws Exception {
        // ruleid: ecb-cipher
        Cipher c = Cipher.getInstance("AES/ECB/PKCS5Padding");
    }

    public void vulnAgain() throws Exception {
        // ruleid: ecb-cipher
        Cipher c = Cipher.getInstance("DES/ECB/NoPadding");
    }

    public void vulnThird() throws Exception {
        // ruleid: ecb-cipher
        Cipher c = Cipher.getInstance("RSA/ECB/NoPadding");
    }

    public void safe() throws Exception {
        // ok: ecb-cipher
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() throws Exception {
        // ok: ecb-cipher
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    }

    public void plain() {
        // ok: ecb-cipher
        System.out.println("ECB in a comment is not use");
    }
}
