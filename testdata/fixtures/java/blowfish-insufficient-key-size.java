import javax.crypto.KeyGenerator;

public class BlowfishKeySize {
    public void vuln() throws Exception {
        // ruleid: blowfish-insufficient-key-size
        KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
        kg.init(64);
    }

    public void vulnAgain() throws Exception {
        // ruleid: blowfish-insufficient-key-size
        KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
        kg.init(32);
    }

    public void vulnThird() throws Exception {
        // ruleid: blowfish-insufficient-key-size
        KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
        kg.init(64);
    }

    public void safe() throws Exception {
        // ok: blowfish-insufficient-key-size
        KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
        kg.init(128);
    }

    public void safeAgain() throws Exception {
        // ok: blowfish-insufficient-key-size
        KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
        kg.init(256);
    }

    public void plain() {
        // ok: blowfish-insufficient-key-size
        System.out.println("init in a comment is not a call");
    }
}
