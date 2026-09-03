package fixture;

// CWE-321: the key is in the source, so it is in the repository.
//
// A key written into a class file is not a secret. It is in version control,
// in every build artifact, in the container image, and - because Java
// bytecode keeps string constants intact - readable with `strings` by anyone
// who has the jar. Everybody who ever cloned the repository has it, and it
// cannot be rotated without shipping a release.
//
// The same is true of a fixed initialisation vector, for a different reason:
// CBC and GCM both need the IV to be unpredictable per message, and a
// constant one makes identical plaintexts encrypt identically. In GCM a
// repeated nonce with the same key is worse than that - it hands over the
// authentication key.
//
// The rule reports the literal written into the call and the literal that
// reached it through a local. A `private static final byte[] KEY` cannot be
// reported, because a field declaration is not a shape a pattern in this
// engine can name - see the guide. That is the common spelling and it is the
// gap; the two here are the ones that are checkable.

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

class Cwe321 {

    Cipher encryptDirectly() throws Exception {
        // ruleid: java-key-from-a-literal
        SecretKeySpec key = new SecretKeySpec("hunter2istheworst".getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        return cipher;
    }

    Cipher encryptThroughALocal() throws Exception {
        String secret = "correct-horse-battery-staple";
        // ruleid: java-key-from-a-literal
        SecretKeySpec key = new SecretKeySpec(secret.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        return cipher;
    }

    IvParameterSpec fixedVector() {
        // ruleid: java-key-from-a-literal
        return new IvParameterSpec("0123456789abcdef".getBytes());
    }

    // A key that arrived from somewhere is a key this rule has nothing to say
    // about; whether that somewhere is a good place is a different question.
    Cipher encryptWithSuppliedKey(byte[] material) throws Exception {
        // ok: java-key-from-a-literal
        SecretKeySpec key = new SecretKeySpec(material, "AES");
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        return cipher;
    }

    // Read fresh for each message, which is what an IV is for.
    IvParameterSpec randomVector(java.security.SecureRandom random) {
        byte[] iv = new byte[16];
        random.nextBytes(iv);
        // ok: java-key-from-a-literal
        return new IvParameterSpec(iv);
    }
}
