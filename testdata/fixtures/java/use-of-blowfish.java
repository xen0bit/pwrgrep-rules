import javax.crypto.Cipher;

public class BlowfishUse {
    public void vuln() throws Exception {
        // ruleid: use-of-blowfish
        Cipher c = Cipher.getInstance("Blowfish");
    }

    public void vulnAgain() throws Exception {
        // ruleid: use-of-blowfish
        Cipher c = Cipher.getInstance("Blowfish");
    }

    public void vulnThird() throws Exception {
        // ruleid: use-of-blowfish
        Cipher c = Cipher.getInstance("Blowfish");
    }

    public void safe() throws Exception {
        // ok: use-of-blowfish
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() {
        // ok: use-of-blowfish
        System.out.println("Blowfish in a comment is not use");
    }

    public void plain() {
        // ok: use-of-blowfish
        String algo = "Twofish";
    }
}
