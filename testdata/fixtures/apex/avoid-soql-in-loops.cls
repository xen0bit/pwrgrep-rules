// SOQL inside loops hits the query governor limit. Query once outside
// the loop and iterate the results instead.
public class AvoidSoqlInLoops {
    public void vuln(List<Account> accs) {
        for (Account a : accs) {
            // ruleid: avoid-soql-in-loops
            List<Account> x = [SELECT Id FROM Account];
        }
        for (Account a : accs) {
            // ruleid: avoid-soql-in-loops
            List<Contact> y = [SELECT Id FROM Contact];
        }
        while (accs.isEmpty() == false) {
            // ruleid: avoid-soql-in-loops
            List<Lead> z = [SELECT Id FROM Lead];
            break;
        }
    }
    public void safe() {
        // ok: avoid-soql-in-loops
        List<Account> x = [SELECT Id FROM Account];
        for (Integer i = 0; i < 3; i++) {
            String s = 'fixed';
        }
        // ok: avoid-soql-in-loops
        List<Contact> y = [SELECT Id FROM Contact LIMIT 10];
        // ok: avoid-soql-in-loops
        Integer n = [SELECT COUNT() FROM Account];
    }
}
