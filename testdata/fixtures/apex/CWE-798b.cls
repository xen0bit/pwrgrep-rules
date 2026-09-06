// CWE-798: Hard-coded Credentials in Apex
// Apex strings use single quotes; a credential literal contains a digit and is assigned
// to a name like password, apiKey, secret, token.

public class TestCWE798b {
    public void vuln() {
        // ruleid: apex-hardcoded-secret
        String password = 'hunter2';
        // ruleid: apex-hardcoded-secret
        String apiKey = 'ak_s3cr3tKey99';
        // ruleid: apex-hardcoded-secret
        String secret = 's3cr3t99';
        // ruleid: apex-hardcoded-secret
        String privateKey = 'priv4t3k3y123';
        // ruleid: apex-hardcoded-secret
        String token = 'tok3n1234';
        // ruleid: apex-hardcoded-secret
        String token2 = 'tok3n1234';
    }
    public void safe() {
        // ok: apex-hardcoded-secret
        String password = 'password';
        // ok: apex-hardcoded-secret
        String apiKey = 'API_KEY';
        // ok: apex-hardcoded-secret
        String username = 'hunter2';
        // ok: apex-hardcoded-secret
        String secret = '';
        // ok: apex-hardcoded-secret
        String description = 'user token is required';
    }
}
