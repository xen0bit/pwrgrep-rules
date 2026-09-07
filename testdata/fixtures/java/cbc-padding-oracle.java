import javax.crypto.Cipher;

public class CbcPaddingOracle {
    public void vuln() throws Exception {
        // ruleid: cbc-padding-oracle
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    }

    public void vulnAgain() throws Exception {
        // ruleid: cbc-padding-oracle
        Cipher c = Cipher.getInstance("DES/CBC/PKCS5Padding");
    }

    public void vulnThird() throws Exception {
        // ruleid: cbc-padding-oracle
        Cipher c = Cipher.getInstance("Blowfish/CBC/PKCS5Padding");
    }

    public void safe() throws Exception {
        // ok: cbc-padding-oracle
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
    }

    public void safeAgain() throws Exception {
        // ok: cbc-padding-oracle
        Cipher c = Cipher.getInstance("AES/CBC/NoPadding");
    }

    public void plain() {
        // ok: cbc-padding-oracle
        System.out.println("CBC in a comment is not use");
    }
}
