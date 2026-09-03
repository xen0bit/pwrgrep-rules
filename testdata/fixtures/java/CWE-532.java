package fixture;

// CWE-532: the secret is now in the log file.
//
// A log line goes somewhere with different rules from the process that wrote
// it: a file that is world-readable, a shipper that forwards it to a search
// cluster the whole company can query, a support bundle attached to a ticket.
// A password written into one has left the security boundary the program was
// keeping it inside, and unlike a leak through a response it is retained, and
// indexed, and backed up.
//
// The rule reports the value and not the subject. `log.info("password
// changed")` says nothing anybody did not already know; the test that
// separates the two is that the argument is not entirely a literal, which is
// exactly the difference between naming a secret and printing one.
//
// The slf4j placeholder form needs both halves to look like a secret, because
// `log.info("password reset for {}", user)` and `log.info("password {}", pw)`
// have the same shape and only one of them is a finding.

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class Cwe532 {

    private static final Logger log = LoggerFactory.getLogger(Cwe532.class);

    void authenticate(String user, String password) {
        // ruleid: java-secret-written-to-the-log
        log.debug("authenticating " + user + " with password " + password);
    }

    void connect(String apiKey) {
        // ruleid: java-secret-written-to-the-log
        log.info("using api_key {}", apiKey);
    }

    void dump(String clientSecret) {
        // ruleid: java-secret-written-to-the-log
        System.out.println("client_secret=" + clientSecret);
    }

    // Says that a password exists, which is not the password.
    void report(String user) {
        // ok: java-secret-written-to-the-log
        log.info("password changed for " + user);
    }

    // The subject of the sentence is a secret; the value is a user's name.
    void reportReset(String user) {
        // ok: java-secret-written-to-the-log
        log.info("password reset for {}", user);
    }

    // Nothing here is a secret.
    void trace(String path) {
        // ok: java-secret-written-to-the-log
        log.trace("reading " + path);
    }
}
