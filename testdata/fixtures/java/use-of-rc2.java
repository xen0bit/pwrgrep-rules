import javax.crypto.Cipher;

public class Rc2Use {
    public void vuln() throws Exception {
        // ruleid: use-of-rc2
        Cipher c = Cipher.getInstance("RC2");
    }

    public void vulnAgain() throws Exception {
        // ruleid: use-of-rc2
        Cipher c = Cipher.getInstance("RC2");
    }

    public void vulnThird() throws Exception {
        // ruleid: use-of-rc2
        Cipher c = Cipher.getInstance("RC2");
    }

    public void safe() throws Exception {
        // ok: use-of-rc2
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() {
        // ok: use-of-rc2
        System.out.println("RC2 in a comment is not use");
    }

    public void plain() {
        // ok: use-of-rc2
        String algo = "ChaCha20";
    }
}
