import java.security.MessageDigest;

public class BadHexa {
    public String convert(byte[] digest) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] out = md.digest(digest);
        StringBuilder sb = new StringBuilder();
        for (byte b : out) {
            // ruleid: bad-hexa-conversion
            sb.append(Integer.toHexString(b));
        }
        return sb.toString();
    }

    public String convertFirst(byte[] digest) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        byte[] out = md.digest(digest);
        // ruleid: bad-hexa-conversion
        return Integer.toHexString(out[0] & 0xFF);
    }

    public String plainInt(int x) {
        // ok: bad-hexa-conversion
        return Integer.toHexString(x);
    }

    public byte[] digestOnly(byte[] digest) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        // ok: bad-hexa-conversion
        return md.digest(digest);
    }
}
