// CWE-532: Insertion of Sensitive Information into Log File
//
// Logging a password or secret exposes it in log files which are often
// world-readable or shipped to third parties.

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class Cwe532_2 {
    private static final Logger logger = LoggerFactory.getLogger(Cwe532_2.class);

    void leak(String password, String secret, String apiKey) {
        // ruleid: java-sensitive-log
        logger.info(password);
        // ruleid: java-sensitive-log
        logger.debug(secret);
        // ruleid: java-sensitive-log
        System.out.println(apiKey);
    }

    void safe() {
        // ok: java-sensitive-log
        logger.info("user logged in");
        // ok: java-sensitive-log
        System.out.println("request processed");
        // ok: java-sensitive-log
        logger.debug("redacted");
    }
}
