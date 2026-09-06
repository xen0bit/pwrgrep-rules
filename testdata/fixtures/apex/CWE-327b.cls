// CWE-327: Weak Crypto in Apex – AES128/MD5/DES etc are not strong
// Crypto.encrypt with literal weak algorithm name is vulnerable.

public class TestCWE327b {
    public void vuln() {
        Blob key = Blob.valueOf('0123456789abcdef');
        Blob iv = Blob.valueOf('abcdef0123456789');
        // ruleid: apex-weak-crypto
        Blob e1 = Crypto.encrypt('AES128', key, iv, Blob.valueOf('data'));
        // ruleid: apex-weak-crypto
        Blob e2 = Crypto.decrypt('DES', key, iv, Blob.valueOf('data'));
        // ruleid: apex-weak-crypto
        Blob e3 = Crypto.encryptWithManagedIV('MD5', key, Blob.valueOf('x'));
    }
    public void safe() {
        Blob key = Crypto.generateAesKey(256);
        Blob iv = Blob.valueOf('randomiv12345678');
        // ok: apex-weak-crypto
        Blob e1 = Crypto.encrypt('AES256', key, iv, Blob.valueOf('data'));
        // ok: apex-weak-crypto
        Blob e2 = Crypto.decrypt('AES256', key, iv, Blob.valueOf('data'));
        // ok: apex-weak-crypto
        Blob e3 = Crypto.encryptWithManagedIV('AES256', key, Blob.valueOf('x'));
    }
}
