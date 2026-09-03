package fixture;

// CWE-798: the password is in the source.
//
// A password in a `getConnection` call is in version control, in the build
// artifact, and readable out of the jar with `strings`. Nobody can rotate it
// without a release, everybody who has ever checked the repository out still
// knows it, and it is almost always the same password on staging and on
// production because that is the point of writing it down.
//
// The rule reports a literal in a credential position and nothing else. What
// it deliberately does not report:
//
//   - the empty string, which is a local development database with no
//     password and is not a secret that leaked;
//   - `${db.password}`, which is a Spring placeholder and names a value that
//     lives somewhere else - reporting it would train people to skip this
//     rule on exactly the codebases that got it right.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

class Cwe798 {

    // The spelling people actually write, and the one that used to be out of
    // reach: a declaration read as a field rather than as a local.
    // ruleid: java-credential-is-a-literal
    private static final String DB_PASSWORD = "s3cr3t-prod-pw";

    // A name for somewhere the value lives is the fix, not the bug.
    // ok: java-credential-is-a-literal
    private static final String PASSWORD_ENV = "APP_DB_PASSWORD";

    // A constant that names a form field is not a password.
    // ok: java-credential-is-a-literal
    private static final String PASSWORD_PARAM = "j_password";

    // A local called `password` holding a literal is a value in flight, which
    // is what test data looks like. The credential this rule is about is the
    // one declared on the class.
    Connection connectWithLocals() throws SQLException {
        String username = "app";
        // ok: java-credential-is-a-literal
        String password = "letmein-for-the-test";
        return DriverManager.getConnection("jdbc:h2:mem:test", username, password);
    }

    Connection connect() throws SQLException {
        // ruleid: java-credential-is-a-literal
        return DriverManager.getConnection("jdbc:postgresql://db/app", "app", "s3cr3t-prod-pw");
    }

    void configure(org.apache.commons.dbcp2.BasicDataSource source) {
        source.setUsername("app");
        // ruleid: java-credential-is-a-literal
        source.setPassword("s3cr3t-prod-pw");
    }

    Properties properties() {
        Properties properties = new Properties();
        properties.setProperty("user", "app");
        // ruleid: java-credential-is-a-literal
        properties.setProperty("password", "s3cr3t-prod-pw");
        return properties;
    }

    // A local database with no password is not a secret that leaked.
    Connection connectLocally() throws SQLException {
        // ok: java-credential-is-a-literal
        return DriverManager.getConnection("jdbc:h2:mem:test", "sa", "");
    }

    // A placeholder names a value that lives somewhere else, which is the fix.
    void configureFromProperties(org.apache.commons.dbcp2.BasicDataSource source) {
        // ok: java-credential-is-a-literal
        source.setPassword("${db.password}");
    }

    // Read at run time from the environment, which is also the fix.
    Connection connectFromEnvironment() throws SQLException {
        // ok: java-credential-is-a-literal
        return DriverManager.getConnection(System.getenv("JDBC_URL"), System.getenv("DB_USER"),
                System.getenv("DB_PASSWORD"));
    }
}
