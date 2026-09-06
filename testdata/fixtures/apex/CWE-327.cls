// CWE-327: Use of a Broken or Risky Cryptographic Algorithm
// Hard-coded IV for Crypto.encrypt

public class TestCWE327 {
    public void vuln1() {
        // ruleid: bad-crypto
        Blob iv1 = Blob.valueOf('hardcoded_iv_12345');
        Blob enc1 = Crypto.encrypt('AES256', Blob.valueOf('key1'), iv1, Blob.valueOf('data1'));
    }
    public void vuln2() {
        // ruleid: bad-crypto
        Blob iv2 = Blob.valueOf('hardcoded_iv_67890');
        Blob enc2 = Crypto.encrypt('AES256', Blob.valueOf('key2'), iv2, Blob.valueOf('data2'));
    }

    public void safe1() {
        // ok: bad-crypto
        Blob iv = Crypto.generateAesKey(256);
        String s = 'safe';
    }
    public void safe2() {
        // ok: bad-crypto
        String t = 'also safe';
        System.assertEquals('a', 'a');
    }

    public void vuln3() {
        // ruleid: bad-crypto
        Blob iv3 = Blob.valueOf('hardcoded_iv_33333');
        Blob enc3 = Crypto.encrypt('AES256', Blob.valueOf('key3'), iv3, Blob.valueOf('data3'));
    }

    public void vuln4() {
        // ruleid: bad-crypto
        Blob iv4 = Blob.valueOf('hardcoded_iv_44444');
        Blob enc4 = Crypto.encrypt('AES256', Blob.valueOf('key4'), iv4, Blob.valueOf('data4'));
    }

    public void safe3() {
        // ok: bad-crypto
        Blob k = Crypto.generateAesKey(128);
        Blob iv = Crypto.generateAesKey(128);
    }
}
