package fixture;

// CWE-327: Use of a Broken or Risky Cryptographic Algorithm - MD5/SHA1

import java.security.MessageDigest;

class Cwe327WeakHash {

    byte[] md5(byte[] data) throws Exception {
        // ruleid: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("MD5");
        return md.digest(data);
    }

    byte[] sha1(byte[] data) throws Exception {
        // ruleid: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("SHA1");
        return md.digest(data);
    }

    byte[] sha256(byte[] data) throws Exception {
        // ok: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(data);
    }

    byte[] sha512(byte[] data) throws Exception {
        // ok: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("SHA-512");
        return md.digest(data);
    }
}
    byte[] md5Again(byte[] data) throws Exception {
        // ruleid: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("MD5");
        return md.digest(data);
    }

    byte[] sha1Again(byte[] data) throws Exception {
        // ruleid: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        return md.digest(data);
    }

    byte[] sha256b(byte[] data) throws Exception {
        // ok: java-weak-hash
        MessageDigest md = MessageDigest.getInstance("SHA-384");
        return md.digest(data);
    }
