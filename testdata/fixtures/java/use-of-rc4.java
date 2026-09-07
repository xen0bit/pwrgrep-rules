import javax.crypto.Cipher;

public class Rc4Use {
    public void vuln() throws Exception {
        // ruleid: use-of-rc4
        Cipher c = Cipher.getInstance("RC4");
    }

    public void vulnAgain() throws Exception {
        // ruleid: use-of-rc4
        Cipher c = Cipher.getInstance("RC4");
    }

    public void vulnThird() throws Exception {
        // ruleid: use-of-rc4
        Cipher c = Cipher.getInstance("RC4");
    }

    public void safe() throws Exception {
        // ok: use-of-rc4
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() {
        // ok: use-of-rc4
        System.out.println("RC4 in a comment is not use");
    }

    public void plain() {
        // ok: use-of-rc4
        String algo = "ChaCha20";
    }
}
