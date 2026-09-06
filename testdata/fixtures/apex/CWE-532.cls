// CWE-532: Insertion of Sensitive Information into Log File
// System.debug can leak sensitive data and consumes CPU even when not captured

public class TestCWE532 {
    public void vuln(String userInput, String password) {
        // ruleid: system-debug
        System.debug('User input: ' + userInput);
        // ruleid: system-debug
        System.debug(password);
    }

    public void safe(String fixed) {
        // ok: system-debug
        String log = 'Fixed string';
        // ok: system-debug
        System.assertEquals('a', 'a');
    }
}
    public void vuln2(String apiKey, String token) {
        // ruleid: system-debug
        System.debug('apiKey=' + apiKey);
        // ruleid: system-debug
        System.debug(token);
    }

    public void safe2() {
        // ok: system-debug
        String safe = 'Fixed log';
        System.assertEquals('a', 'a');
    }
