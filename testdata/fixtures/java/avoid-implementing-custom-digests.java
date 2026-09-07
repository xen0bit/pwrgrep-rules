import java.security.MessageDigest;

// ruleid: avoid-implementing-custom-digests
public class CustomDigest extends MessageDigest {
    public CustomDigest() {
        super("custom");
    }
}

// ruleid: avoid-implementing-custom-digests
class AnotherDigest extends MessageDigest {
    AnotherDigest() {
        super("another");
    }
}

// ruleid: avoid-implementing-custom-digests
class ThirdDigest extends MessageDigest {
    ThirdDigest() {
        super("third");
    }
}

// ok: avoid-implementing-custom-digests
class PlainHelper {
    public String help() {
        return "not a digest";
    }
}

// ok: avoid-implementing-custom-digests
class UsesDigest {
    public byte[] hash(byte[] data) throws Exception {
        return MessageDigest.getInstance("SHA-256").digest(data);
    }
}

// ok: avoid-implementing-custom-digests
class Empty {
}
