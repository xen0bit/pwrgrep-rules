import java.security.MessageDigest;

public class Md5Password {
    Store store;

    public void vuln(String pw) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(pw.getBytes());
        // ruleid: md5-used-as-password
        store.savePassword(digest);
    }

    public void vulnAgain(String pw) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] hash = md.digest(pw.getBytes());
        // ruleid: md5-used-as-password
        store.savePassword(hash);
    }

    public void vulnThird(String pw) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] sum = md.digest(pw.getBytes());
        // ruleid: md5-used-as-password
        store.updatePassword(sum);
    }

    public void safe(String pw) throws Exception {
        // ok: md5-used-as-password
        store.savePassword("changeme");
    }

    public void safeAgain(String pw) {
        // ok: md5-used-as-password
        store.savePassword(pw);
    }

    public void plain(String pw) {
        // ok: md5-used-as-password
        System.out.println(pw);
    }
}
