import org.apache.commons.codec.digest.DigestUtils;

public class Md5DigestUtils {
    public byte[] vuln(byte[] data) {
        // ruleid: use-of-md5-digest-utils
        return DigestUtils.getMd5Digest().digest(data);
    }

    public byte[] vulnAgain(byte[] data) {
        // ruleid: use-of-md5-digest-utils
        return DigestUtils.getMd5Digest().digest(data);
    }

    public String vulnThird(String text) {
        // ruleid: use-of-md5-digest-utils
        return DigestUtils.getMd5Digest().digest(text.getBytes()).toString();
    }

    public byte[] safe(byte[] data) {
        // ok: use-of-md5-digest-utils
        return DigestUtils.getSha256Digest().digest(data);
    }

    public byte[] safeAgain(byte[] data) {
        // ok: use-of-md5-digest-utils
        return DigestUtils.getSha512Digest().digest(data);
    }

    public String plain() {
        // ok: use-of-md5-digest-utils
        return "getMd5Digest in a comment is not a call";
    }
}
