// An unescaped URL parameter flowing into a dynamic query lets an
// attacker inject SOQL. Escape it or use binding instead.
public class SoqlInjectionUnescapedUrlParam {
    public void vuln(String p) {
        String q = ApexPage.getCurrentPage().getParameters.get(p);
        // ruleid: soql-injection-unescaped-url-param
        Database.query(q, true);
    }
    public void vulnAgain(String r) {
        String s = ApexPage.getCurrentPage().getParameters.get(r);
        // ruleid: soql-injection-unescaped-url-param
        Database.query(s, true);
    }
    public void vulnThird(String t) {
        String u = ApexPage.getCurrentPage().getParameters.get(t);
        // ruleid: soql-injection-unescaped-url-param
        Database.query(u, true);
    }
    public void safe(String p) {
        String q = ApexPage.getCurrentPage().getParameters.get(p);
        // ok: soql-injection-unescaped-url-param
        Database.query(String.escapeSingleQuotes(q), true);
        // ok: soql-injection-unescaped-url-param
        Database.query('SELECT Id FROM Account', true);
        // ok: soql-injection-unescaped-url-param
        List<Account> x = [SELECT Id FROM Account];
    }
}
