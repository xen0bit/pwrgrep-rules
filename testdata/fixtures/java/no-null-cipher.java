import javax.crypto.NullCipher;

public class NullCipherUse {
    public void vuln() {
        // ruleid: no-null-cipher
        Object c = new NullCipher();
    }

    public void vulnAgain() {
        // ruleid: no-null-cipher
        Object c = new NullCipher();
    }

    public void vulnThird() {
        // ruleid: no-null-cipher
        Object c = new javax.crypto.NullCipher();
    }

    public void safe() {
        // ok: no-null-cipher
        Object c = new Object();
    }

    public void safeAgain() {
        // ok: no-null-cipher
        System.out.println("NullCipher in a comment is not use");
    }

    public void plain() {
        // ok: no-null-cipher
        String name = "NullCipher";
    }
}
