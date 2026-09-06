// CWE-89: SOQL Injection – user input in Database.query without sanitization
// allows attackers to inject SOQL. Variable vs literal distinction.

public class TestCWE89 {
    public void vuln(String userInput, String other) {
        // ruleid: apex-soql-injection
        Database.query(userInput);
        // ruleid: apex-soql-injection
        Database.query(other);
        // ruleid: apex-soql-injection
        Database.query(userInput);
        // ruleid: apex-soql-injection
        Database.query(other);
    }
    public void safe() {
        // ok: apex-soql-injection
        Database.query('SELECT * FROM Account WHERE Id = \'001\'');
        // ok: apex-soql-injection
        Database.query('SELECT Id FROM Contact LIMIT 10');
        // ok: apex-soql-injection
        Database.query('SELECT Name FROM Account WHERE Name = :safeVar');
    }
}
