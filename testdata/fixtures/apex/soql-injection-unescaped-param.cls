// A method parameter flowing into a dynamic query without escaping lets
// an attacker inject SOQL. Escape it or use binding instead.
public class SoqlInjectionUnescapedParam {
    public void vuln(String name) {
        // ruleid: soql-injection-unescaped-param
        Database.query(name);
    }
    public void vulnAgain(String other) {
        // ruleid: soql-injection-unescaped-param
        Database.query(other);
    }
    public void vulnThird(String third) {
        // ruleid: soql-injection-unescaped-param
        Database.query(third);
    }
    public void safe(String name) {
        // ok: soql-injection-unescaped-param
        Database.query(String.escapeSingleQuotes(name));
        // ok: soql-injection-unescaped-param
        Database.query('SELECT Id FROM Account');
        // ok: soql-injection-unescaped-param
        List<Account> x = [SELECT Id FROM Account];
    }
}
